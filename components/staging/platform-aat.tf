resource "azurerm_dns_zone" "zone" {
  name                = "aat.platform.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
}

data "local_file" "aat" {
  filename = "${path.cwd}/../../environments/staging/aat.yml"
}

module "public-dns" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.aat.content).cname
  a_recordsets        = yamldecode(data.local_file.aat.content).A
  mx_recordsets       = yamldecode(data.local_file.aat.content).mx
  ns_recordsets       = yamldecode(data.local_file.aat.content).ns
  srv_recordsets      = yamldecode(data.local_file.aat.content).srv
  txt_recordsets      = yamldecode(data.local_file.aat.content).txt
  zone_name           = azurerm_dns_zone.zone.name
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "aat"
}
