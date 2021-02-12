resource "azurerm_dns_zone" "mft-hmcts" {
  name                = "mft.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
}

data "local_file" "mft-hmcts-config" {
  filename = "${path.cwd}/../../environments/prod/mft-hmcts-net.yml"
}

module "mft-hmcts" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.mft-hmcts-config.content).cname
  a_recordsets        = yamldecode(data.local_file.mft-hmcts-config.content).A
  zone_name           = azurerm_dns_zone.mft-hmcts.name
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}