terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "team-terraform-state"
    key    = "team-idc-app/team.tfstate"
    region = "us-east-1"
  }
}
