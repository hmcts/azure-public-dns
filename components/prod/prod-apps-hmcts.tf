data "local_file" "prod-apps-hmcts-config" {
  filename = "${path.cwd}/../../environments/prod/prod-apps-hmcts-net.yml"
}

module "prod-apps" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.prod-apps-hmcts-config.content).cname
  a_recordsets        = yamldecode(data.local_file.prod-apps-hmcts-config.content).A
  ns_recordsets       = yamldecode(data.local_file.prod-apps-hmcts-config.content).ns
  zone_name           = "prod.apps.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}