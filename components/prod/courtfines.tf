data "local_file" "courtfines-config" {
  filename = "${path.cwd}/../../environments/prod/courtfines-direct-gov-uk.yml"
}

data "local_file" "courtfines_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/courtfines-direct-gov-uk.yml"
}

module "courtfines" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.courtfines-config.content
  shutter_config      = data.local_file.courtfines_shutter_config.content
}
