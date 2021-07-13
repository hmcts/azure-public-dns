data "local_file" "apps-hmcts-config" {
  filename = "${path.cwd}/../../environments/prod/apps-hmcts-net.yml"
}

module "apps-hmcts" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.apps-hmcts-config.content).cname
  ns_recordsets       = yamldecode(data.local_file.apps-hmcts-config.content).ns
  a_recordsets        = yamldecode(data.local_file.apps-hmcts-config.content).A
  txt_recordsets      = yamldecode(data.local_file.apps-hmcts-config.content).txt
  zone_name           = "apps.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
