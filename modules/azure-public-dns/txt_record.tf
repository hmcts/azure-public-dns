resource "azurerm_dns_txt_record" "this" {
  count = length(var.txt_recordsets)

  resource_group_name = lower(var.resource_group_name)
  zone_name           = var.zone_name

  name = var.txt_recordsets[count.index].name
  ttl  = var.txt_recordsets[count.index].ttl

  dynamic "record" {
    for_each = var.txt_recordsets[count.index].record
    content {
      value = record.value
    }
  }

}