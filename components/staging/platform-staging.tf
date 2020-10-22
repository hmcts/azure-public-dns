resource "azurerm_dns_zone" "staging" {
  name                = "staging.platform.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
}

data "local_file" "staging" {
  filename = "${path.cwd}/../../environments/staging/staging.yml"
}

module "staging" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.staging.content).cname
  a_recordsets        = yamldecode(data.local_file.staging.content).A
  mx_recordsets = yamldecode(data.local_file.staging.content).mx
  ns_recordsets = yamldecode(data.local_file.staging.content).ns
  srv_recordsets = yamldecode(data.local_file.staging.content).srv
  txt_recordsets = yamldecode(data.local_file.staging.content).txt
  zone_name           = azurerm_dns_zone.staging.name
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "stg"
}
