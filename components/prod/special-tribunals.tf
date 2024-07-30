data "local_file" "special-tribunals-config" {
  filename = "${path.cwd}/../../environments/prod/special-tribunals-service-gov-uk.yml"
}

data "local_file" "special_tribunals_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/special-tribunals-service-gov-uk.yml"
}

module "special-tribunals" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.special-tribunals-config.content
  shutter_config      = data.local_file.special_tribunals_shutter_config.content
}
