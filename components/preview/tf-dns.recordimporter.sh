terraform import -var resource_group_name=reformmgmtrg azurerm_dns_zone.zone /subscriptions/ed302caf-ec27-4c64-a05e-85731c3ce90e/resourceGroups/reformmgmtrg/providers/Microsoft.Network/dnszones/preview.platform.hmcts.net
terraform import -var resource_group_name=reformmgmtrg module.public-dns.azurerm_dns_ns_record.this[0] /subscriptions/ed302caf-ec27-4c64-a05e-85731c3ce90e/resourceGroups/reformmgmtrg/providers/Microsoft.Network/dnszones/preview.platform.hmcts.net/NS/@
terraform import -var resource_group_name=reformmgmtrg module.public-dns.azurerm_dns_cname_record.this[0] /subscriptions/ed302caf-ec27-4c64-a05e-85731c3ce90e/resourceGroups/reformmgmtrg/providers/Microsoft.Network/dnszones/preview.platform.hmcts.net/CNAME/_a041dd4b4af467422ed8129fd9af1b37
