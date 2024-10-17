data "local_file" "test-apps-hmcts-net-config" {
  filename = "${path.cwd}/../../environments/test/test-apps-hmcts-net.yml"
}

module "test-apps-public-dns" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "test"
  dns_config          = data.local_file.test-apps-hmcts-net-config.content
}
