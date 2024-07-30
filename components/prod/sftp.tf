
data "local_file" "sftp-hmcts-config" {
  filename = "${path.cwd}/../../environments/prod/sftp-hmcts-net.yml"
}

data "local_file" "sftp_hmcts_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/sftp-hmcts-net.yml"
}

module "sftp-hmcts" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.sftp-hmcts-config.content
  shutter_config      = data.local_file.sftp_hmcts_shutter_config.content
}
