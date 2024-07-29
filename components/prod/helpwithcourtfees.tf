data "local_file" "hwf-pet-config" {
  filename = "${path.cwd}/../../environments/prod/helpwithcourtfees-service-gov-uk.yml"
}

data "local_file" "hwf_pet_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/helpwithcourtfees-service-gov-uk.yml"
}

module "helpwithcourtfees" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.hwf-pet-config.content
  shutter_config      = data.local_file.hwf_pet_shutter_config.content
}
