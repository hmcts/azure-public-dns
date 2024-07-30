data "local_file" "hearings_reform_hmcts_net" {
  filename = "${path.cwd}/../../environments/prod/hearings-reform-hmcts-net.yml"
}

data "local_file" "hearings_reform_hmcts_net_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/hearings-reform-hmcts-net.yml"
}

module "hearings_reform_hmcts_net" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.hearings_reform_hmcts_net.content
  shutter_config      = data.local_file.hearings_reform_hmcts_net_shutter_config.content
}

import {
  id = "/subscriptions/ed302caf-ec27-4c64-a05e-85731c3ce90e/resourceGroups/reformMgmtRG/providers/Microsoft.Network/dnsZones/hearings.reform.hmcts.net"

  to = module.hearings_reform_hmcts_net.azurerm_dns_zone.zone
}
