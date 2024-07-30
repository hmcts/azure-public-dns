data "local_file" "apps-nle-hmcts-config" {
  filename = "${path.cwd}/../../environments/prod/apps-nle-hmcts-net.yml"
}

data "local_file" "apps_nle_hmcts_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/apps-nle-hmcts-net.yml"
}

module "apps-nle-hmcts" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.apps-nle-hmcts-config.content
  shutter_config      = data.local_file.apps_nle_hmcts_shutter_config.content
}
