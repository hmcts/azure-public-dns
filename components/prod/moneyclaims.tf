resource "azurerm_dns_zone" "moneyclaims" {
  name                = "moneyclaims.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
}

data "local_file" "moneyclaims-config" {
  filename = "${path.cwd}/../../environments/prod/moneyclaims-service-gov-uk.yml"
}

module "moneyclaims" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.moneyclaims-config.content).cname
  zone_name           = azurerm_dns_zone.moneyclaims.name
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
