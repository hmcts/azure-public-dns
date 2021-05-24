data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

data "azuread_group" "dnszone_contributor_group"{
  display_name     = "DTS Public DNS Contributor (env:${var.env})
}
