data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

resource "azurerm_dns_zone" "apply-divorce" {
  name                = "apply-divorce.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_dns_zone" "apply-for-probate" {
  name                = "apply-for-probate.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_dns_zone" "appeal-benefit" {
  name                = "appeal-benefit-decision.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_dns_zone" "divorce" {
  name                = "divorce-service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
}