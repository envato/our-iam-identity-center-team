variable "github_access_token" {
  type      = string
  sensitive = true
  default   = null
}

# The custom domain name that will be associated with the Amplify app
variable "custom_domain" {
  description = "The custom domain name to be associated with the Amplify app"
  type        = string
}

# The SES domain for sending email notifications
variable "ses_domain" {
  description = "The SES domain for sending email notifications"
  type        = string
}

# Subject Alternative Names (SANs) for the ACM certificate (optional)
variable "subject_alternative_names" {
  description = "A list of additional domains for the ACM certificate"
  type        = list(string)
  default     = []
}

# The environment or branch for which the Amplify app is being deployed
variable "branch_env" {
  description = "The environment or branch name for the Amplify app"
  type        = string
}

# The hosted zone ID where the DNS records will be created
variable "hosted_zone_id" {
  description = "The ID of the Route 53 hosted zone where the DNS records will be created"
  type        = string
}

# The ARN of the IAM role in the Route 53 account (optional, if you want to pass it as a variable)
variable "route53_role_arn" {
  description = "The ARN of the IAM role in the Route 53 account that allows cross-account management"
  type        = string
  default     = ""
}

variable "team_client_secret" {
  type      = string
  sensitive = true
}
