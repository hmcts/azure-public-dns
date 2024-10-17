data "local_file" "dev-apps-hmcts-net-config" {
  filename = "${path.cwd}/../../environments/dev/dev-apps-hmcts-net.yml"
}

module "dev-apps-public-dns" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "dev"
  dns_config          = data.local_file.dev-apps-hmcts-net-config.content
}
