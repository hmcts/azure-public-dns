module "respond-divorce" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.respond-divorce-config.content).cname
  zone_name           = azurerm_dns_zone.respond-divorce.name
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}