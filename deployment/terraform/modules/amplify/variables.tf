variable "branch_env" {
  type = string
}

variable "service_role" {
  type = string
}

variable "cloudtrail_audit_logs" {
  type = string
}

variable "sso_login" {
  type = string
}

variable "tags" {
  type = string
}

variable "team_account" {
  type = string
}

variable "team_admin_group" {
  type = string
}

variable "team_auditor_group" {
  type = string
}

variable "branch_enable_auto_build" {
  type    = bool
  default = false
}

variable "access_token" {
  type      = string
  sensitive = true
  default   = null
}

variable "backend_deployment_artifacts" {
  type    = string
  default = null
}

variable "backend_stack_name" {
  type    = string
  default = null
}

variable "custom_domain" {
  type    = string
  default = null
}
