data "local_file" "casetracker-config" {
  filename = "${path.cwd}/../../environments/prod/casetracker-justice-gov-uk.yml"
}

data "local_file" "casetracker_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/casetracker-justice-gov-uk.yml"
}

module "casetracker" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.casetracker-config.content
  shutter_config      = data.local_file.casetracker_shutter_config.content
}
