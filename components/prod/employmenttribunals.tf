data "local_file" employmenttribunals-config" {
  filename = "${path.cwd}/../../environments/prod/employmenttribunals-justice-gov-uk.yml"
}

module "employmenttribunals" {
  source              = "../../modules/azure-public-dns/"
  a_recordsets        = yamldecode(data.local_file.employmenttribunals-config.content).A
  ns_recordsets       = yamldecode(data.local_file.employmenttribunals-config.content).ns
  zone_name           = "employmenttribunals.justice.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
