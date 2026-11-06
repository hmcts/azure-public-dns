provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.13.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "3.5.0"
    }
  }
}
