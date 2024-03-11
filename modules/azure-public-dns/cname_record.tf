locals {
  shutter_domain = "azureedge.net"

  // Extract A record shutter configuration from yaml input file
  cname_shuttering = yamldecode(var.shutter_config).cname
  
  // Merge a record values with shutter values, if global shutter is true then ignore shutter file and set all to value of local.global_shutter(true)
  cname_configuration = [for record in var.cname_records :
      merge(
          record, 
          lookup({ for shutter in local.cname_shuttering : shutter.name => shutter }, record.name, {})
      )
  ]
}

resource "azurerm_dns_cname_record" "this" {
  for_each = { for record in local.cname_configuration :
    record.name => record
  }

  resource_group_name = lower(var.resource_group_name)
  zone_name           = azurerm_dns_zone.zone.name

  name   = lower(each.value.name)
  ttl    = each.value.ttl
  record = lookup(each.value, "shutter", false) == true ? join(".", [join("-", [each.value.name, "shutter"]), var.zone_name]) : each.value.record
}
