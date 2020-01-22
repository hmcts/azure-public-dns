module "divorce" {
  source              = "../../modules/azure-public-dns/"
  ns_recordsets       = yamldecode(data.local_file.divorce-config.content).ns
  a_recordsets        = yamldecode(data.local_file.divorce-config.content).A
  zone_name           = azurerm_dns_zone.divorce.name
  resource_group_name = data.azurerm_resource_group.main.name
}