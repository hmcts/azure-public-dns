data "local_file" "preview-api-hmcts-config" {
  filename = "${path.cwd}/../../environments/dev/preview-api-hmcts-net.yml"
}

module "preview-api-hmcts" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "dev"
  dns_config          = data.local_file.preview-api-hmcts-config.content
}
