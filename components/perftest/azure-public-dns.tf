module "public-dns" {
  source              = "../../modules/azure-public-dns/"
  ns_recordsets       = yamldecode(data.local_file.configuration.content).ns
  zone_name           = azurerm_dns_zone.zone.name
  resource_group_name = data.azurerm_resource_group.main.name
}