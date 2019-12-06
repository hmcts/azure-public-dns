data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

resource "azurerm_dns_zone" "zone" {
  name                = "sandbox.platform.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
}
// # azurerm_dns_ns_record.this-0:
//   resource "azurerm_dns_ns_record" "this" {
//   name                = "@"
//   resource_group_name = "reformmgmtrg"
//   tags = {
//   }
// }

// # azurerm_dns_cname_record.this-1:
// resource "azurerm_dns_cname_record" "this" {
//     name                = "manage.appeal-benefit-decision"
//     record              = "hmcts-sscs-cor-frontend-ithc.trafficmanager.net"
//     resource_group_name = "reformmgmtrg"
//     tags                = {}
//     ttl                 = 60
//     zone_name           = "ithc.platform.hmcts.net"
// }

// # azurerm_dns_cname_record.this-2:
// resource "azurerm_dns_cname_record" "this-2" {
//     name                = "tmmanage.appeal-benefit-decision"
//     record              = "590582cd-441a-4601-9f6a-f8203d4c19fe.cloudapp.net"
//     resource_group_name = "reformmgmtrg"
//     tags                = {}
//     ttl                 = 60
//     zone_name           = "ithc.platform.hmcts.net"
// }

// # azurerm_dns_a_record.this-3:
// resource "azurerm_dns_cname_record" "this-3" {
//     name                = "ccpay-bubble"
//     record              = "11d1facb-25d7-49ef-a8dc-d698479270a2.cloudapp.net"
//     resource_group_name = "reformmgmtrg"
//     tags                = {}
//     ttl                 = 60
//     zone_name           = "ithc.platform.hmcts.net"
// }

// # azurerm_dns_a_record.this-4:
// resource "azurerm_dns_a_record" "this" {
//     name                = "ctscmail"
//     records             = [
//         "51.104.202.183",
//     ]
//     resource_group_name = "reformmgmtrg"
//     tags                = {}
//     ttl                 = 3600
//     zone_name           = "ithc.platform.hmcts.net"
// }

// # azurerm_dns_cname_record.this-5:
// resource "azurerm_dns_cname_record" "this-5" {
//     name                = "decree-absolute-aks"
//     record              = "hmcts-ithc.azurefd.net"
//     resource_group_name = "reformmgmtrg"
//     tags                = {}
//     ttl                 = 3600
//     zone_name           = "ithc.platform.hmcts.net"
// }

// # azurerm_dns_cname_record.this-6:
// resource "azurerm_dns_cname_record" "this-6" {
//     name                = "decree-nisi-aks"
//     record              = "hmcts-ithc.azurefd.net"
//     resource_group_name = "reformmgmtrg"
//     tags                = {}
//     ttl                 = 3600
//     zone_name           = "ithc.platform.hmcts.net"
// }

// # azurerm_dns_cname_record.this-7:
// resource "azurerm_dns_cname_record" "this-7" {
//     name                = "gateway-ccd"
//     record              = "a56e4113-9db3-4bd3-ad20-01f2eb3926c4.cloudapp.net"
//     resource_group_name = "reformmgmtrg"
//     tags                = {}
//     ttl                 = 60
//     zone_name           = "ithc.platform.hmcts.net"
// }

// # azurerm_dns_cname_record.this-8:
// resource "azurerm_dns_cname_record" "this-8" {
//     name                = "idam-web-public"
//     record              = "f8ba11e0-da48-45a5-b105-7aed33e2bf42.cloudapp.net"
//     resource_group_name = "reformmgmtrg"
//     tags                = {}
//     ttl                 = 60
//     zone_name           = "ithc.platform.hmcts.net"
// }

// # azurerm_dns_mx_record.this-9:
// resource "azurerm_dns_mx_record" "this" {
//     name                = "contact.justice"
//     resource_group_name = "reformmgmtrg"
//     tags                = {}
//     ttl                 = 3600
//     zone_name           = "ithc.platform.hmcts.net"

//     record {
//         exchange   = "ctscmail.ithc.platform.hmcts.net"
//         preference = "10"
//     }
// }

// # azurerm_dns_txt_record.this-10:
// resource "azurerm_dns_txt_record" "this" {
//     name                = "contact.justice"
//     resource_group_name = "reformmgmtrg"
//     tags                = {}
//     ttl                 = 3600
//     zone_name           = "ithc.platform.hmcts.net"

