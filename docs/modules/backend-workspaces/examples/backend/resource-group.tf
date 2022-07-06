resource "azurerm_resource_group" "t-resource-group" {
  name     = "${var.resource-group-name}-${local.environment}" # <.>
  location = var.azure-region

  tags = {
    environment = local.environment
  }
}
