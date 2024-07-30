data "local_file" "end-civil-partnership-config" {
  filename = "${path.cwd}/../../environments/prod/end-civil-partnership-service-gov-uk.yml"
}

data "local_file" "end_civil_partnership_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/end-civil-partnership-service-gov-uk.yml"
}

module "end-civil-partnership" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.end-civil-partnership-config.content
  shutter_config      = data.local_file.end_civil_partnership_shutter_config.content
}
