data "local_file" "ithc-apps-hmcts-config" {
  filename = "${path.cwd}/../../environments/ithc/ithc-apps-hmcts-net.yml"
}

module "public-dns" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "ithc"
  dns_config          = data.local_file.ithc-apps-hmcts-config.content
}