//     record {
//         value = "v=spf1 ip4:51.145.107.152  ip4:51.145.123.93 -all"
//     }
// }

// # azurerm_dns_txt_record.this-11"
// resource "azurerm_dns_txt_record" "this-11" {
//     name                = "_dmarc.contact.justice"
//     resource_group_name = "reformmgmtrg"
//     tags                = {}
//     ttl                 = 3600
//     zone_name           = "ithc.platform.hmcts.net"

//     record {
//         value = "v=DMARC1; p=none"
//     }
// }

// # azurerm_dns_cname_record.this-12:
// resource "azurerm_dns_cname_record" "this-12" {
//     name                = "moneyclaim-legal"
//     record              = "e10387a8-f6ed-40f8-9557-f158497ccb5e.cloudapp.net"
//     resource_group_name = "reformmgmtrg"
//     tags                = {}
//     ttl                 = 60
//     zone_name           = "ithc.platform.hmcts.net"
// }

// # azurerm_dns_cname_record.this-13:
// resource "azurerm_dns_cname_record" "this-13" {
//     name                = "moneyclaims"
//     record              = "e10387a8-f6ed-40f8-9557-f158497ccb5e.cloudapp.net"
//     resource_group_name = "reformmgmtrg"
//     tags                = {}
//     ttl                 = 60
//     zone_name           = "ithc.platform.hmcts.net"
// }

// # azurerm_dns_cname_record.this-14:
// resource "azurerm_dns_cname_record" "this-14" {
//     name                = "moneyclaims-legal"
//     record              = "e10387a8-f6ed-40f8-9557-f158497ccb5e.cloudapp.net"
//     resource_group_name = "reformmgmtrg"
//     tags                = {}
//     ttl                 = 60
//     zone_name           = "ithc.platform.hmcts.net"
// }

// # azurerm_dns_a_record.this-15:
// resource "azurerm_dns_a_record" "this-15" {
//     name                = "paybubble"
//     records             = [
//         "51.143.182.143",
//     ]
//     resource_group_name = "reformmgmtrg"
//     tags                = {}
//     ttl                 = 60
//     zone_name           = "ithc.platform.hmcts.net"
// }

// # azurerm_dns_cname_record.this-16:
// resource "azurerm_dns_cname_record" "this-16" {
//     name                = "petitioner-frontend-aks"
//     record              = "hmcts-ithc.azurefd.net"
//     resource_group_name = "reformmgmtrg"
//     tags                = {}
//     ttl                 = 3600
//     zone_name           = "ithc.platform.hmcts.net"
// }

// # azurerm_dns_cname_record.this-17:
// resource "azurerm_dns_cname_record" "this-17" {
//     name                = "respond-divorce-aks"
//     record              = "hmcts-ithc.azurefd.net"
//     resource_group_name = "reformmgmtrg"
//     tags                = {}
//     ttl                 = 3600
//     zone_name           = "ithc.platform.hmcts.net"
// }

// # azurerm_dns_cname_record.this-18:
// resource "azurerm_dns_cname_record" "this-18" {
//     name                = "sscs-tribunals-frontend"
//     record              = "hmcts-sscs-tribunals-frontend-ithc.trafficmanager.net"
//     resource_group_name = "reformmgmtrg"
//     tags                = {}
//     ttl                 = 300
//     zone_name           = "ithc.platform.hmcts.net"
// }

// # azurerm_dns_cname_record.this-19:
// resource "azurerm_dns_cname_record" "this-19" {
//     name                = "tmsscs-tribunals-frontend"
//     record              = "590582cd-441a-4601-9f6a-f8203d4c19fe.cloudapp.net"
//     resource_group_name = "reformmgmtrg"
//     tags                = {}
//     ttl                 = 300
//     zone_name           = "ithc.platform.hmcts.net"
// }

// # azurerm_dns_cname_record.this-20:
// resource "azurerm_dns_cname_record" "this-20" {
//     name                = "www-ccd"
//     record              = "a56e4113-9db3-4bd3-ad20-01f2eb3926c4.cloudapp.net"
//     resource_group_name = "reformmgmtrg"
//     tags                = {}
//     ttl                 = 60
//     zone_name           = "ithc.platform.hmcts.net"
// }

