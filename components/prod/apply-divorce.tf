data "local_file" "apply-divorce-config" {
  filename = "${path.cwd}/../../environments/prod/apply-divorce-service-gov-uk.yml"
}

data "local_file" "apply_divorce_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/apply-divorce-service-gov-uk.yml"
}

module "apply-divorce" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.apply-divorce-config.content).cname
  txt_recordsets      = yamldecode(data.local_file.apply-divorce-config.content).txt
  zone_name           = "apply-divorce.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  shutter_config      = data.local_file.apply_divorce_shutter_config.content
  zone_area           = lookup(yamldecode(data.local_file.apply-divorce-config.content), "area", null)
}
