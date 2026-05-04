resource "aws_amplify_app" "team_idc_app" {
  name                 = "TEAM-IDC-APP"
  repository           = "https://github.com/envato/our-iam-identity-center-team"
  iam_service_role_arn = var.service_role
  access_token         = var.access_token != null ? var.access_token : null

  build_spec = <<-EOT
    version: 1
    backend:
      phases:
        preBuild:
          commands:
            - '# > 14.0.0 Enforces SSL on S3 deployment bucket'
            - npm i -g @aws-amplify/cli@14.3.0
            - '# Update deployment parameters with helper script'
            - node parameters.js
        build:
          commands:
            - npm i -S graphql-ttl-transformer
            - export PATH=$HOME/.local/bin:$PATH
            - pip3 install --user pipenv==2023.6.12
            - amplifyPush --simple --allow-destructive-graphql-schema-update
    frontend:
      phases:
        preBuild:
          commands:
            - cp deployment/aws-exports.$AWS_BRANCH.js src/aws-exports.js
            - npm ci
        build:
          commands:
            - npm run build
      artifacts:
        baseDirectory: build
        files:
          - '**/*'
      cache:
        paths:
          - node_modules/**/*
  EOT

  custom_rule {
    source = "/<*>"
    status = "404-200"
    target = "/index.html"
  }

  custom_rule {
    source = "</^[^.]+$|\\.(?!(css|gif|ico|jpg|js|png|txt|svg|woff|ttf|map|json)$)([^.]+$)/>"
    status = "200"
    target = "/index.html"
  }

  environment_variables = {
    AMPLIFY_DESTRUCTIVE_UPDATES = "true"
    AMPLIFY_DIFF_BACKEND        = "false"
    CLOUDTRAIL_AUDIT_LOGS       = var.cloudtrail_audit_logs
    SSO_LOGIN                   = var.sso_login
    TAGS                        = var.tags
    TEAM_ACCOUNT                = var.team_account
    TEAM_ADMIN_GROUP            = var.team_admin_group
    TEAM_AUDITOR_GROUP          = var.team_auditor_group
  }
}

resource "aws_amplify_branch" "branch" {
  app_id            = aws_amplify_app.team_idc_app.id
  branch_name       = var.branch_env
  enable_auto_build = var.branch_enable_auto_build

  framework = "React"
  stage     = "PRODUCTION"

  backend_environment_arn = var.backend_deployment_artifacts != null ? aws_amplify_backend_environment.amplify_backend_environment[0].arn : null

  environment_variables = {
    CLOUDTRAIL_AUDIT_LOGS       = var.cloudtrail_audit_logs
    SSO_LOGIN                   = var.sso_login
    TAGS                        = var.tags
    TEAM_ACCOUNT                = var.team_account
    TEAM_ADMIN_GROUP            = var.team_admin_group
    TEAM_AUDITOR_GROUP          = var.team_auditor_group
    AMPLIFY_BACKEND_APP_ID = aws_amplify_app.team_idc_app.id
    USER_BRANCH            = var.branch_env
    AMPLIFY_CUSTOM_DOMAIN  = var.custom_domain
  }
}

resource "aws_amplify_backend_environment" "amplify_backend_environment" {
  count            = var.backend_deployment_artifacts != null ? 1 : 0
  app_id           = aws_amplify_app.team_idc_app.id
  environment_name = var.branch_env

  deployment_artifacts = var.backend_deployment_artifacts
  stack_name           = var.backend_stack_name
}
