data "local_file" "aat-api-hmcts-config" {
  filename = "${path.cwd}/../../environments/staging/aat-api-hmcts-net.yml"
}

module "aat-api-hmcts" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "stg"
  dns_config          = data.local_file.aat-api-hmcts-config.content
}
