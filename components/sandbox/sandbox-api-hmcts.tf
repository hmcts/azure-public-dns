data "local_file" "sandbox-api-hmcts-config" {
  filename = "${path.cwd}/../../environments/sandbox/sandbox-api-hmcts-net.yml"
}

module "sandbox-api-hmcts" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "sbox"
  dns_config          = data.local_file.sandbox-api-hmcts-config.content
}