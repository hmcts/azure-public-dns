data "local_file" "manage-financial-remedy-config" {
  filename = "${path.cwd}/../../environments/prod/manage-financial-remedy-service-gov-uk.yml"
}

data "local_file" "manage_financial_remedy_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/manage-financial-remedy-service-gov-uk.yml"
}

module "manage-financial-remedy" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.manage-financial-remedy-config.content
  shutter_config      = data.local_file.manage_financial_remedy_shutter_config.content
}
