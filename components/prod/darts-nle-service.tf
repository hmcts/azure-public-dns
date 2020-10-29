resource "azurerm_dns_zone" "darts-nle-service" {
  name                = "darts.nle.service.justice.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
}

data "local_file" "darts-nle-service-config" {
  filename = "${path.cwd}/../../environments/prod/darts-nle-service-justice-gov-uk.yml"
}

module "darts-nle-service" {
  source              = "../../modules/azure-public-dns/"
  a_recordsets        = yamldecode(data.local_file.darts-nle-service-config.content).A
  ns_recordsets       = yamldecode(data.local_file.darts-nle-service-config.content).ns
  zone_name           = azurerm_dns_zone.darts-nle-service.name
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
