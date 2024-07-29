data "local_file" "appeal-immigration-asylum-decision-config" {
  filename = "${path.cwd}/../../environments/prod/appeal-immigration-asylum-decision-service-gov-uk.yml"
}

data "local_file" "appeal_immigration_asylum_decision_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/appeal-immigration-asylum-decision-service-gov-uk.yml"
}

module "appeal-immigration" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.appeal-immigration-asylum-decision-config.content
  shutter_config      = data.local_file.appeal_immigration_asylum_decision_shutter_config.content
}
