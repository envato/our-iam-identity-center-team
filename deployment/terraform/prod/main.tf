provider "aws" {
  alias  = "dns"
  region = "us-east-1"

  assume_role {
    role_arn     = var.route53_role_arn
    session_name = "TerraformRoute53Session"
  }
}

locals {
  envato_cloudtrail_lake = "arn:aws:cloudtrail:us-east-1:866397960475:eventdatastore/cc7c8abb-cbb8-496a-baf2-705550de679b"
}

module "amplify_prod" {
  source = "../modules/amplify"

  branch_env               = "main"
  service_role             = "arn:aws:iam::221082199185:role/team-amplify"
  cloudtrail_audit_logs    = local.envato_cloudtrail_lake
  sso_login                = "https://envatoaws.awsapps.com/start"
  tags                     = "project=iam-identity-center-team environment=prod"
  team_account             = "221082199185"
  team_admin_group         = "Okta-App-AWS-Team-Admin"
  team_auditor_group       = "Okta-App-AWS-Team-Auditor"
  custom_domain            = var.custom_domain
  access_token             = var.github_access_token
  branch_enable_auto_build = true

  backend_deployment_artifacts = "amplify-teamidcapp-main-2f6fk-deployment"
  backend_stack_name           = "amplify-teamidcapp-main-2f6fk"
}

# ACM Certificate for Custom Domain
resource "aws_acm_certificate" "app_cert" {
  domain_name               = var.custom_domain
  validation_method         = "DNS"
  subject_alternative_names = var.subject_alternative_names

  tags = {
    Name        = "AppSyncAppCertificate"
    project     = "iam-identity-center-team"
    environment = "prod"
  }
}

# Amplify Domain Association
resource "aws_amplify_domain_association" "app_domain" {
  app_id                = module.amplify_prod.amplify_app_id
  domain_name           = var.custom_domain
  wait_for_verification = false # Domain activation to global content delivery network could take up to 30 minutes.

  certificate_settings {
    custom_certificate_arn = aws_acm_certificate.app_cert.arn
    type                   = "CUSTOM"
  }

  sub_domain {
    branch_name = var.branch_env
    prefix      = "" # Attempt to leave it empty to use the root domain
  }

  depends_on = [aws_acm_certificate.app_cert]
}

# SES Domain Identity for custom domain
resource "aws_ses_domain_identity" "aws_team_domain" {
  domain = var.ses_domain
}

# SES DKIM for custom domain
resource "aws_ses_domain_dkim" "aws_team_domain_dkim" {
  domain = aws_ses_domain_identity.aws_team_domain.domain
}

# Local value to create a map for DKIM tokens
locals {
  dkim_tokens_map = {
    for i in range(3) :
    format("dkim_token_%d", i + 1) => aws_ses_domain_dkim.aws_team_domain_dkim.dkim_tokens[i]
  }
}

# Route 53 CNAME records for SES DKIM
resource "aws_route53_record" "ses_dkim_records" {
  provider = aws.dns
  for_each = local.dkim_tokens_map

  zone_id = var.hosted_zone_id
  name    = "${each.value}._domainkey.${aws_ses_domain_identity.aws_team_domain.domain}"
  type    = "CNAME"
  ttl     = 300
  records = ["${each.value}.dkim.amazonses.com"]
}

# SES MAIL FROM domain setup
resource "aws_ses_domain_mail_from" "mail_from" {
  domain                 = aws_ses_domain_identity.aws_team_domain.domain
  mail_from_domain       = "mail.${var.ses_domain}"
  behavior_on_mx_failure = "UseDefaultValue"
}

# Merged Route 53 TXT record for MAIL FROM domain (SPF and SES Verification)
resource "aws_route53_record" "mail_from_merged_txt_record" {
  provider = aws.dns
  zone_id  = var.hosted_zone_id
  name     = aws_ses_domain_mail_from.mail_from.mail_from_domain
  type     = "TXT"
  ttl      = 300
  records = [
    "v=spf1 include:amazonses.com -all",
    aws_ses_domain_identity.aws_team_domain.verification_token,
  ]
}

# Route 53 MX record for MAIL FROM domain
resource "aws_route53_record" "mail_from_mx_record" {
  provider = aws.dns
  zone_id  = var.hosted_zone_id
  name     = aws_ses_domain_mail_from.mail_from.mail_from_domain
  type     = "MX"
  ttl      = 300
  records  = ["10 feedback-smtp.us-east-1.amazonses.com"]
}

# DMARC record for the primary domain
resource "aws_route53_record" "dmarc_record" {
  provider = aws.dns
  zone_id  = var.hosted_zone_id
  name     = "_dmarc.${var.ses_domain}"
  type     = "TXT"
  ttl      = 300
  records = [
    "v=DMARC1; p=reject; rua=mailto:y9an51hu@ag.dmarcian.com; ruf=mailto:y9an51hu@fr.dmarcian.com; pct=100;"
  ]
}
