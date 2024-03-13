data "local_file" "hearings_reform_hmcts_net" {
  filename = "${path.cwd}/../../environments/prod/hearings-reform-hmcts-net.yml"
}

data "local_file" "hearings_reform_hmcts_net_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/hearings-reform-hmcts-net.yml"
}

module "hearings_reform_hmcts_net" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.hearings_reform_hmcts_net.content).cname
  ns_recordsets       = yamldecode(data.local_file.hearings_reform_hmcts_net.content).ns
  a_recordsets        = yamldecode(data.local_file.hearings_reform_hmcts_net.content).A
  txt_recordsets      = yamldecode(data.local_file.hearings_reform_hmcts_net.content).txt
  mx_recordsets       = yamldecode(data.local_file.hearings_reform_hmcts_net.content).mx
  srv_recordsets      = yamldecode(data.local_file.hearings_reform_hmcts_net.content).srv
  zone_name           = "hearings.reform.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  shutter_config      = data.local_file.hearings_reform_hmcts_net_shutter_config.content
}

import {
  id = "/subscriptions/ed302caf-ec27-4c64-a05e-85731c3ce90e/resourceGroups/reformMgmtRG/providers/Microsoft.Network/dnsZones/hearings.reform.hmcts.net"

  to = module.hearings_reform_hmcts_net.azurerm_dns_zone.zone
}
