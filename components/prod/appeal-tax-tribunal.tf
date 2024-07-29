data "local_file" "tt-pet-config" {
  filename = "${path.cwd}/../../environments/prod/appeal-tax-tribunal-service-gov-uk.yml"
}

data "local_file" "tt_pet_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/appeal-tax-tribunal-service-gov-uk.yml"
}

module "appeal-tax-tribunal" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.tt-pet-config.content
  shutter_config      = data.local_file.tt_pet_shutter_config.content
}
