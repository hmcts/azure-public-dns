
data "local_file" "residential-property-tribunals-config" {
  filename = "${path.cwd}/../../environments/prod/residential-property-tribunals-service-gov-uk.yml"
}

data "local_file" "residential_property_tribunals_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/residential-property-tribunals-service-gov-uk.yml"
}

module "residential-property-tribunals" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.residential-property-tribunals-config.content).cname
  zone_name           = "residential-property-tribunals.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  shutter_config      = data.local_file.residential_property_tribunals_shutter_config.content
}