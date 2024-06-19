data "local_file" "apps-nle-hmcts-config" {
  filename = "${path.cwd}/../../environments/prod/apps-nle-hmcts-net.yml"
}

data "local_file" "apps_nle_hmcts_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/apps-nle-hmcts-net.yml"
}

module "apps-nle-hmcts" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.apps-nle-hmcts-config.content).cname
  a_recordsets        = yamldecode(data.local_file.apps-nle-hmcts-config.content).A
  zone_name           = "apps-nle.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  shutter_config      = data.local_file.apps_nle_hmcts_shutter_config.content
  area                = data.local_file.apps-nle-hmcts-config.content.area
}
