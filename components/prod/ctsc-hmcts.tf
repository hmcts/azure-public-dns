resource "azurerm_dns_zone" "ctsc-hmcts" {
  name                = "ctsc.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
}

data "local_file" "ctsc-hmcts-config" {
  filename = "${path.cwd}/../../environments/prod/ctsc-hmcts-net.yml"
}

module "ctsc-hmcts" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.ctsc-hmcts-config.content).cname
  a_recordsets        = yamldecode(data.local_file.ctsc-hmcts-config.content).A
  zone_name           = azurerm_dns_zone.ctsc-hmcts.name
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
