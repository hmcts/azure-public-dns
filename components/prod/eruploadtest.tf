data "local_file" "eruploadtest-justice-config" {
  filename = "${path.cwd}/../../environments/prod/eruploadtest-justice-gov-uk.yml"
}

data "local_file" "eruploadtest_justice_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/eruploadtest-justice-gov-uk.yml"
}

module "eruploadtest-justice" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.eruploadtest-justice-config.content).cname
  a_recordsets        = yamldecode(data.local_file.eruploadtest-justice-config.content).A
  zone_name           = "eruploadtest.justice.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  shutter_config      = data.local_file.eruploadtest_justice_shutter_config.content
  area                = data.local_file.eruploadtest-justice-config.content.area
}
