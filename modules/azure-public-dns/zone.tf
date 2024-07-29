resource "azurerm_dns_zone" "zone" {
  name                = local.zone_name
  resource_group_name = var.resource_group_name
}
