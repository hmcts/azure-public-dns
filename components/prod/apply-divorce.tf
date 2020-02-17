module "apply-divorce" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.apply-divorce-config.content).cname
  ns_recordsets       = yamldecode(data.local_file.apply-divorce-config.content).ns
  txt_recordsets      = yamldecode(data.local_file.apply-divorce-config.content).txt
  zone_name           = azurerm_dns_zone.apply-divorce.name
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}