
data "local_file" "juror-bureau-config" {
  filename = "${path.cwd}/../../environments/prod/juror-bureau-service-gov-uk.yml"
}

module "respond-divorce" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.juror-bureau-config.content).cname
  zone_name           = "juror-bureau.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
