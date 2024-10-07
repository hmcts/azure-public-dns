data "azuread_group" "dnszone_contributor_group" {
  display_name = "DTS Public DNS Contributor (env:${var.env})"
}
resource "azurerm_role_assignment" "dnszonecontributer" {
  principal_id         = data.azuread_group.dnszone_contributor_group.object_id
  role_definition_name = "DNS Zone Contributor"
  scope                = azurerm_dns_zone.zone.id
}
