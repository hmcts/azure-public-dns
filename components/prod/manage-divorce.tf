data "local_file" "manage-divorce-config" {
  filename = "${path.cwd}/../../environments/prod/manage-divorce-application-service-gov-uk.yml"
}

module "manage-divorce" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.manage-divorce-config.content).cname
  txt_recordsets      = yamldecode(data.local_file.manage-divorce-config.content).txt
  zone_name           = "manage-divorce-application.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
