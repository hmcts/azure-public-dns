data "local_file" "perftest-api-hmcts-config" {
  filename = "${path.cwd}/../../environments/test/perftest-api-hmcts-net.yml"
}

module "perftest-api-hmcts" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "test"
  dns_config          = data.local_file.perftest-api-hmcts-config.content
}
