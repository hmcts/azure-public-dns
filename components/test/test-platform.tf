data "local_file" "test" {
  filename = "${path.cwd}/../../environments/test/test.yml"
}

module "test" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "test"
  dns_config          = data.local_file.test.content
}
