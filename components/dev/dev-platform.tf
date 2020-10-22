resource "azurerm_dns_zone" "dev" {
  name                = "dev.platform.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
}

data "local_file" "dev" {
  filename = "${path.cwd}/../../environments/dev/dev.yml"
}

module "public-dns" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.dev.content).cname
  zone_name           = azurerm_dns_zone.dev.name
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "dev"
}
