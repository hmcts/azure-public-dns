data "local_file" "courtfines-config" {
  filename = "${path.cwd}/../../environments/prod/courtfines-justice-gov-uk.yml"
}

module "courtfines" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.courtfines-config.content).cname
  a_recordsets        = yamldecode(data.local_file.courtfines-config.content).A
  zone_name           = "courtfines.justice.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
