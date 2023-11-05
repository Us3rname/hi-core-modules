# Deploy Storage Account
resource "azurerm_storage_account" "st" {
  name                            = lower("st${var.company}${var.solution}${var.name}${var.environment}${var.instance}")
  location                        = var.location
  resource_group_name             = var.resource_group_name
  account_kind                    = "StorageV2"
  account_tier                    = "Standard"
  access_tier                     = "Hot"
  account_replication_type        = "LRS"
  is_hns_enabled                  = true
  min_tls_version                 = "TLS1_2"
  enable_https_traffic_only       = true
  allow_nested_items_to_be_public = false
  shared_access_key_enabled       = false
  infrastructure_encryption_enabled = true


  # Add user or system assigned ID
  dynamic "identity" {
    for_each = try(each.value.identity, [{}])
    content {
      type = try(identity.value.type, "SystemAssigned")
    }
  }

  # Add blob properties
  dynamic "blob_properties" {
    for_each = try(each.value.blob_properties, [{}])
    content {
      container_delete_retention_policy {
        days = try(blob_properties.value.container_delete_retention_policy_in_days, 30)
      }
    }
  }

  tags = var.tags
}