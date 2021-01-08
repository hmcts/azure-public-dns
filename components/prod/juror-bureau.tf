resource "azurerm_dns_zone" "juror-bureau" {
  name                = "juror.bureau.justice.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
}

data "local_file" "juror-bureau-config" {
  filename = "${path.cwd}/../../environments/prod/juror-bureau-justice-gov-uk.yml"
}

module "juror-bureau" {
  source              = "../../modules/azure-public-dns/"
  a_recordsets        = yamldecode(data.local_file.juror-bureau-config.content).A
  ns_recordsets       = yamldecode(data.local_file.juror-bureau-config.content).ns
  zone_name           = azurerm_dns_zone.juror-bureau.name
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
