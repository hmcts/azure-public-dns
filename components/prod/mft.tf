data "local_file" "mft-hmcts-config" {
  filename = "${path.cwd}/../../environments/prod/mft-hmcts-net.yml"
}

data "local_file" "mft_hmcts_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/mft-hmcts-net.yml"
}

module "mft-hmcts" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.mft-hmcts-config.content).cname
  a_recordsets        = yamldecode(data.local_file.mft-hmcts-config.content).A
  zone_name           = "mft.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  shutter_config      = data.local_file.mft_hmcts_shutter_config.content
}