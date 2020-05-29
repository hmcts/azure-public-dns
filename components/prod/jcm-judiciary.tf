module "platform-hmcts" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.jcm-judiciary-config.content).cname
  a_recordsets        = yamldecode(data.local_file.jcm-judiciary-config.content).A
  zone_name           = azurerm_dns_zone.jcm-judiciary.name
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}