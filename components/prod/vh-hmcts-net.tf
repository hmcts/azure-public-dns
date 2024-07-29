data "local_file" "vh-config" {
  filename = "${path.cwd}/../../environments/prod/vh-hmcts-net.yml"
}

data "local_file" "vh_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/vh-hmcts-net.yml"
}

module "vh" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.vh-config.content
  shutter_config      = data.local_file.vh_shutter_config.content
}
