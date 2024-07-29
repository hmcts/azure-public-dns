data "local_file" "apply-to-court-about-child-arrangements-c100-config" {
  filename = "${path.cwd}/../../environments/prod/apply-to-court-about-child-arrangements-c100-service-gov-uk.yml"
}

data "local_file" "apply_to_court_about_child_arrangements_c100_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/apply-to-court-about-child-arrangements-c100-service-gov-uk.yml"
}

module "apply-to-court-about-child-arrangements-c100" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.apply-to-court-about-child-arrangements-c100-config.content
  shutter_config      = data.local_file.apply_to_court_about_child_arrangements_c100_shutter_config.content
}
