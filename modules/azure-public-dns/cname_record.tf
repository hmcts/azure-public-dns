locals {
  shutter_domain = "azureedge.net"
}

resource "azurerm_dns_cname_record" "this" {
  count = length(var.cname_records)

  resource_group_name = lower(var.resource_group_name)
  zone_name           = var.zone_name

  name   = var.cname_records[count.index].name
  ttl    = var.cname_records[count.index].ttl
  record = lookup(var.cname_records[count.index], "shutter", false) == true ? "hmcts-${split(".", replace(join(".",[var.cname_records[count.index].name, var.zone_name]), "www.", ""))[0]}-shutter-${var.env}.${local.shutter_domain}" : var.cname_records[count.index].record
}
