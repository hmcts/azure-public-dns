resource "azurerm_dns_zone" "prod-platform" {
  name                = "prod.platform.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
}

data "local_file" "prod-platform-config" {
  filename = "${path.cwd}/../../environments/prod/prod-platform-hmcts-net.yml"
}

module "prod-platform" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.prod-platform-config.content).cname
  zone_name           = azurerm_dns_zone.prod-platform.name
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
