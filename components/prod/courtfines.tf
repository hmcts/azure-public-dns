data "local_file" "courtfines-config" {
  filename = "${path.cwd}/../../environments/prod/courtfines-direct-gov-uk.yml"
}

data "local_file" "courtfines_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/courtfines-direct-gov-uk.yml"
}

module "courtfines" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.courtfines-config.content).cname
  a_recordsets        = yamldecode(data.local_file.courtfines-config.content).A
  zone_name           = "courtfines.direct.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  shutter_config      = data.local_file.courtfines_shutter_config.content
  area                = data.local_file.courtfines-config.content.area
}
