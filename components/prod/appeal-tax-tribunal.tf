data "local_file" "tt-pet-config" {
  filename = "${path.cwd}/../../environments/prod/appeal-tax-tribunal-service-gov-uk.yml"
}

data "local_file" "tt_pet_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/appeal-tax-tribunal-service-gov-uk.yml"
}

module "appeal-tax-tribunal" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.tt-pet-config.content).cname
  txt_recordsets      = yamldecode(data.local_file.tt-pet-config.content).txt
  a_recordsets        = yamldecode(data.local_file.tt-pet-config.content).A
  zone_name           = "appeal-tax-tribunal.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  shutter_config      = data.local_file.tt_pet_shutter_config.content
}
