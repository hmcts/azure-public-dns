module "reform-hmcts" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.reform-hmcts-config.content).cname
  ns_recordsets       = yamldecode(data.local_file.reform-hmcts-config.content).ns
  a_recordsets        = yamldecode(data.local_file.reform-hmcts-config.content).A
  zone_name           = azurerm_dns_zone.reform-hmcts.name
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
