data "local_file" "casetracker-config" {
  filename = "${path.cwd}/../../environments/staging/casetracker-justice-gov-uk.yml"
}

module "casetracker" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.casetracker-config.content).cname
  a_recordsets        = yamldecode(data.local_file.casetracker-config.content).A
  zone_name           = "staging-casetracker.justice.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
