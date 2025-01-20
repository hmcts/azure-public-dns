provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.117.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "3.1.0"
    }
  }
}
