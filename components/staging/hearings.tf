data "local_file" "hearings-config" {
  filename = "${path.cwd}/../../environments/staging/hearings-hmcts-net.yml"
}

module "hearings" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.hearings-config.content).cname
  a_recordsets        = yamldecode(data.local_file.hearings-config.content).A
  srv_recordsets      = yamldecode(data.local_file.hearings-config.content).srv
  zone_name           = "staging.hearings.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "stg"
}
