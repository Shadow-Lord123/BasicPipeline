
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"  # Specify the version if necessary
    }
  }
}

# Provider for the primary region (eu-west-2)
provider "aws" {
  region = "eu-west-2"
}
