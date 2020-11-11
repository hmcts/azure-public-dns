resource "azurerm_dns_zone" "courttribunalfinder" {
  name                = "courttribunalfinder.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
}

data "local_file" "courttribunalfinder" {
  filename = "${path.cwd}/../../environments/prod/courttribunalfinder-service-gov-uk.yml"
}

module "courttribunalfinder" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.courttribunalfinder.content).cname
  txt_recordsets      = yamldecode(data.local_file.courttribunalfinder.content).txt
  zone_name           = azurerm_dns_zone.courttribunalfinder.name
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
