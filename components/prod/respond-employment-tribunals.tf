data "local_file" "respond-et-syr-config" {
  filename = "${path.cwd}/../../environments/prod/respond-et-syr-hmcts-net.yml"
}

data "local_file" "respond_et_syr_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/respond-et-syr-hmcts-net.yml"
}

module "respond-employment-tribunals" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.respond-et-syr-config.content).cname
  zone_name           = "respond-employment-tribunals.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  shutter_config      = data.local_file.respond_et_syr_shutter_config.content
}