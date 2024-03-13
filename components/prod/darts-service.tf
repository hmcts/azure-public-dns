data "local_file" "darts-service-config" {
  filename = "${path.cwd}/../../environments/prod/darts-service-justice-gov-uk.yml"
}

data "local_file" "darts_service_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/darts-service-justice-gov-uk.yml"
}

module "darts-service" {
  source              = "../../modules/azure-public-dns/"
  a_recordsets        = yamldecode(data.local_file.darts-service-config.content).A
  ns_recordsets       = yamldecode(data.local_file.darts-service-config.content).ns
  zone_name           = "darts.service.justice.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  shutter_config      = data.local_file.darts_service_shutter_config.content
}
