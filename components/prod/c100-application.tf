data "local_file" "c100-application-config" {
  filename = "${path.cwd}/../../environments/prod/apply-to-court-about-child-arrangements-service-justice-gov-uk.yml"
}

data "local_file" "c100_application_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/apply-to-court-about-child-arrangements-service-justice-gov-uk.yml"
}

module "c100-application" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.c100-application-config.content).cname
  zone_name           = "apply-to-court-about-child-arrangements.service.justice.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  shutter_config      = data.local_file.c100_application_shutter_config.content
  area                = data.local_file.c100-application-config.content.area
}
