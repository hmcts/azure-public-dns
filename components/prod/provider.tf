provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.31.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "3.4.0"
    }
  }
}
