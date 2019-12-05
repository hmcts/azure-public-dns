
// data "azurerm_resource_group" "main" {
//   name = var.resource_group_name
// }

// resource "azurerm_dns_zone" "ithc_zone" {
//   name                = "ithc.platform.hmcts.net"
//   resource_group_name = data.azurerm_resource_group.main.name
// }

// data "azurerm_resource_group" "main" {
//   name = var.resource_group_name
// }

// resource "azurerm_dns_zone" "public_dns_zone" {
//   count               = length(var.zones)
//   name                = lookup(element(var.zones, count.index), "name")
//   resource_group_name = data.azurerm_resource_group.main.name
// }

// resource "azurerm_dns_zone" "public_dns_zone" {
//   count               = length(var.zones)
//   name                = var.zones[count.index] 
//   resource_group_name = data.azurerm_resource_group.main.name
// }

# Terraform import base configs
// resource "azurerm_dns_zone" "reformmgmtrg__ithc-platform-hmcts-net" {
//   name                = "ithc.platform.hmcts.net"
//   resource_group_name = "reformmgmtrg"
//   tags = {
//   }
// }

