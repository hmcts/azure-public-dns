// TODO move this to staging

data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

resource "azurerm_dns_zone" "zone" {
  name                = "nle.platform.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
}

data "local_file" "configuration" {
  filename = "${path.cwd}/../../environments/nle.yml"
}

module "public-dns" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.configuration.content).cname
  zone_name           = azurerm_dns_zone.zone.name
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "nle"
}
