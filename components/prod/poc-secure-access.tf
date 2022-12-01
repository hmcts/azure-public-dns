data "local_file" "poc-secure-access-config" {
  filename = "${path.cwd}/../../environments/prod/poc-secureaccess-justice-gov-uk.yml"
}

module "secure-access" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.poc-secure-access-config.content).ns
  a_recordsets        = yamldecode(data.local_file.poc-secure-access-config.content).A
  zone_name           = "poc.secureaccess.justice.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
