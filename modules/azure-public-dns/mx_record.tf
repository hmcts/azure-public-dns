resource "azurerm_dns_mx_record" "this" {
  count = length(var.mx_recordsets)

  resource_group_name = lower(lower(var.resource_group_name))
  zone_name           = var.zone_name

  name = var.mx_recordsets[count.index].name
  ttl  = var.mx_recordsets[count.index].ttl

  dynamic "record" {
    for_each = var.mx_recordsets[count.index].record
    content {
      preference = split(" ", record.value)[0]
      exchange   = split(" ", record.value)[1]
    }
  }
}