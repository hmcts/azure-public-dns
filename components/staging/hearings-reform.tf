data "local_file" "hearings-reform-config" {
  filename = "${path.cwd}/../../environments/staging/hearings-reform-hmcts-net.yml"
}

module "hearings-reform" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.hearings-reform-config.content).cname
  a_recordsets        = yamldecode(data.local_file.hearings-reform-config.content).A
  srv_recordsets      = yamldecode(data.local_file.hearings-reform-config.content).srv
  zone_name           = "staging.hearings.reform.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "stg"
}