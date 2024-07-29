data "local_file" "frontdoor_sbox_hmcts_config" {
  filename = "${path.cwd}/../../environments/sandbox/frontdoor-sbox-hmcts.yml"
}

data "local_file" "frontdoor_sbox_hmcts_shutter_config" {
  filename = "${path.cwd}/../../shuttering/sandbox/frontdoor-sbox-hmcts.yml"
}

module "prod-internal" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "sbox"
  dns_config          = data.local_file.frontdoor_sbox_hmcts_config.content
  shutter_config      = data.local_file.frontdoor_sbox_hmcts_shutter_config.content
}
