data "local_file" "reform-hmcts-config" {
  filename = "${path.cwd}/../../environments/prod/reform-hmcts-net.yml"
}

data "local_file" "reform_hmcts_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/reform-hmcts-net.yml"
}

module "reform-hmcts" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.reform-hmcts-config.content
  shutter_config      = data.local_file.reform_hmcts_shutter_config.content
}
