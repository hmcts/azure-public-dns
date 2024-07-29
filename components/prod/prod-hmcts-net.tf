data "local_file" "prod-hmcts-net" {
  filename = "${path.cwd}/../../environments/prod/prod-hmcts-net.yml"
}

data "local_file" "prod_hmcts_net_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/prod-hmcts-net.yml"
}

module "prod-hmcts-net" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.prod-hmcts-net.content
  shutter_config      = data.local_file.prod_hmcts_net_shutter_config.content
}
