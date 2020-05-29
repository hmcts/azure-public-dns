resource "azurerm_dns_a_record" "this_alias" {
  for_each = { for record in var.alias_recordsets :
    record.name => record
  }

  resource_group_name = lower(var.resource_group_name)
  zone_name           = var.zone_name

  name    = lower(each.value.name)
  ttl     = each.value.ttl
  target_resource_id   = each.value.target_resource_id
}
