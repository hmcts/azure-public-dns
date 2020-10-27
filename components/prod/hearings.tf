resource "azurerm_dns_zone" "hearings" {
  name                = "hearings.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
}

data "local_file" "hearings-config" {
  filename = "${path.cwd}/../../environments/prod/hearings-hmcts-net.yml"
}

data "local_file" "vh-config" {
  filename = "${path.cwd}/../../environments/prod/vh-hmcts-net.yml"
}

module "hearings" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.hearings-config.content).cname
  a_recordsets        = yamldecode(data.local_file.hearings-config.content).A
  srv_recordsets      = yamldecode(data.local_file.hearings-config.content).srv
  zone_name           = azurerm_dns_zone.hearings.name
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
