data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

resource "azurerm_dns_zone" "zone" {
  name                = "hmcts-nle.azurefd.net"
  resource_group_name = data.azurerm_resource_group.main.name
}