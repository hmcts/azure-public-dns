data "local_file" "respond-et-syr-config" {
  filename = "${path.cwd}/../../environments/prod/respond-et-syr-hmcts-net.yml"
}

data "local_file" "respond_et_syr_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/respond-et-syr-hmcts-net.yml"
}

module "respond-employment-tribunals" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.respond-et-syr-config.content
  shutter_config      = data.local_file.respond_et_syr_shutter_config.content
}
