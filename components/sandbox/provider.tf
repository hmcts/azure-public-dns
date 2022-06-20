provider "azurerm" {
  version = "=1.44.0"
  features {}
  skip_provider_registration = true
}

terraform {
  backend "azurerm" {}
}