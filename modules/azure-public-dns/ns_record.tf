resource "azurerm_dns_ns_record" "this" {
  for_each = { for record in local.ns_recordsets :
    record.name => record
  }

  resource_group_name = lower(var.resource_group_name)
  zone_name           = azurerm_dns_zone.zone.name

  name    = lower(each.value.name)
  ttl     = each.value.ttl
  records = each.value.record
}
