data "local_file" "courtfines-justice-config" {
  filename = "${path.cwd}/../../environments/prod/courtfines-justice-gov-uk.yml"
}

data "local_file" "courtfines-justice_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/courtfines-justice-gov-uk.yml"
}

module "courtfines_justice" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.courtfines-justice-config.content
  shutter_config      = data.local_file.courtfines-justice_shutter_config.content
}
