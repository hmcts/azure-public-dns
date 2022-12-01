data "local_file" "secure-access-config" {
  filename = "${path.cwd}/../../environments/prod/secureaccess-justice-gov-uk.yml"
}

module "secure-access" {
  source              = "../../modules/azure-public-dns/"
  a_recordsets        = yamldecode(data.local_file.secure-access-config.content).A
  ns_recordsets       = yamldecode(data.local_file.secure-access-config.content).ns
  zone_name           = "secureaccess.justice.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
