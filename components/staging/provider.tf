provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.27.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "3.3.0"
    }
  }
}
