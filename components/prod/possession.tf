data "local_file" "possession-config" {
  filename = "${path.cwd}/../../environments/prod/possession-service-gov-uk.yml"
}

data "local_file" "possession_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/possession-service-gov-uk.yml"
}

module "possession" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.possession-config.content
  shutter_config      = data.local_file.possession_shutter_config.content
}
