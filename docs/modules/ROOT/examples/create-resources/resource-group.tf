resource "azurerm_resource_group" "t-resource-group" { # <.> <.>
  name     = "rg-workshop"                             # <.>
  location = "westeurope"                              # <.>

  tags = {
    environment = "dev" # <.>
  }
}
