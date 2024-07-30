data "local_file" "pre-recorded-evidence-justice-config" {
  filename = "${path.cwd}/../../environments/prod/pre-recorded-evidence-justice-gov-uk.yml"
}

data "local_file" "pre_recorded_evidence_justice_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/pre-recorded-evidence-justice-gov-uk.yml"
}

module "pre-recorded-evidence-justice" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.pre-recorded-evidence-justice-config.content
  shutter_config      = data.local_file.pre_recorded_evidence_justice_shutter_config.content
}
