data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

resource "azurerm_dns_zone" "zone1" {
  name                = "appeal-benefit-decision.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_dns_zone" "zone2" {
  name                = "apply-divorce.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_dns_zone" "zone3" {
  name                = "apply-for-probate.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_dns_zone" "zone4" {
  name                = "divorce.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_dns_zone" "zone5" {
  name                = "hearings.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_dns_zone" "zone6" {
  name                = "hmcts-access.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_dns_zone" "zone7" {
  name                = "jcm.judiciary.uk"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_dns_zone" "zone8" {
  name                = "moneyclaims.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_dns_zone" "zone9" {
  name                = "platform.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_dns_zone" "zone10" {
  name                = "prod.platform.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_dns_zone" "zone11" {
  name                = "reform.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_dns_zone" "zone12" {
  name                = "respond-divorce.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_dns_zone" "zone13" {
  name                = "tmapply-divorce.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_dns_zone" "zone14" {
  name                = "tmjcm.judiciary.uk"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_dns_zone" "zone15" {
  name                = "tmrespond-divorce.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_dns_zone" "zone16" {
  name                = "track-benefit-appeal.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
}