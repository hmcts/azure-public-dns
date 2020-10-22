resource "azurerm_dns_zone" "test" {
  name                = "test.platform.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
}

data "local_file" "test" {
  filename = "${path.cwd}/../../environments/test/test.yml"
}

module "public-dns" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.test.content).cname
  a_recordsets        = yamldecode(data.local_file.test.content).A
  zone_name           = azurerm_dns_zone.test.name
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "test"
}
