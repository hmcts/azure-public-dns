resource "azurerm_dns_zone" "vh" {
  name                = "vh.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
}

module "vh" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.vh-config.content).cname
  a_recordsets        = yamldecode(data.local_file.vh-config.content).A
  srv_recordsets      = yamldecode(data.local_file.vh-config.content).srv
  zone_name           = azurerm_dns_zone.vh.name
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
