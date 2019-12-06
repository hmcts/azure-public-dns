module "public-dns" {
  source              = "../../modules/azure-public-dns/"
  zone_name           = azurerm_dns_zone.ithc_zone.name
  recordsets          = var.ithc-platform-hmcts-net
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}