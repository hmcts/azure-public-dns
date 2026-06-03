data "local_file" "staging-api-hmcts-config" {
  filename = "${path.cwd}/../../environments/staging/staging-api-hmcts-net.yml"
}

module "staging-api-hmcts" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "stg"
  dns_config          = data.local_file.staging-api-hmcts-config.content
}
