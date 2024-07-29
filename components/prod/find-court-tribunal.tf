data "local_file" "find-court-tribunal" {
  filename = "${path.cwd}/../../environments/prod/find-court-tribunal-service-gov-uk.yml"
}

data "local_file" "find_court_tribunal_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/find-court-tribunal-service-gov-uk.yml"
}

module "find-court-tribunal" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.find-court-tribunal.content
  shutter_config      = data.local_file.find_court_tribunal_shutter_config.content
}
