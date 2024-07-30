data "local_file" "ithc" {
  filename = "${path.cwd}/../../environments/ithc/ithc.yml"
}


module "public-dns" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "ithc"
  dns_config          = data.local_file.ithc.content
}
