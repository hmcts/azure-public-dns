provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.108.0"
    }
  }
}