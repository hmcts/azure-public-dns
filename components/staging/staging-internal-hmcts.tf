data "local_file" "staging-internal-hmcts-config" {
  filename = "${path.cwd}/../../environments/staging/staging-internal-hmcts-net.yml"
}

module "staging-internal" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.staging-internal-hmcts-config.content).cname
  a_recordsets        = yamldecode(data.local_file.staging-internal-hmcts-config.content).A
  ns_recordsets       = yamldecode(data.local_file.staging-internal-hmcts-config.content).ns
  zone_name           = "staging.internal.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "stg"
}