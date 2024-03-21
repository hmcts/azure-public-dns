data "local_file" "mailrelay-platform-hmcts-config" {
  filename = "${path.cwd}/../../environments/prod/mailrelay-platform-hmcts-net.yml"
}

data "local_file" "mailrelay_platform_hmcts_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/mailrelay-platform-hmcts-net.yml"
}

module "mailrelay-platform-hmcts" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.mailrelay-platform-hmcts-config.content).cname
  ns_recordsets       = yamldecode(data.local_file.mailrelay-platform-hmcts-config.content).ns
  a_recordsets        = yamldecode(data.local_file.mailrelay-platform-hmcts-config.content).A
  txt_recordsets      = yamldecode(data.local_file.mailrelay-platform-hmcts-config.content).txt
  zone_name           = "mailrelay.platform.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  shutter_config      = data.local_file.mailrelay_platform_hmcts_shutter_config.content
}
