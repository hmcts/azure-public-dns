resource "azurerm_dns_txt_record" "this" {
  for_each = { for record in local.txt_recordsets :
    record.name => record
  }

  resource_group_name = lower(var.resource_group_name)
  zone_name           = azurerm_dns_zone.zone.name

  name = lower(each.value.name)
  ttl  = each.value.ttl

  dynamic "record" {
    for_each = each.value.record
    content {
      value = record.value
    }
  }

}
