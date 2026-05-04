terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.72"
    }
    awsteam = {
      source  = "brittandeyoung/awsteam"
      version = "1.1.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "envato-access-management-terraform-state"
    key    = "team-idc-app/team.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "awsteam" {
  token_endpoint = "https://d2velarxxj77y7-main.auth.us-east-1.amazoncognito.com/oauth2/token"
  graph_endpoint = "https://xxd4db5dh5cinavshyoy7gi4tq.appsync-api.us-east-1.amazonaws.com/graphql"
  client_id      = "3ncg5162be9hb5q13cbd93fkc6"
  client_secret  = var.team_client_secret
}
