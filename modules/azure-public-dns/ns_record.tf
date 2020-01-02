resource "azurerm_dns_ns_record" "this" {
  count = length(var.ns_recordsets)

  resource_group_name = lower(var.resource_group_name)
  zone_name           = var.zone_name

  name    = var.ns_recordsets[count.index].name
  ttl     = var.ns_recordsets[count.index].ttl
  records = var.ns_recordsets[count.index].record

}