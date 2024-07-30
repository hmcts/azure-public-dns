data "local_file" "pip-court-tribunal-hearings-config" {
  filename = "${path.cwd}/../../environments/prod/pip-court-tribunal-hearings-service-gov-uk.yml"
}

data "local_file" "pip_court_tribunal_hearings_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/pip-court-tribunal-hearings-service-gov-uk.yml"
}

module "pip-court-tribunal-hearings" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.pip-court-tribunal-hearings-config.content
  shutter_config      = data.local_file.pip_court_tribunal_hearings_shutter_config.content
}
