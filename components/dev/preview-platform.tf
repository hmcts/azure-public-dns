data "local_file" "preview" {
  filename = "${path.cwd}/../../environments/dev/preview.yml"
}

module "public-dns" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "dev"
  dns_config          = data.local_file.preview.content
}
