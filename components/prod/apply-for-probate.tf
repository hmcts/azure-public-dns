data "local_file" "apply-for-probate-config" {
  filename = "${path.cwd}/../../environments/prod/apply-for-probate-service-gov-uk.yml"
}

data "local_file" "apply_for_probate_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/apply-for-probate-service-gov-uk.yml"
}

module "apply-for-probate" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.apply-for-probate-config.content).cname
  a_recordsets        = yamldecode(data.local_file.apply-for-probate-config.content).A
  zone_name           = "apply-for-probate.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  shutter_config      = data.local_file.apply_for_probate_shutter_config.content
  zone_area           = lookup(yamldecode(data.local_file.apply-for-probate-config.content), "area", null)
}
