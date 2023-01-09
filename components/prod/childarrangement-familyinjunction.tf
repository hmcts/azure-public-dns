data "local_file" "childarrangement-familyinjunction-config" {
  filename = "${path.cwd}/../../environments/prod/childarrangement-familyinjunction-service-gov-uk.yml"
}

module "childarrangement-familyinjunction" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.childarrangement-familyinjunction-config.content).cname
  zone_name           = "childarrangement-familyinjunction.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
