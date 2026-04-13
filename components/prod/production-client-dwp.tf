data "local_file" "production-client-dwp-hmcts-config" {
  filename = "${path.cwd}/../../environments/prod/production-client-dwp-hmcts.yml"
}

module "appeal-immigration" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.production-client-dwp-hmcts-config.content
}
