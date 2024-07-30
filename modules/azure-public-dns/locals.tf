data "local_file" "shutter_by_platform" {
  filename = "${path.cwd}/../../shuttering/prod/shutter_by_platform.yml"
}

locals {
  // Extract global shutter value if available or false
  shutter_all = lookup(yamldecode(var.shutter_config), "shutter_all", false)

  shutter_all_cft = lookup(yamldecode(data.local_file.shutter_by_platform.content), "shutter_all_cft", false)
  shutter_all_sds = lookup(yamldecode(data.local_file.shutter_by_platform.content), "shutter_all_sds", false)

  # Extract DNS records from supplied configuration
  a_recordsets     = lookup(yamldecode(var.dns_config), "A")
  cname_recordsets = lookup(yamldecode(var.dns_config), "cname")
  mx_recordsets    = lookup(yamldecode(var.dns_config), "mx")
  ns_recordsets    = lookup(yamldecode(var.dns_config), "ns")
  srv_recordsets   = lookup(yamldecode(var.dns_config), "srv")
  txt_recordsets   = lookup(yamldecode(var.dns_config), "txt")

  # Extract DNS zone name from supplied configuration
  zone_name = lookup(yamldecode(var.dns_config), "zone_name")
}
