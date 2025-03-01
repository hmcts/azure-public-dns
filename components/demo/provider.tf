provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.21.1"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "3.1.0"
    }
  }
}
