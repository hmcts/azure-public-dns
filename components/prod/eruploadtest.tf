data "local_file" "eruploadtest-justice-config" {
  filename = "${path.cwd}/../../environments/prod/eruploadtest-justice-gov-uk.yml"
}

data "local_file" "eruploadtest_justice_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/eruploadtest-justice-gov-uk.yml"
}

module "eruploadtest-justice" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.eruploadtest-justice-config.content
  shutter_config      = data.local_file.eruploadtest_justice_shutter_config.content
}
