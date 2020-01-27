resource "azurerm_dns_srv_record" "this" {
  count = length(var.srv_recordsets)

  resource_group_name = lower(var.resource_group_name)
  zone_name           = var.zone_name

  name = var.srv_recordsets[count.index].name
  ttl  = var.srv_recordsets[count.index].ttl

  dynamic "record" {
    for_each = var.srv_recordsets[count.index].record
    content {
      priority = split(",", record.value)[0]
      weight   = split(",", record.value)[1]
      port     = split(",", record.value)[2]
      target   = split(",", record.value)[3]
    }
  }
}