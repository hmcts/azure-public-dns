data "local_file" "reform-hmcts-config" {
  filename = "${path.cwd}/../../environments/prod/reform-hmcts-net.yml"
}

data "local_file" "reform_hmcts_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/reform-hmcts-net.yml"
}

module "reform-hmcts" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.reform-hmcts-config.content).cname
  ns_recordsets       = yamldecode(data.local_file.reform-hmcts-config.content).ns
  a_recordsets        = yamldecode(data.local_file.reform-hmcts-config.content).A
  txt_recordsets      = yamldecode(data.local_file.hmcts_net_config.content).txt
  zone_name           = "reform.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  shutter_config      = data.local_file.reform_hmcts_shutter_config.content
}
