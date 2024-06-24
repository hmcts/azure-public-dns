locals {
  shutter_domain = "azureedge.net"

  # Extract shutter_all_cname value if available or false
  # If global shutter is true, set to true otherwise set to value of shutter_all_cname
  shutter_all_cname = local.shutter_all == true ? true : lookup(yamldecode(var.shutter_config), "shutter_all_cname", false)

  // Extract A record shutter configuration from yaml input file
  cname_shuttering = lookup(yamldecode(var.shutter_config), "cname", [])

  // Merge CNAME record values with shutter values, if global shutter is true then ignore shutter file and set all to value of true
  cname_configuration = var.cname_records != null ? [
    for record in var.cname_records : {
      name     = record.name
      platform = lookup(record, "platform", null)
      ttl      = record.ttl
      record   = record.record
      shutter = (local.shutter_all_cname != true ? (local.cname_shuttering != null ? lookup({ for shutter in local.cname_shuttering : shutter.name => shutter }, record.name, { shutter = false }).shutter : false) : true
      )
    }
  ] : []
}

resource "azurerm_dns_cname_record" "this" {
  for_each = { for record in local.cname_configuration :
    record.name => record
  }

  resource_group_name = lower(var.resource_group_name)
  zone_name           = azurerm_dns_zone.zone.name

  name   = lower(each.value.name)
  ttl    = each.value.ttl
  record = lookup(each.value, "shutter", false) == true ? join(".", [join("-", [replace(each.value.name, "*", "asterisk"), "shutter"]), var.zone_name]) : each.value.record
}
