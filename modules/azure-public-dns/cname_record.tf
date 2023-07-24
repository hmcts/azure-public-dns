locals {
  shutter_domain = "azureedge.net"
}

resource "azurerm_dns_cname_record" "this" {
  for_each = { for record in var.cname_records :
    record.name => record
  }

  resource_group_name = lower(var.resource_group_name)
  zone_name           = azurerm_dns_zone.zone.name

  name   = lower(each.value.name)
  ttl    = each.value.ttl
  record = lookup(each.value, "shutter", false) == true ? "hmcts-${split(".", replace(join(".", [each.value.name, var.zone_name]), "www.", ""))[0]}-shutter-${var.env}.${local.shutter_domain}" : lookup(each.value, "shutter_v2", false) ? join(".", [join("-", [each.value.name, "shutter"]), var.zone_name]) : each.value.record

