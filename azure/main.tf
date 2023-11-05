terraform {
#   backend "azurerm" {}

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
      configuration_aliases = [azurerm]
    }
  }

  required_version = ">= 1.1.0"
}

# Configure the Microsoft Azure Provider of deployed ENV
provider "azurerm" {
  features {}

  skip_provider_registration = true
  subscription_id            = "a3c34725-da6a-41ac-87fa-090f6b96d44d"
  tenant_id                  = "b33bae57-03f8-4763-8eb3-924854339388"
}

module "resource_group_pkr" {
    source = "./modules/resources/azure-rg"
    az_subscription_id = "a3c34725-da6a-41ac-87fa-090f6b96d44d"
    az_tenant_id = "b33bae57-03f8-4763-8eb3-924854339388"
    environment = "sandbox"
}

# resource "example_resource" "example" {
#   resource_group_id = module.resource_group_pkr.resource_group_id
# }
