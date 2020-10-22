resource "azurerm_dns_zone" "zone" {
  name                = "preview.platform.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
}

data "local_file" "preview" {
  filename = "${path.cwd}/../../environments/dev/preview.yml"
}

module "public-dns" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.preview.content).cname
  zone_name           = azurerm_dns_zone.zone.name
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "preview"
}
