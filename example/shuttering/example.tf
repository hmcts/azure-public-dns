data "local_file" "records" {
    filename = "${path.cwd}/records.yml"
}
data "local_file" "shutters" {
    filename = "${path.cwd}/shutters.yml"
}

locals {
    shutter_all_a = lookup(yamldecode(data.local_file.shutters.content), "shutter_all_a", false)

    a_records = lookup(yamldecode(data.local_file.records.content), "A", [])
    a_shuttering = lookup(yamldecode(data.local_file.shutters.content), "A", [])

    // Merge a record values with shutter values, if global shutter is true then ignore shutter file and set all to value of local.global_shutter(true)
    a_configuration = local.a_records != null ? [for record in local.a_records :
        merge(
            record, 
            (local.shutter_all_a != true ? (local.a_shuttering != null ? lookup({ for shutter in local.a_shuttering : shutter.name => shutter }, record.name, {}) : {}) : { shutter: local.shutter_all_a })
        )
    ] : []

    shutter_all_cname = lookup(yamldecode(data.local_file.shutters.content), "shutter_all_cname", false)

    cname_records = yamldecode(data.local_file.records.content).cname
    cname_shuttering = lookup(yamldecode(data.local_file.shutters.content), "cname", [])
    
    // Merge cname record values with shutter values, if global shutter is true then ignore shutter file and set all to value of local.global_shutter(true)
    cname_configuration = local.cname_records != null ? [for record in local.cname_records :
        merge(
            record, 
            (local.shutter_all_cname != true ? (local.cname_shuttering != null ? lookup({ for shutter in local.cname_shuttering : shutter.name => shutter }, record.name, {}) : {}) : { shutter: local.shutter_all_cname })
        )
    ]: []
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
