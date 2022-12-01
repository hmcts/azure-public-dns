data "local_file" "poc-secureaccess-config" {
  filename = "${path.cwd}/../../environments/prod/poc-secureaccess-justice-gov-uk.yml"
}

module "poc-secure-access" {
  source              = "../../modules/azure-public-dns/"
  ns_recordsets       = yamldecode(data.local_file.poc-secureaccess-config.content).ns
  a_recordsets        = yamldecode(data.local_file.poc-secureaccess-config.content).A
  zone_name           = "poc.secureaccess.justice.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
