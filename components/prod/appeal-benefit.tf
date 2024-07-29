data "local_file" "appeal-benefit-config" {
  filename = "${path.cwd}/../../environments/prod/appeal-benefit-decision-service-gov-uk.yml"
}

data "local_file" "appeal_benefit_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/appeal-benefit-decision-service-gov-uk.yml"
}

module "appeal-benefit" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.appeal-benefit-config.content
  shutter_config      = data.local_file.appeal_benefit_shutter_config.content
}
