locals {
  shutter_domain = "azureedge.net"
}

resource "azurerm_dns_cname_record" "this" {
  count = length(var.cname_records)

  resource_group_name = lower(var.resource_group_name)
  zone_name           = var.zone_name

  name   = var.cname_records[count.index].name
  ttl    = var.cname_records[count.index].ttl
  # record = var.cname_records[count.index].shutter == true ? "hmcts-${replace(split(".", var.cname_records[count.index].name)[length(split(".", var.cname_records[count.index].name))-1], "www", split(".", var.zone_name)[0])}-shutter-${var.env}.${local.shutter_domain}" : var.cname_records[count.index].record
  record = var.cname_records[count.index].shutter == true ? "hmcts-${split(".", replace(join(".",[var.cname_records[count.index].name, var.zone_name]), "www.", ""))[0]}-shutter-${var.env}.${local.shutter_domain}" : var.cname_records[count.index].record
}