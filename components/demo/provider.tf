provider "azurerm" {
  version = "=1.44.0"
}

terraform {
  backend "azurerm" {}
}