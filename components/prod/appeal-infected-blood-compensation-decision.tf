data "local_file" "appeal-infected-blood-compensation-decision-config" {
  filename = "${path.cwd}/../../environments/prod/appeal-infected-blood-compensation-decision-service-gov-uk.yml"
}

data "local_file" "appeal_infected_blood_compensation_decision_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/appeal-infected-blood-compensation-decision-service-gov-uk.yml"
}

module "appeal-infected-blood-compensation-decision" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.appeal-infected-blood-compensation-decision-config.content
  shutter_config      = data.local_file.appeal_infected_blood_compensation_decision_shutter_config.content
}
