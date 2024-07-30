data "local_file" "courttribunalfinder" {
  filename = "${path.cwd}/../../environments/prod/courttribunalfinder-service-gov-uk.yml"
}

data "local_file" "courttribunalfinder_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/courttribunalfinder-service-gov-uk.yml"
}

module "courttribunalfinder" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.courttribunalfinder.content
  shutter_config      = data.local_file.courttribunalfinder_shutter_config.content
}
