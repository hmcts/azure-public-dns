data "azuread_group" "dnszone_contributor_group"{
  display_name     = "DTS Public DNS Contributor (env:${var.env})"
}