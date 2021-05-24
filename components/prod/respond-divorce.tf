
data "local_file" "respond-divorce-config" {
  filename = "${path.cwd}/../../environments/prod/respond-divorce-service-gov-uk.yml"
}

module "respond-divorce" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.respond-divorce-config.content).cname
  zone_name           = "respond-divorce.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
