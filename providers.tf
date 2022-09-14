provider "aws" {
  region = "us-east-1"
}

data "aws_ecr_authorization_token" "token" {}

provider "docker" {
  registry_auth {
    address  = split("/", var.ecr_repo_url)[0] # Just the <account id>.dkr.ecr.<region>.amazonaws.com portion
    username = data.aws_ecr_authorization_token.token.user_name
    password = data.aws_ecr_authorization_token.token.password
  }
}