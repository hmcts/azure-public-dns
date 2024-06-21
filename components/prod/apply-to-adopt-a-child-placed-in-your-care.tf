data "local_file" "apply-to-adopt-a-child-placed-in-your-care-config" {
  filename = "${path.cwd}/../../environments/prod/apply-to-adopt-a-child-placed-in-your-care-service-gov-uk.yml"
}

data "local_file" "apply_to_adopt_a_child_placed_in_your_care_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/apply-to-adopt-a-child-placed-in-your-care-service-gov-uk.yml"
}

module "apply-to-adopt-a-child-placed-in-your-care" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.apply-to-adopt-a-child-placed-in-your-care-config.content).cname
  ns_recordsets       = yamldecode(data.local_file.apply-to-adopt-a-child-placed-in-your-care-config.content).ns
  a_recordsets        = yamldecode(data.local_file.apply-to-adopt-a-child-placed-in-your-care-config.content).A
  txt_recordsets      = yamldecode(data.local_file.apply-to-adopt-a-child-placed-in-your-care-config.content).txt
  mx_recordsets       = yamldecode(data.local_file.apply-to-adopt-a-child-placed-in-your-care-config.content).mx
  zone_name           = "apply-to-adopt-a-child-placed-in-your-care.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  shutter_config      = data.local_file.apply_to_adopt_a_child_placed_in_your_care_shutter_config.content
  zone_platform       = lookup(yamldecode(data.local_file.apply-to-adopt-a-child-placed-in-your-care-config.content), "platform", null)
}
