data "local_file" "hearings-config" {
  filename = "${path.cwd}/../../environments/staging/hearings-hmcts-net.yml"
}

module "hearings" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "stg"
  dns_config          = data.local_file.hearings-config.content
}
