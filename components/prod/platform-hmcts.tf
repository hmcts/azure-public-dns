data "local_file" "platform-hmcts-config" {
  filename = "${path.cwd}/../../environments/prod/platform-hmcts-net.yml"
}

data "local_file" "platform_hmcts_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/platform-hmcts-net.yml"
}

module "platform-hmcts" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.platform-hmcts-config.content
  shutter_config      = data.local_file.platform_hmcts_shutter_config.content
}
