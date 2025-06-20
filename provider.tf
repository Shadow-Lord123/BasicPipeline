
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  required_version = ">= 1.0"
}

# Provider for the primary region (eu-west-2)
provider "aws" {
  region = "eu-west-2"
}
