data "local_file" "track-benefit-appeal-config" {
  filename = "${path.cwd}/../../environments/prod/track-benefit-appeal-service-gov-uk.yml"
}

data "local_file" "track_benefit_appeal_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/track-benefit-appeal-service-gov-uk.yml"
}

module "track-benefit-appeal" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.track-benefit-appeal-config.content).cname
  zone_name           = "track-benefit-appeal.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  shutter_config      = data.local_file.track_benefit_appeal_shutter_config.content
  zone_platform       = lookup(yamldecode(data.local_file.track-benefit-appeal-config.content), "platform", null)
}
