data "local_file" "dev" {
  filename = "${path.cwd}/../../environments/dev/dev.yml"
}

module "dev" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "dev"
  dns_config          = data.local_file.dev.content
}
