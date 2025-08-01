provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.38.1"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "3.4.0"
    }
  }
}
