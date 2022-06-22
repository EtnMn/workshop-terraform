resource "azurerm_resource_group" "t-resource-group" { # <.> <.>
  name     = "rg-workshop"                             # <.>
  location = "West Europe"                             # <.>

  tags = {
    environment = "dev" # <.>
  }
}