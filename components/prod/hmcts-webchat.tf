data "local_file" "hmcts-webchat-config" {
  filename = "${path.cwd}/../../environments/prod/hmcts-webchat-service-gov-uk.yml"
}

data "local_file" "hmcts_webchat_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/hmcts-webchat-service-gov-uk.yml"
}

module "hmcts-webchat" {
  source              = "../../modules/azure-public-dns/"
  zone_name           = "hmcts-webchat.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  shutter_config      = data.local_file.hmcts_webchat_shutter_config.content
  area                = data.local_file.hmcts-webchat-config.content.area
}
