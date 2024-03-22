data "local_file" "prod-internal-hmcts-config" {
  filename = "${path.cwd}/../../environments/prod/prod-internal-hmcts-net.yml"
}

data "local_file" "prod_internal_hmcts_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/prod-internal-hmcts-net.yml"
}

module "prod-internal" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.prod-internal-hmcts-config.content).cname
  a_recordsets        = yamldecode(data.local_file.prod-internal-hmcts-config.content).A
  ns_recordsets       = yamldecode(data.local_file.prod-internal-hmcts-config.content).ns
  zone_name           = "prod.internal.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  shutter_config      = data.local_file.prod_internal_hmcts_shutter_config.content
}