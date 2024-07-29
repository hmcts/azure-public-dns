data "local_file" "hmcts-access-config" {
  filename = "${path.cwd}/../../environments/prod/hmcts-access-service-gov-uk.yml"
}

data "local_file" "hmcts_access_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/hmcts-access-service-gov-uk.yml"
}

module "hmcts-access" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.hmcts-access-config.content
  shutter_config      = data.local_file.hmcts_access_shutter_config.content
}
