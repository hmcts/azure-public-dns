data "local_file" "special-tribunals-config" {
  filename = "${path.cwd}/../../environments/prod/special-tribunals-service-gov-uk.yml"
}

module "special-tribunals" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.special-tribunals-config.content).cname
  zone_name           = "special-tribunals.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
