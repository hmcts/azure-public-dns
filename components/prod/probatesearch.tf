resource "azurerm_dns_zone" "probatesearch" {
  name                = "probatesearch.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
}

data "local_file" "probatesearch" {
  filename = "${path.cwd}/../../environments/prod/probatesearch-service-gov-uk.yml"
}

module "probatesearch" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.probatesearch.content).cname
  txt_recordsets      = yamldecode(data.local_file.probatesearch.content).txt
  zone_name           = azurerm_dns_zone.probatesearch.name
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
