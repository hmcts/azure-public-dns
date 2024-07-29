data "local_file" "staging" {
  filename = "${path.cwd}/../../environments/staging/staging.yml"
}

module "staging" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "stg"
  dns_config          = data.local_file.staging.content
}
