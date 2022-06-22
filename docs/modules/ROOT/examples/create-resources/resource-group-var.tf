resource "azurerm_resource_group" "t-resource-group" {
  name     = var.resource-group-name # <.>
  location = var.azure-region

  tags = {
    environment = "dev"
  }
}