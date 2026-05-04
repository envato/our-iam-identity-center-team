resource "aws_cloudtrail_event_data_store" "event_data_store" {
  name             = "eventdatastore-staging"
  retention_period = 30
}

module "amplify_staging" {
  source = "../modules/amplify"

  branch_env               = "staging"
  service_role             = "arn:aws:iam::010928195081:role/TEAM-IDC-APP-AmplifyRole-y50JKj9IVJ2X"
  cloudtrail_audit_logs    = aws_cloudtrail_event_data_store.event_data_store.arn
  sso_login                = "https://d-9067eccd8b.awsapps.com/start"
  tags                     = "project=iam-identity-center-team environment=staging"
  team_account             = "010928195081"
  team_admin_group         = "team_admin"
  team_auditor_group       = "team_auditor"
  access_token             = var.github_access_token
  branch_enable_auto_build = true

  backend_deployment_artifacts = "amplify-teamidcapp-staging-1b5cf-deployment"
  backend_stack_name           = "amplify-teamidcapp-staging-1b5cf"
}
