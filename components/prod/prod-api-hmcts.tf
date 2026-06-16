data "local_file" "prod-api-hmcts-config" {
  filename = "${path.cwd}/../../environments/prod/prod-api-hmcts-net.yml"
}

module "prod-api-hmcts" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.prod-api-hmcts-config.content
}
