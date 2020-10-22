data "local_file" "perftest" {
  filename = "${path.cwd}/../../environments/test/perftest.yml"
}

resource "azurerm_dns_zone" "zone" {
  name                = "perftest.platform.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
}

module "public-dns" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.perftest.content).cname
  a_recordsets        = yamldecode(data.local_file.perftest.content).A
  zone_name           = azurerm_dns_zone.zone.name
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "perftest"
}
