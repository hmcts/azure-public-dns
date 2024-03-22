data "local_file" "records" {
  filename = "${path.cwd}/records.yml"
}
data "local_file" "shutters" {
  filename = "${path.cwd}/shutters.yml"
}

locals {
  shutter_all = lookup(yamldecode(data.local_file.shutters.content), "shutter_all", false)

  shutter_all_a = local.shutter_all == true ? true : lookup(yamldecode(data.local_file.shutters.content), "shutter_all_a", false)

  a_records    = lookup(yamldecode(data.local_file.records.content), "A", [])
  a_shuttering = lookup(yamldecode(data.local_file.shutters.content), "A", [])

  a_configuration = local.a_records != null ? [
    for record in local.a_records : merge({
      name = record.name
      ttl  = record.ttl
      shutter = (local.shutter_all_a != true ?
        (local.a_shuttering != null ? lookup({ for shutter in local.a_shuttering : shutter.name => shutter }, record.name, { shutter = false }).shutter : false) : true
      )
      },
      try({ record = record.record }, {}),
      try({ shutter_resource_id = record.shutter_resource_id }, {}),
      try({ alias_target_resource_id = record.alias_target_resource_id }, {})
  )] : []

  shutter_all_cname = local.shutter_all == true ? true : lookup(yamldecode(data.local_file.shutters.content), "shutter_all_cname", false)

  cname_records    = yamldecode(data.local_file.records.content).cname
  cname_shuttering = lookup(yamldecode(data.local_file.shutters.content), "cname", [])

  cname_configuration = local.cname_records != null ? [
    for record in local.cname_records : {
      name   = record.name
      ttl    = record.ttl
      record = record.record
      shutter = (local.shutter_all_cname != true ?
        (local.cname_shuttering != null ? lookup({ for shutter in local.cname_shuttering : shutter.name => shutter }, record.name, { shutter = false }).shutter : false) : true
      )
    }
  ] : []
}

output "a_records" {
  value = local.a_configuration
}

output "cname_records" {
  value = local.cname_configuration
}

output "shutter_all_a" {
  value = local.shutter_all_a
}

output "shutter_all_cname" {
  value = local.shutter_all_cname
}
