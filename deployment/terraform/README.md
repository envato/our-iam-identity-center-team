# Prequisites
- You will need to have access into the Envato TEAM Test - 010928195081 aws account for the staging environment. The staging account is in the seperate AWS organization https://d-9067eccd8b.awsapps.com/start
- You will need to have access into the Access Management - Production - 221082199185 aws account for the prod environment
- To deploy with Terraform, you’ll need to export the Cognito client secret used by the `machine_auth` app client. The command below will automatically find the correct user pool and client, fetch the secret, and set it as an environment variable so Terraform can access it. This value is sensitive, so make sure it’s handled securely.
  Assuming you have a shell with appropriate AWS credentials:
```
export HISTCONTROL=ignoreboth  # Space at start of next line is intentional
 export TF_VAR_team_client_secret=$(aws cognito-idp describe-user-pool-client --client-id $(aws cognito-idp list-user-pool-clients --user-pool-id $(aws cognito-idp list-user-pools --max-results 10 --query 'UserPools[?contains(Name,`team`)].Id' --output text) --query 'UserPoolClients[?ClientName==`machine_auth`].ClientId' --output text) --user-pool-id $(aws cognito-idp list-user-pools --max-results 10 --query 'UserPools[?contains(Name,`team`)].Id' --output text) --query UserPoolClient.ClientSecret --output text)
```

Now you're ready to:

# Run Terraform Staging Environment
You will need access into the Envato TEAM Test - 010928195081
```
cd deployment/terraform/staging
terraofrm init
terraform plan
terraform apply
```

# Run Terraform Prod Environment
```
cd deployment/terraform/prod
terraofrm init
terraform plan
terraform apply
```
