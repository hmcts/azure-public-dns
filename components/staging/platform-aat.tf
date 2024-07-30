data "local_file" "aat" {
  filename = "${path.cwd}/../../environments/staging/aat.yml"
}

module "public-dns" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "stg"
  dns_config          = data.local_file.aat.content
}
