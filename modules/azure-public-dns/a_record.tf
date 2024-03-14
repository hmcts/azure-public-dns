locals {
  // Extract global shutter value if available or false
  shutter_all_a = lookup(yamldecode(var.shutter_config), "shutter_all_a", false)

  // Extract A record shutter configuration from yaml input file
  a_shuttering = lookup(yamldecode(var.shutter_config), "A", [])

  // Merge a record values with shutter values, if global shutter is true then ignore shutter file and set all to value of local.global_shutter(true)
  a_configuration = var.a_recordsets != null ? [for record in var.a_recordsets :
    merge(
      record,
      (local.shutter_all_a == true ? { shutter: true } : (local.a_shuttering != null ? lookup({ for shutter in local.a_shuttering : shutter.name => shutter }, record.name, {}) : {}))
    )
  ] : []
}

# Should either be a list of records or a target_resource_id (Alias)lookup(yamldecode(data.local_file.records.content), "A", [])
resource "azurerm_dns_a_record" "this" {
  for_each = { for record in local.a_configuration :
    record.name => record
  }

  resource_group_name = lower(var.resource_group_name)
  zone_name           = azurerm_dns_zone.zone.name

  name               = lower(each.value.name)
  ttl                = each.value.ttl
  records            = lookup(each.value, "shutter", false) == true ? null : length(lookup(each.value, "record", [])) == 0 ? null : each.value.record
  target_resource_id = lookup(each.value, "shutter", false) == true ? lookup(each.value, "shutter_resource_id", null) != null ? each.value.shutter_resource_id : each.value.alias_target_resource_id : length(lookup(each.value, "record", [])) == 0 ? each.value.alias_target_resource_id : null
}

output "cnames" {
  value = local.a_configuration
} 