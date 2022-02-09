data "local_file" "end-civil-partnership-config" {
  filename = "${path.cwd}/../../environments/prod/end-civil-partnership-service-gov-uk.yml"
}

module "end-civil-partnership" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.end-civil-partnership-config.content).cname
  zone_name           = "end-civil-partnership.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
