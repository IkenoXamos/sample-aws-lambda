terraform {
  backend "s3" {
    bucket  = "revature-terraform"
    key     = "cognizant/aws-lab/lambda.tfstate"
    region  = "us-east-1"
    profile = "revature-terraform-state"
  }
  required_version = ">= 0.15"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.15.1"
      #Will allow installation of 4.15.1 and 4.15.10 but not 4.16.0
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.9.0"
    }
  }
}
