data "local_file" "hearings-reform-config" {
  filename = "${path.cwd}/../../environments/staging/hearings-reform-hmcts-net.yml"
}

module "hearings-reform" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "stg"
  dns_config          = data.local_file.hearings-config.content
}
