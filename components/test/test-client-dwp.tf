data "local_file" "test-client-dwp-hmcts-config" {
  filename = "${path.cwd}/../../environments/test/test-client-dwp-hmcts.yml"
}

module "test-client-dwp" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "test"
  dns_config          = data.local_file.test-client-dwp-hmcts-config.content
}
