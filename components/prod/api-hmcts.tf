data "local_file" "api_hmcts_net_config" {
  filename = "${path.cwd}/../../environments/prod/api-hmcts-net.yml"
}

module "api_hmcts" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.api_hmcts_net_config.content
}