data "local_file" "find-court-tribunal" {
  filename = "${path.cwd}/../../environments/prod/find-court-tribunal-service-gov-uk.yml"
}

module "find-court-tribunal" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.find-court-tribunal.content).cname
  txt_recordsets      = yamldecode(data.local_file.find-court-tribunal.content).txt
  zone_name           = "find-court-tribunal.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
