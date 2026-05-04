data "aws_ssm_parameter" "slack_notification_oauth_secret" {
  name = "/TEAM/production/slack_notification_oauth_secret"
}

locals {
  slack_notification_oauth_secret = data.aws_ssm_parameter.slack_notification_oauth_secret.value
}

resource "awsteam_settings" "settings" {
  approval = true
  comments = true

  duration                    = 336
  expiry                      = 24
  team_admin_group            = "Okta-App-AWS-Team-Admin"
  team_auditor_group          = "Okta-App-AWS-Team-Auditor"
  ses_notifications_enabled   = true
  ses_source_email            = "notifications@mail.team.aws.platform.envato.net"
  slack_notifications_enabled = true
  slack_token                 = local.slack_notification_oauth_secret
  ticket_no                   = true
}

resource "awsteam_eligibility_group" "incident_roles_eligibility_group" {
  group_name        = "Okta-App-AWS-All-Developers"
  group_id          = "14687478-3051-701a-e53b-8f8568ad3c54"
  approval_required = false
  duration          = 8
  accounts = [
    {
      account_id    = "120455600289"
      account_name  = "Envato Author Production"
    },
    {
      account_id    = "242442863264"
      account_name  = "Elements Production"
    },
    {
      account_id    = "298865909318"
      account_name  = "Envato Arrivals Production"
    },
    {
      account_id    = "448216681645"
      account_name  = "Envato Identity Production"
    },
    {
      account_id    = "856390419361"
      account_name  = "Market CDE Production"
    },
    {
      account_id    = "866582326088"
      account_name  = "Elements CDE Production"
    }
  ]
  ous = []
  permissions = [
    {
      permission_arn  = "arn:aws:sso:::permissionSet/ssoins-72231b51702b0f25/ps-a20a3b8a41d0e083"
      permission_name = "IncidentUseOnlyDeveloper"
    },
    {
      permission_arn  = "arn:aws:sso:::permissionSet/ssoins-72231b51702b0f25/ps-e76b29169213bd62"
      permission_name = "IncidentUseOnlyAdmin"
    }
  ]
}

