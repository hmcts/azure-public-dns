data "local_file" "sandbox_config" {
  filename = "${path.cwd}/../../environments/sandbox/sandbox.yml"
}

data "local_file" "sandbox_shutter_config" {
  filename = "${path.cwd}/../../shuttering/sandbox/sandbox.yml"
}

module "public-dns" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.sandbox_config.content).cname
  mx_recordsets       = yamldecode(data.local_file.sandbox_config.content).mx
  a_recordsets        = yamldecode(data.local_file.sandbox_config.content).A
  txt_recordsets      = yamldecode(data.local_file.sandbox_config.content).txt
  zone_name           = "sandbox.platform.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "sbox"
  ns_recordsets       = yamldecode(data.local_file.sandbox_config.content).ns
  srv_recordsets      = yamldecode(data.local_file.sandbox_config.content).srv
  shutter_config      = data.local_file.sandbox_shutter_config.content
}