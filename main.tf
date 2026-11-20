terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

data "aws_caller_identity" "current" {}

resource "aws_ecr_repository" "satyajeet_ecr" {
  name         = "satyajeet-app-repo"
  force_delete = true
}

output "ecr_repository_url" {
  value = aws_ecr_repository.satyajeet_ecr.repository_url
}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}
