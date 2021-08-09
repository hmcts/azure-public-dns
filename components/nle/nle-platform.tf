// TODO move this to staging
data "local_file" "configuration" {
  filename = "${path.cwd}/../../environments/nle.yml"
}

module "public-dns" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.configuration.content).cname
  a_recordsets        = yamldecode(data.local_file.configuration.content).A
  mx_recordsets       = yamldecode(data.local_file.configuration.content).mx
  ns_recordsets       = yamldecode(data.local_file.configuration.content).ns
  srv_recordsets      = yamldecode(data.local_file.configuration.content).srv
  txt_recordsets      = yamldecode(data.local_file.configuration.content).txt
  zone_name           = "nle.platform.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
