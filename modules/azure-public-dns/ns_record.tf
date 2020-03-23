resource "azurerm_dns_ns_record" "this" {
  for_each = { for record in var.ns_recordsets :
    record.name => record
  }

  resource_group_name = lower(var.resource_group_name)
  zone_name           = var.zone_name

  name    = each.value.name
  ttl     = each.value.ttl
  records = each.value.record
}