data "local_file" "et-pet-config" {
  filename = "${path.cwd}/../../environments/prod/employmenttribunals-service-gov-uk.yml"
}

data "local_file" "et_pet_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/employmenttribunals-service-gov-uk.yml"
}

module "employment-tribunals" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.et-pet-config.content
  shutter_config      = data.local_file.et_pet_shutter_config.content
}
