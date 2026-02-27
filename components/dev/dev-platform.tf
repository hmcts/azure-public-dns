data "local_file" "dev" {
  filename = "${path.cwd}/../../environments/dev/dev.yml"
}

import {
  to = module.dev.azurerm_dns_a_record.this["csds-active"]
  id = "/subscriptions/ed302caf-ec27-4c64-a05e-85731c3ce90e/resourceGroups/reformmgmtrg/providers/Microsoft.Network/dnsZones/dev.platform.hmcts.net/A/csds-active"
}

import {
  to = module.dev.azurerm_dns_a_record.this["csds-passive"]
  id = "/subscriptions/ed302caf-ec27-4c64-a05e-85731c3ce90e/resourceGroups/reformmgmtrg/providers/Microsoft.Network/dnsZones/dev.platform.hmcts.net/A/csds-passive"
}

module "dev" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "dev"
  dns_config          = data.local_file.dev.content
}
