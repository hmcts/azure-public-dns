data "local_file" "manage-your-support-for-hmcts-services-config" {
  filename = "${path.cwd}/../../environments/prod/manage-your-support-for-hmcts-services-service-gov-uk.yml"
}

data "local_file" "manage_your_support_for_hmcts_services_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/manage-your-support-for-hmcts-services-service-gov-uk.yml"
}

module "manage-your-support-for-hmcts-services" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.manage-your-support-for-hmcts-services-config.content
  shutter_config      = data.local_file.manage_your_support_for_hmcts_services_shutter_config.content
}
