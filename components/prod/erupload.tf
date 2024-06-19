data "local_file" "erupload-justice-config" {
  filename = "${path.cwd}/../../environments/prod/erupload-justice-gov-uk.yml"
}

data "local_file" "erupload_justice_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/erupload-justice-gov-uk.yml"
}

module "erupload-justice" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.erupload-justice-config.content).cname
  a_recordsets        = yamldecode(data.local_file.erupload-justice-config.content).A
  zone_name           = "erupload.justice.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  shutter_config      = data.local_file.erupload_justice_shutter_config.content
  area                = data.local_file.erupload-justice-config.content.area
}
