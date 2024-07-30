data "local_file" "sandbox_config" {
  filename = "${path.cwd}/../../environments/sandbox/sandbox.yml"
}

data "local_file" "sandbox_shutter_config" {
  filename = "${path.cwd}/../../shuttering/sandbox/sandbox.yml"
}

module "public-dns" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "sbox"
  dns_config          = data.local_file.sandbox_config.content
  shutter_config      = data.local_file.sandbox_shutter_config.content
}
