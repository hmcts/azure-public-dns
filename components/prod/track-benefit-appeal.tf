data "local_file" "track-benefit-appeal-config" {
  filename = "${path.cwd}/../../environments/prod/track-benefit-appeal-service-gov-uk.yml"
}

data "local_file" "track_benefit_appeal_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/track-benefit-appeal-service-gov-uk.yml"
}

module "track-benefit-appeal" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.track-benefit-appeal-config.content
  shutter_config      = data.local_file.track_benefit_appeal_shutter_config.content
}
