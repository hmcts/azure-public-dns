data "local_file" "nle-hmcts-net" {
  filename = "${path.cwd}/../../environments/nle/nle-hmcts-net.yml"
}

module "nle-hmcts-net" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "stg"
  dns_config          = data.local_file.nle-hmcts-net.content
}
