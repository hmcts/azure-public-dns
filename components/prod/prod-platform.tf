data "local_file" "prod-platform-config" {
  filename = "${path.cwd}/../../environments/prod/prod-platform-hmcts-net.yml"
}

data "local_file" "prod_platform_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/prod-platform-hmcts-net.yml"
}

module "prod-platform" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.prod-platform-config.content
  shutter_config      = data.local_file.prod_platform_shutter_config.content
}
