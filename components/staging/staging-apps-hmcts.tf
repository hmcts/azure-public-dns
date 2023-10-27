data "local_file" "staging-apps-hmcts-config" {
  filename = "${path.cwd}/../../environments/staging/staging-apps-hmcts-net.yml"
}

module "staging-apps" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.staging-apps-hmcts-config.content).cname
  a_recordsets        = yamldecode(data.local_file.staging-apps-hmcts-config.content).A
  ns_recordsets       = yamldecode(data.local_file.staging-apps-hmcts-config.content).ns
  zone_name           = "staging.apps.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "stg"
}