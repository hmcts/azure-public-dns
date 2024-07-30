data "local_file" "apps-hmcts-config" {
  filename = "${path.cwd}/../../environments/prod/apps-hmcts-net.yml"
}

data "local_file" "apps_hmcts_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/apps-hmcts-net.yml"
}

module "apps-hmcts" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.apps-hmcts-config.content
  shutter_config      = data.local_file.apps_hmcts_shutter_config.content
}

