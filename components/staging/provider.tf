provider "azurerm" {
  version = "=3.10.0"
}

terraform {
  backend "azurerm" {}
}