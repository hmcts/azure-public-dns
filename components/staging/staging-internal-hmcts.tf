data "local_file" "staging-internal-hmcts-config" {
  filename = "${path.cwd}/../../environments/staging/staging-internal-hmcts-net.yml"
}

module "staging-internal" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "stg"
  dns_config          = data.local_file.staging-internal-hmcts-config.content
}
