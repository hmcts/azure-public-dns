data "local_file" "et-pet-config" {
  filename = "${path.cwd}/../../environments/prod/employmenttribunals-service-gov-uk.yml"
}

data "local_file" "et_pet_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/employmenttribunals-service-gov-uk.yml"
}

module "employment-tribunals" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.et-pet-config.content).cname
  txt_recordsets      = yamldecode(data.local_file.et-pet-config.content).txt
  a_recordsets        = yamldecode(data.local_file.et-pet-config.content).A
  zone_name           = "employmenttribunals.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  shutter_config      = data.local_file.et_pet_shutter_config.content
  zone_platform       = lookup(yamldecode(data.local_file.et-pet-config.content), "platform", null)
}
