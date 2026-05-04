output "amplify_app_id" {
  description = "The ID of the Amplify app"
  value       = aws_amplify_app.team_idc_app.id
}

output "amplify_default_domain" {
  description = "The default domain of the Amplify app"
  value       = aws_amplify_app.team_idc_app.default_domain
}
