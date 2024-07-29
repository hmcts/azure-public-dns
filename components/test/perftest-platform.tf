data "local_file" "perftest" {
  filename = "${path.cwd}/../../environments/test/perftest.yml"
}

module "public-dns" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "test"
  dns_config          = data.local_file.perftest.content
}
