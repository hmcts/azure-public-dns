resource "azurerm_dns_caa_record" "this" {
  for_each = { for record in var.caa_recordsets :
    record.name => record
  }

  resource_group_name = lower(var.resource_group_name)
  zone_name           = var.zone_name

  name    = lower(each.value.name)
  ttl     = each.value.ttl
  records = each.value.record
  flags   = each.value.flag
  tag     = each.value.tag
}
