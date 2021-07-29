data "local_file" "appeal-immigration-asylum-decision-config" {
  filename = "${path.cwd}/../../environments/prod/appeal-immigration-asylum-decision-service-gov-uk.yml"
}

module "appeal-immigration" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.appeal-immigration-asylum-decision-config.content).cname
  zone_name           = "appeal-immigration-asylum-decision.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
