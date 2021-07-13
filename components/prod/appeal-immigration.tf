data "local_file" "appeal-immigration-asylum-decision-config" {
  filename = "${path.cwd}/../../environments/prod/appeal-immigration-asylum-decision-service-gov-uk.yml"
}

module "apply-divorce" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.appeal-immigration-asylum-decision-config.content).cname
  txt_recordsets      = yamldecode(data.local_file.appeal-immigration-asylum-decision-config.content).txt
  zone_name           = "appeal-immigration-asylum-decision.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