resource "awsteam_eligibility_group" "eligibility_group" {
  group_name        = "Okta-App-AWS-All-Users"
  group_id          = "24387468-4051-7028-d293-75ecf8d017a6"
  approval_required = true
  duration          = 336
  accounts = [
    {
      account_id   = "221082199185"
      account_name = "Access Management - Production"
    },
    {
      account_id   = "909551307430"
      account_name = "Envato Platform Production Account"
    }
  ]
  ous = [
    {
      ou_id   = "ou-4zz6-lrwm523h"
      ou_name = "AI Labs"
    },
    {
      ou_id   = "ou-4zz6-od6o3xyf"
      ou_name = "Analytics"
    },
    {
      ou_id   = "ou-4zz6-bgcbyp2q"
      ou_name = "Auth"
    },
    {
      ou_id   = "ou-4zz6-wlkq3ixo"
      ou_name = "Author"
    },
    {
      ou_id   = "ou-4zz6-r6s46jix"
      ou_name = "Content"
    },
    {
      ou_id   = "ou-4zz6-yxt2rnfk"
      ou_name = "Content - No Public Buckets"
    },
    {
      ou_id   = "ou-4zz6-k388e8d7"
      ou_name = "DAM - Externally Managed Accounts"
    },
    {
      ou_id   = "ou-4zz6-yugi2pp6"
      ou_name = "Production"
    },
    {
      ou_id   = "ou-4zz6-c6rmdi99"
      ou_name = "Staging and Development"
    },
    {
      ou_id   = "ou-4zz6-p528be0r"
      ou_name = "Elements"
    },
    {
      ou_id   = "ou-4zz6-4bjff45b"
      ou_name = "Influx"
    },
    {
      ou_id   = "ou-4zz6-4g99hjvl"
      ou_name = "Development"
    },
    {
      ou_id   = "ou-4zz6-4tjl972a"
      ou_name = "Production"
    },
    {
      ou_id   = "ou-4zz6-07tacqie"
      ou_name = "DAM"
    },
    {
      ou_id   = "ou-4zz6-8p3c85le"
      ou_name = "Placeit NonProduction"
    },
    {
      ou_id   = "ou-4zz6-6f4duk4q"
      ou_name = "Platform"
    },
    {
      ou_id   = "ou-4zz6-9oq2kigk"
      ou_name = "DAM"
    },
    {
      ou_id   = "ou-4zz6-vpbmngb7"
      ou_name = "Placeit Production"
    },
    {
      ou_id   = "ou-4zz6-hnbmrwbe"
      ou_name = "QuarantinedAccounts"
    },
    {
      ou_id   = "ou-4zz6-innfcgbd"
      ou_name = "Tech Services"
    },
    {
      ou_id   = "ou-4zz6-k3iiauab"
      ou_name = "Tuts and Studio"
    },
    {
      ou_id   = "ou-4zz6-m4zy7gqi"
      ou_name = "Twenty20"
    },
    {
      ou_id   = "ou-4zz6-4kqiytdd"
      ou_name = "Elements"
    },
    {
      ou_id   = "ou-4zz6-2gi3oy9f"
      ou_name = "Market"
    },
    {
      ou_id   = "ou-4zz6-wwb56d3s"
      ou_name = "Placeit"
    },
    {
      ou_id   = "ou-4zz6-26x7qwdu"
      ou_name = "Newvato"
    },
    {
      ou_id   = "ou-4zz6-k66rj11f"
      ou_name = "Content Operations Automation Support Production"
    },
    {
      ou_id   = "ou-4zz6-k7mb89sv"
      ou_name = "Content Operations Automation Support Staging"
    },
    {
      ou_id   = "ou-4zz6-70hv5krs"
      ou_name = "APET"
    }
  ]
  permissions = [
    {
      permission_arn  = "arn:aws:sso:::permissionSet/ssoins-72231b51702b0f25/ps-64f6706e12e34010"
      permission_name = "Admin"
    },
    {
      permission_arn  = "arn:aws:sso:::permissionSet/ssoins-72231b51702b0f25/ps-5653325fece599cf"
      permission_name = "ApprovalRequiredAdmin"
    },
    {
      permission_arn  = "arn:aws:sso:::permissionSet/ssoins-72231b51702b0f25/ps-f2a640dc2bb99871"
      permission_name = "ApprovalRequiredDeveloper"
    },
    {
      permission_arn  = "arn:aws:sso:::permissionSet/ssoins-72231b51702b0f25/ps-ce30635a8a32ce85"
      permission_name = "Developer"
    },
    {
      permission_arn  = "arn:aws:sso:::permissionSet/ssoins-72231b51702b0f25/ps-84fe37ae9cb2b7c1"
      permission_name = "Purchasing"
    },
    {
      permission_arn  = "arn:aws:sso:::permissionSet/ssoins-72231b51702b0f25/ps-34118d874665d3b9"
      permission_name = "Readonly"
    },
    {
      permission_arn  = "arn:aws:sso:::permissionSet/ssoins-72231b51702b0f25/ps-532860abd5a7ec10"
      permission_name = "CustomDAMRWIngestionBuckets"
    },
    {
      permission_arn  = "arn:aws:sso:::permissionSet/ssoins-72231b51702b0f25/ps-f6438586d88f161e"
      permission_name = "CustomPlaceitAIReadOnlyBuckets"
    },
    {
      permission_arn  = "arn:aws:sso:::permissionSet/ssoins-72231b51702b0f25/ps-1a0a300e9641e34f"
      permission_name = "AnalyticsRedShiftBucketAccess"
    }
  ]
}

resource "awsteam_eligibility_group" "account_experience_and_auth_staging_admin_eligibility_group" {
  group_name        = "Okta-App-AWS-Account_Experience_And_Auth-Developer"
  group_id          = "d4189448-8051-703c-386a-5ca9da45a488"
  approval_required = false
  duration          = 8
  accounts = [
    {
      account_id    = "511282649383"
      account_name  = "Envato Identity Development"
    }
  ]
  ous = []
  permissions = [
    {
      permission_arn  = "arn:aws:sso:::permissionSet/ssoins-72231b51702b0f25/ps-64f6706e12e34010"
      permission_name = "Admin"
    }
  ]
}
