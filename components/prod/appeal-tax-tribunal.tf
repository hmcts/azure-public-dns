data "local_file" "tt-pet-config" {
  filename = "${path.cwd}/../../environments/prod/appeal-tax-tribunal-service-gov-uk.yml"
}

module "appeal-tax-tribunal" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.tt-pet-config.content).cname
  zone_name           = "appeal-tax-tribunal.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
