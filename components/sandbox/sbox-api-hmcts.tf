data "local_file" "sbox-api-hmcts-config" {
  filename = "${path.cwd}/../../environments/sandbox/sbox-api-hmcts-net.yml"
}

module "sbox-api-hmcts" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "sbox"
  dns_config          = data.local_file.sbox-api-hmcts-config.content
}
