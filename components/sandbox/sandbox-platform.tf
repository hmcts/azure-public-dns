data "local_file" "configuration" {
  filename = "${path.cwd}/../../environments/sandbox.yml"
}

module "public-dns" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.configuration.content).cname
  mx_recordsets       = yamldecode(data.local_file.configuration.content).mx
  a_recordsets        = yamldecode(data.local_file.configuration.content).A
  txt_recordsets      = yamldecode(data.local_file.configuration.content).txt
  zone_name           = "sandbox.platform.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "sbox"
  ns_recordsets       = yamldecode(data.local_file.configuration.content).ns
  srv_recordsets      = yamldecode(data.local_file.configuration.content).srv
}
