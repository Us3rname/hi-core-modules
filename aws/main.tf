terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-1"
}

module "name" {
  source = "./modules/resources/aws-s3"
  bucket_name = "pkr-terraform"
  version = "value"
}