terraform {
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

provider "azuread" {}