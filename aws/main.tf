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

module "aws-s3" {
  source = "git@github.com:Us3rname/hi-core-modules.git//aws/modules/resources/aws-s3"
  bucket_name = "pkr-terraform-2"
  # version = "value"
}