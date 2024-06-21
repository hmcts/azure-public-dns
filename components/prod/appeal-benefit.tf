data "local_file" "appeal-benefit-config" {
  filename = "${path.cwd}/../../environments/prod/appeal-benefit-decision-service-gov-uk.yml"
}

data "local_file" "appeal_benefit_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/appeal-benefit-decision-service-gov-uk.yml"
}

module "appeal-benefit" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.appeal-benefit-config.content).cname
  zone_name           = "appeal-benefit-decision.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  shutter_config      = data.local_file.appeal_benefit_shutter_config.content
  zone_platform       = lookup(yamldecode(data.local_file.appeal-benefit-config.content), "platform", null)
}
