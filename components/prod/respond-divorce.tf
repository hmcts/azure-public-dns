data "local_file" "respond-divorce-config" {
  filename = "${path.cwd}/../../environments/prod/respond-divorce-service-gov-uk.yml"
}

data "local_file" "respond_divorce_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/respond-divorce-service-gov-uk.yml"
}

module "respond-divorce" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.respond-divorce-config.content
  shutter_config      = data.local_file.respond_divorce_shutter_config.content
}
