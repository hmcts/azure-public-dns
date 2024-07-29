data "local_file" "apply-to-adopt-a-child-placed-in-your-care-config" {
  filename = "${path.cwd}/../../environments/prod/apply-to-adopt-a-child-placed-in-your-care-service-gov-uk.yml"
}

data "local_file" "apply_to_adopt_a_child_placed_in_your_care_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/apply-to-adopt-a-child-placed-in-your-care-service-gov-uk.yml"
}

module "apply-to-adopt-a-child-placed-in-your-care" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.apply-to-adopt-a-child-placed-in-your-care-config.content
  shutter_config      = data.local_file.apply_to_adopt_a_child_placed_in_your_care_shutter_config.content
}
