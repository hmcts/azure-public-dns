data "local_file" "probatesearch" {
  filename = "${path.cwd}/../../environments/prod/probatesearch-service-gov-uk.yml"
}

data "local_file" "probatesearch_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/probatesearch-service-gov-uk.yml"
}

module "probatesearch" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.probatesearch.content
  shutter_config      = data.local_file.probatesearch_shutter_config.content
}
