provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.24.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "3.2.0"
    }
  }
}
