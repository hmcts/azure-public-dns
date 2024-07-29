data "local_file" "moneyclaims-config" {
  filename = "${path.cwd}/../../environments/prod/moneyclaims-service-gov-uk.yml"
}

data "local_file" "moneyclaims_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/moneyclaims-service-gov-uk.yml"
}

module "moneyclaims" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.moneyclaims-config.content
  shutter_config      = data.local_file.moneyclaims_shutter_config.content
}
