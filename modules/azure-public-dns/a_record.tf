resource "azurerm_dns_a_record" "this" {
  count = length(var.a_recordsets)

  resource_group_name = lower(var.resource_group_name)
  zone_name           = var.zone_name

  name    = var.a_recordsets[count.index].name
  ttl     = var.a_recordsets[count.index].ttl
  records = var.a_recordsets[count.index].record
}