provider "azurerm" {
  version = "=1.37"
}

terraform {
  backend "azurerm" {}
}