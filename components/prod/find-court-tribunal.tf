data "local_file" "find-court-tribunal" {
  filename = "${path.cwd}/../../environments/prod/find-court-tribunal-service-gov-uk.yml"
}

data "local_file" "find_court_tribunal_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/find-court-tribunal-service-gov-uk.yml"
}


module "find-court-tribunal" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.find-court-tribunal.content).cname
  txt_recordsets      = yamldecode(data.local_file.find-court-tribunal.content).txt
  zone_name           = "find-court-tribunal.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  shutter_config      = data.local_file.find_court_tribunal_shutter_config.content
  zone_platform       = lookup(yamldecode(data.local_file.find-court-tribunal.content), "platform", null)
}
