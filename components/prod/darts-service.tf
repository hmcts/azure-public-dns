resource "azurerm_dns_zone" "darts-service" {
  name                = "darts.service.justice.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
}

data "local_file" "darts-service-config" {
  filename = "${path.cwd}/../../environments/prod/darts-service-justice-gov-uk.yml"
}

module "darts-service" {
  source              = "../../modules/azure-public-dns/"
  a_records           = yamldecode(data.local_file.darts-service-config.content).a
  zone_name           = azurerm_dns_zone.darts-service.name
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
