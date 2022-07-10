# Configuration de terraform
terraform {
  required_version = ">= 1.2.1"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-workshop-state" # <.>
    storage_account_name = "ststate2738" # <.>
    container_name       = "tfstate" # <.>
    key                  = "terraform.tfstate" # <.>
  }
}

# Configuration du provider
provider "azurerm" {
  features {}
}

# Déclaration des valeurs locales
locals { # <.>
  environment = terraform.workspace == "default" ? "prod" : terraform.workspace # <.>
}
