resource "azurerm_dns_zone" "zone" {
  name                = "ithc.platform.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
}

data "local_file" "ithc" {
  filename = "${path.cwd}/../../environments/ithc.yml"
}


module "public-dns" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.ithc.content).cname
  mx_recordsets       = yamldecode(data.local_file.ithc.content).mx
  a_recordsets        = yamldecode(data.local_file.ithc.content).A
  txt_recordsets      = yamldecode(data.local_file.ithc.content).txt
  ns_recordsets       = yamldecode(data.local_file.ithc.content).ns
  srv_recordsets      = yamldecode(data.local_file.ithc.content).srv
  zone_name           = "ithc.platform.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "ithc"
}
