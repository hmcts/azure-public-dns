data "local_file" "immigrationappealsonline-config" {
  filename = "${path.cwd}/../../environments/prod/immigrationappealsonline-justice-gov-uk.yml"
}

data "local_file" "immigrationappealsonline_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/immigrationappealsonline-justice-gov-uk.yml"
}

module "immigrationappealsonline" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.immigrationappealsonline-config.content
  shutter_config      = data.local_file.immigrationappealsonline_shutter_config.content
}
