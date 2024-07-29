// TODO move this to staging
data "local_file" "nle" {
  filename = "${path.cwd}/../../environments/nle/nle.yml"
}

module "public-dns" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "stg"
  dns_config          = data.local_file.nle.content
}
