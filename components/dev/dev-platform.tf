data "local_file" "dev" {
  filename = "${path.cwd}/../../environments/dev/dev.yml"
}

module "dev" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.dev.content).cname
  zone_name           = "dev.platform.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "dev"
  a_recordsets        = yamldecode(data.local_file.dev.content).A
  mx_recordsets       = yamldecode(data.local_file.dev.content).mx
  ns_recordsets       = yamldecode(data.local_file.dev.content).ns
  srv_recordsets      = yamldecode(data.local_file.dev.content).srv
  txt_recordsets      = yamldecode(data.local_file.dev.content).txt
}
