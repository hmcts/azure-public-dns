data "local_file" "hearings-config" {
  filename = "${path.cwd}/../../environments/prod/hearings-hmcts-net.yml"
}

data "local_file" "hearings_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/hearings-hmcts-net.yml"
}

module "hearings" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.hearings-config.content
  shutter_config      = data.local_file.hearings_shutter_config.content
}
