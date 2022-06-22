resource "azurerm_storage_account" "t-storage-account" { # <.>
  name                     = var.storage-account-name
  resource_group_name      = azurerm_resource_group.t-resource-group.name     # <.>
  location                 = azurerm_resource_group.t-resource-group.location # <.>
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "dev"
  }
}

resource "azurerm_storage_container" "t-storage-account-container" { # <.>
  name                  = var.storage-account-container-name
  storage_account_name  = azurerm_storage_account.t-storage-account.name # <.>
  container_access_type = "private"
}