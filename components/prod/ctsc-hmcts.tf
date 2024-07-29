data "local_file" "ctsc-hmcts-config" {
  filename = "${path.cwd}/../../environments/prod/ctsc-hmcts-net.yml"
}

data "local_file" "ctsc_hmcts_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/ctsc-hmcts-net.yml"
}

module "ctsc-hmcts" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.ctsc-hmcts-config.content
  shutter_config      = data.local_file.ctsc_hmcts_shutter_config.content
}
