data "local_file" "hwf-pet-config" {
  filename = "${path.cwd}/../../environments/prod/helpwithcourtfees-service-gov-uk.yml"
}

module "helpwithcourtfees" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.hwf-pet-config.content).cname
  zone_name           = "helpwithcourtfees.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
