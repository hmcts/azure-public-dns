data "local_file" "mft-hmcts-config" {
  filename = "${path.cwd}/../../environments/prod/mft-hmcts-net.yml"
}

data "local_file" "mft_hmcts_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/mft-hmcts-net.yml"
}

module "mft-hmcts" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.mft-hmcts-config.content
  shutter_config      = data.local_file.mft_hmcts_shutter_config.content
}
