data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

resource "azurerm_dns_zone" "apply-divorce" {
  name                = "apply-divorce.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_dns_zone" "apply-for-probate" {
  name                = "apply-for-probate.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_dns_zone" "appeal-benefit" {
  name                = "appeal-benefit-decision.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_dns_zone" "hmcts-access" {
  name                = "hmcts-access.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_dns_zone" "track-benefit-appeal" {
  name                = "track-benefit-appeal.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_dns_zone" "respond-divorce" {
  name                = "respond-divorce.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_dns_zone" "prod-platform" {
  name                = "prod.platform.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_dns_zone" "moneyclaims" {
  name                = "moneyclaims.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_dns_zone" "platform-hmcts" {
  name                = "platform.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_dns_zone" "hearings" {
  name                = "hearings.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_dns_zone" "vh" {
  name                = "vh.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_dns_zone" "reform-hmcts" {
  name                = "reform.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_dns_zone" "jcm-judiciary" {
  name                = "jcm.judiciary.uk"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_dns_zone" "ctsc-hmcts" {
  name                = "ctsc.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_dns_zone" "hmcts-webchat" {
  name                = "hmcts-webchat.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
} 