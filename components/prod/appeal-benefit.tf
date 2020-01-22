module "appeal-benefit" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.appeal-benefit-config.content).cname
  ns_recordsets       = yamldecode(data.local_file.appeal-benefit-config.content).ns
  zone_name           = azurerm_dns_zone.appeal-benefit.name
  resource_group_name = data.azurerm_resource_group.main.name
}