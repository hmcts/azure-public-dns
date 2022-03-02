data "local_file" "pip-court-tribunal-hearings-config" {
  filename = "${path.cwd}/../../environments/prod/pip-court-tribunal-hearings-service-gov-uk.yml"
}

module "pip-court-tribunal-hearings" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.pip-court-tribunal-hearings-config.content).cname
  txt_recordsets      = yamldecode(data.local_file.pip-court-tribunal-hearings-config.content).txt
  zone_name           = "court-tribunal-hearings-service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