# Terraform import base configs
// resource "azurerm_dns_ns_record" "this-0" {
//   name                = "tmmanage.appeal-benefit-decision"
//   resource_group_name = "reformmgmtrg"
//   tags = {
//   }
// }

// resource "azurerm_dns_ns_record" "this-1" {
//   name                = "@"
//   resource_group_name = "reformmgmtrg"
//   tags = {
//   }
// }

// resource "azurerm_dns_mx_record" "this-2" {
//   name                = "contact.justice"
//   resource_group_name = "reformmgmtrg"
//   tags = {
//   }
// }

// resource "azurerm_dns_txt_record" "this-3" {
//   name                = "contact.justice"
//   resource_group_name = "reformmgmtrg"
//   tags = {
//   }
// }

// resource "azurerm_dns_txt_record" "this-4" {
//   name                = "_dmarc.contact.justice"
//   resource_group_name = "reformmgmtrg"
//   tags = {
//   }
// }

// resource "azurerm_dns_a_record" "this-5" {
//   name                = "paybubble"
//   resource_group_name = "reformmgmtrg"
//   tags = {
//   }
// }

// resource "azurerm_dns_a_record" "this-6" {
//   name                = "ctscmail"
//   resource_group_name = "reformmgmtrg"
//   tags = {
//   }
// }

// resource "azurerm_dns_cname_record" "this-7" {
//   name                = "manage.appeal-benefit-decision"
//   resource_group_name = "reformmgmtrg"
//   tags = {
//   }
// }

// resource "azurerm_dns_cname_record" "this-8" {
//   name                = "tmmanage.appeal-benefit-decision"
//   resource_group_name = "reformmgmtrg"
//   tags = {
//   }
// }

// resource "azurerm_dns_cname_record" "this-9" {
//   name                = "ccpay-bubble"
//   resource_group_name = "reformmgmtrg"
//   tags = {
//   }
// }

// resource "azurerm_dns_cname_record" "this-10" {
//   name                = "decree-absolute-aks"
//   resource_group_name = "reformmgmtrg"
//   tags = {
//   }
// }

// resource "azurerm_dns_cname_record" "this-11" {
//   name                = "decree-nisi-aks"
//   resource_group_name = "reformmgmtrg"
//   tags = {
//   }
// }

// resource "azurerm_dns_cname_record" "this-12" {
//   name                = "gateway-ccd"
//   resource_group_name = "reformmgmtrg"
//   tags = {
//   }
// }

// resource "azurerm_dns_cname_record" "this-13" {
//   name                = "idam-web-public"
//   resource_group_name = "reformmgmtrg"
//   tags = {
//   }
// }

// resource "azurerm_dns_cname_record" "this-14" {
//   name                = "moneyclaim-legal"
//   resource_group_name = "reformmgmtrg"
//   tags = {
//   }
// }

// resource "azurerm_dns_cname_record" "this-15" {
//   name                = "moneyclaims"
//   resource_group_name = "reformmgmtrg"
//   tags = {
//   }
// }

// resource "azurerm_dns_cname_record" "this-16" {
//   name                = "moneyclaims-legal"
//   resource_group_name = "reformmgmtrg"
//   tags = {
//   }
// }

// resource "azurerm_dns_cname_record" "this-17" {
//   name                = "petitioner-frontend-aks"
//   resource_group_name = "reformmgmtrg"
//   tags = {
//   }
// }

// resource "azurerm_dns_cname_record" "this-18" {
//   name                = "respond-divorce-aks"
//   resource_group_name = "reformmgmtrg"
//   tags = {
//   }
// }

// resource "azurerm_dns_cname_record" "this-19" {
//   name                = "sscs-tribunals-frontend"
//   resource_group_name = "reformmgmtrg"
//   tags = {
//   }
// }

// resource "azurerm_dns_cname_record" "this-20" {
//   name                = "tmsscs-tribunals-frontend"
//   resource_group_name = "reformmgmtrg"
//   tags = {
//   }
// }

// resource "azurerm_dns_cname_record" "this-21" {
//   name                = "www-ccd"
//   resource_group_name = "reformmgmtrg"
//   tags = {
//   }
// }