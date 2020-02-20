module "apply-for-probate" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.apply-for-probate-config.content).cname
  a_recordsets        = yamldecode(data.local_file.apply-for-probate-config.content).A
  zone_name           = azurerm_dns_zone.apply-for-probate.name
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}