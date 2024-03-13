data "local_file" "casetracker-config" {
  filename = "${path.cwd}/../../environments/prod/casetracker-justice-gov-uk.yml"
}

data "local_file" "casetracker_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/casetracker-justice-gov-uk.yml"
}

module "casetracker" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.casetracker-config.content).cname
  a_recordsets        = yamldecode(data.local_file.casetracker-config.content).A
  zone_name           = "casetracker.justice.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  shutter_config      = data.local_file.casetracker_shutter_config.content
}
