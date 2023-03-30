data "local_file" "hmcts_net_config" {
  filename = "${path.cwd}/../../environments/prod/hmcts-net.yml"
}

module "hmcts_net" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.hmcts_net_config.content).cname
  ns_recordsets       = yamldecode(data.local_file.hmcts_net_config.content).ns
  a_recordsets        = yamldecode(data.local_file.hmcts_net_config.content).A
  txt_recordsets      = yamldecode(data.local_file.hmcts_net_config.content).txt
  mx_recordsets       = yamldecode(data.local_file.hmcts_net_config.content).mx
  srv_recordsets       = yamldecode(data.local_file.hmcts_net_config.content).srv
  zone_name           = "hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
