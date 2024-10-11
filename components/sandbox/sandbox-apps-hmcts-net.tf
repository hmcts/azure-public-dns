data "local_file" "sandbox-apps-hmcts-config" {
  filename = "${path.cwd}/../../environments/sandbox/sandbox-apps-hmcts-net.yml"
}

data "local_file" "sandbox_apps_hmcts_shutter_config" {
  filename = "${path.cwd}/../../shuttering/sandbox/sandbox-apps-hmcts-net.yml"
}

module "sandbox-apps-hmcts" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.sandbox-apps-hmcts-config.content
  shutter_config      = data.local_file.sandbox_apps_hmcts_shutter_config.content
}
