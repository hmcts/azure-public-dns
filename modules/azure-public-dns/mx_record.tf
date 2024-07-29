resource "azurerm_dns_mx_record" "this" {
  for_each = { for record in local.mx_recordsets :
    record.name => record
  }

  resource_group_name = lower(lower(var.resource_group_name))
  zone_name           = azurerm_dns_zone.zone.name

  name = lower(each.value.name)
  ttl  = each.value.ttl

  dynamic "record" {
    for_each = each.value.record
    content {
      preference = split(" ", record.value)[0]
      exchange   = split(" ", record.value)[1]
    }
  }
}
