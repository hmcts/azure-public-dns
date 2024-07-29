data "local_file" "hmcts_net_config" {
  filename = "${path.cwd}/../../environments/prod/hmcts-net.yml"
}

data "local_file" "hmcts_net_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/hmcts-net.yml"
}

module "hmcts_net" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.hmcts_net_config.content
  shutter_config      = data.local_file.hmcts_net_shutter_config.content
}
