data "local_file" "claim-et-sya-config" {
  filename = "${path.cwd}/../../environments/prod/claim-employment-tribunal-service-gov-uk.yml"
}

data "local_file" "claim_et_sya_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/claim-employment-tribunal-service-gov-uk.yml"
}

module "claim-employment-tribunals" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.claim-et-sya-config.content
  shutter_config      = data.local_file.claim_et_sya_shutter_config.content
}
