
data "local_file" "sftp-hmcts-config" {
  filename = "${path.cwd}/../../environments/prod/sftp-hmcts-net.yml"
}

data "local_file" "sftp_hmcts_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/sftp-hmcts-net.yml"
}

module "sftp-hmcts" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.sftp-hmcts-config.content).cname
  a_recordsets        = yamldecode(data.local_file.sftp-hmcts-config.content).A
  zone_name           = "sftp.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  shutter_config      = data.local_file.sftp_hmcts_shutter_config.content
}