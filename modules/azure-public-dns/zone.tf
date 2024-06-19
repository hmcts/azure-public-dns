locals {
  area = var.area == null ? "Undefined" : var.area
}

resource "azurerm_dns_zone" "zone" {
  name                = var.zone_name
  resource_group_name = var.resource_group_name
  tags                = { Area = local.area }
}
