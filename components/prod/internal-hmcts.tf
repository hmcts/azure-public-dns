data "local_file" "internal-hmcts-config" {
  filename = "${path.cwd}/../../environments/prod/internal-hmcts-net.yml"
}

data "local_file" "internal_hmcts_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/internal-hmcts-net.yml"
}

module "internal-hmcts" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.internal-hmcts-config.content
  shutter_config      = data.local_file.internal_hmcts_shutter_config.content
}
