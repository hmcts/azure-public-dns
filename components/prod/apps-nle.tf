resource "azurerm_dns_zone" "apps-nle-hmcts" {
  name                = "apps-nle.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
}

data "local_file" "apps-nle-hmcts-config" {
  filename = "${path.cwd}/../../environments/prod/apps-nle-hmcts-net.yml"
}

module "apps-nle-hmcts" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.apps-nle-hmcts-config.content).cname
  a_recordsets        = yamldecode(data.local_file.apps-nle-hmcts-config.content).A
  zone_name           = azurerm_dns_zone.apps-nle-hmcts.name
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}