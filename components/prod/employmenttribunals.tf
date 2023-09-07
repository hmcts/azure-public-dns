data "local_file" "et-pet-config" {
  filename = "${path.cwd}/../../environments/prod/employmenttribunals-service-gov-uk.yml"
}

module "employment-tribunals" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.et-pet-config.content).cname
  zone_name           = "employmenttribunals.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
