resource "azurerm_resource_group" "rg" {
  name     = "hi-rg-pkr"
  location = "West Europe"  # Update the location to match your existing Resource Group
}

output "resource_group_location" {
  value = azurerm_resource_group.rg.location
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}