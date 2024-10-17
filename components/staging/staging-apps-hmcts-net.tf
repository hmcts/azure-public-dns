data "local_file" "staging-apps-hmcts-net-config" {
  filename = "${path.cwd}/../../environments/staging/staging-apps-hmcts-net.yml"
}

module "staging-apps-public-dns" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "stg"
  dns_config          = data.local_file.staging-apps-hmcts-net-config.content
}
