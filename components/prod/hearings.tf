module "hearings" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.hearings-config.content).cname
  ns_recordsets       = yamldecode(data.local_file.hearings-config.content).ns
  a_recordsets      = yamldecode(data.local_file.hearings-config.content).A
  zone_name           = azurerm_dns_zone.hearings.name
  resource_group_name = data.azurerm_resource_group.main.name
}