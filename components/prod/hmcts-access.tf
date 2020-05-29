module "hmcts-access" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.hmcts-access-config.content).cname
  alias_recordsets    = yamldecode(data.local_file.hmcts-access-config.content).alias
  zone_name           = azurerm_dns_zone.hmcts-access.name
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
