data "local_file" "pre-recorded-evidence-justice-config" {
  filename = "${path.cwd}/../../environments/prod/pre-recorded-evidence-justice-gov-uk.yml"
}

module "pre-recorded-evidence-justice" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.pre-recorded-evidence-justice-config.content).cname
  a_recordsets        = yamldecode(data.local_file.pre-recorded-evidence-justice-config.content).A
  zone_name           = "pre-recorded-evidence.justice.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}