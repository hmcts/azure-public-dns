data "local_file" "darts-nle-service-config" {
  filename = "${path.cwd}/../../environments/prod/darts-nle-service-justice-gov-uk.yml"
}

data "local_file" "darts_nle_service_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/darts-nle-service-justice-gov-uk.yml"
}

module "darts-nle-service" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.darts-nle-service-config.content
  shutter_config      = data.local_file.darts_nle_service_shutter_config.content
}
