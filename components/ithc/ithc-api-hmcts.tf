data "local_file" "ithc-api-hmcts-config" {
  filename = "${path.cwd}/../../environments/ithc/ithc-api-hmcts-net.yml"
}

module "ithc-api-hmcts" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "ithc"
  dns_config          = data.local_file.ithc-api-hmcts-config.content
}
