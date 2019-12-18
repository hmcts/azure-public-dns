module "public-dns" {
  source              = "../../modules/azure-public-dns/"
  zone_name           = azurerm_dns_zone.zone.name
  recordsets          = var.recordsets
  resource_group_name = data.azurerm_resource_group.main.name
}