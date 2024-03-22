data "local_file" "vh-config" {
  filename = "${path.cwd}/../../environments/prod/vh-hmcts-net.yml"
}

data "local_file" "vh_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/vh-hmcts-net.yml"
}

module "vh" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.vh-config.content).cname
  a_recordsets        = yamldecode(data.local_file.vh-config.content).A
  srv_recordsets      = yamldecode(data.local_file.vh-config.content).srv
  zone_name           = "vh.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  shutter_config      = data.local_file.vh_shutter_config.content
}