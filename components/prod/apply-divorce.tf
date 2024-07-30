data "local_file" "apply-divorce-config" {
  filename = "${path.cwd}/../../environments/prod/apply-divorce-service-gov-uk.yml"
}

data "local_file" "apply_divorce_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/apply-divorce-service-gov-uk.yml"
}

module "apply-divorce" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.apply-divorce-config.content
  shutter_config      = data.local_file.apply_divorce_shutter_config.content
}
