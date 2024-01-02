data "local_file" "moneyclaims1-config" {
  filename = "${path.cwd}/../../environments/prod/moneyclaims1-service-gov-uk.yml"
}

module "moneyclaims1" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.moneyclaims1-config.content).cname
  zone_name           = "moneyclaims1.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
