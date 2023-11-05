# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  backend "azurerm" {}

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3"
      configuration_aliases = [ azurerm ]
    }
  }
}

# Configure the Microsoft Azure Provider of deployed ENV
provider "azurerm" {
  features {}

  skip_provider_registration = true
  subscription_id            = var.az_subscription_id
  tenant_id                  = var.az_tenant_id
}