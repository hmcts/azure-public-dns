data "local_file" "ejudiciary_net_config" {
  filename = "${path.cwd}/../../environments/prod/ejudiciary-net.yml"
}

data "local_file" "ejudiciary_net_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/ejudiciary-net.yml"
}

module "ejudiciary_net" {
  source              = "../../modules/azure-public-dns/"
  a_recordsets        = yamldecode(data.local_file.ejudiciary_net_config.content).A
  cname_records       = yamldecode(data.local_file.ejudiciary_net_config.content).cname
  mx_recordsets       = yamldecode(data.local_file.ejudiciary_net_config.content).mx
  ns_recordsets       = yamldecode(data.local_file.ejudiciary_net_config.content).ns
  srv_recordsets      = yamldecode(data.local_file.ejudiciary_net_config.content).srv
  txt_recordsets      = yamldecode(data.local_file.ejudiciary_net_config.content).txt
  zone_name           = "ejudiciary.net"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  shutter_config      = data.local_file.ejudiciary_net_shutter_config.content
  area                = data.local_file.ejudiciary_net_config.content.area
}
