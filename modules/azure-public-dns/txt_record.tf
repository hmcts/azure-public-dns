resource "azurerm_dns_txt_record" "this" {
  for_each = { for record in var.txt_recordsets :
    record.name => record
  }

  resource_group_name = lower(var.resource_group_name)
  zone_name           = var.zone_name

  name = each.value.name
  ttl  = each.value.ttl

  dynamic "record" {
    for_each = each.value.record
    content {
      value = record.value
    }
  }

}