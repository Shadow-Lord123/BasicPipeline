terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  required_version = ">= 1.0"
}

# Provider uses the variables
provider "azurerm" {
  features {}
  Client_ID       = var.Client_ID
  Client_Secret   = var.Client_Secret
  Subscription_ID = var.Subscription_ID
  Tenant_ID       = var.Tenant_ID
}


