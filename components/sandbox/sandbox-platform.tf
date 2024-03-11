data "local_file" "configuration" {
  filename = "${path.cwd}/../../environments/sandbox.yml"
}

data "local_file" "shuttering" {
  filename = "${path.cwd}/../../shuttering/sandbox/sandbox.yml"
}

locals {
    sandbox_a_records = yamldecode(data.local_file.configuration.content).a
    sandbox_a_shuttering = yamldecode(data.local_file.shuttering.content).a
    
    // Merge a record values with shutter values, if global shutter is true then ignore shutter file and set all to value of local.global_shutter(true)
    sandbox_a_configuration = [for t1 in local.sandbox_a_records :
        merge(
            t1, 
            (local.global_shutter != true ? lookup({ for t in local.sandbox_a_shuttering : t.name => t }, t1.name, {}): {shutter: local.global_shutter})
        )
    ]

    sandbox_cname_records = yamldecode(data.local_file.configuration.content).cname
    sandbox_cname_shuttering = yamldecode(data.local_file.shuttering.content).cname
    
    // Merge cname record values with shutter values, if global shutter is true then ignore shutter file and set all to value of local.global_shutter(true)
    sandbox_cname_configuration = [for t1 in local.sandbox_cname_records :
        merge(
            t1, 
            (local.global_shutter != true ? lookup({ for t in local.sandbox_cname_shuttering : t.name => t }, t1.name, {}): {shutter: local.global_shutter})
        )
    ]
}


module "public-dns" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = local.sandbox_cname_configuration
  mx_recordsets       = yamldecode(data.local_file.configuration.content).mx
  a_recordsets        = local.sandbox_a_configuration
  txt_recordsets      = yamldecode(data.local_file.configuration.content).txt
  zone_name           = "sandbox.platform.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "sbox"
  ns_recordsets       = yamldecode(data.local_file.configuration.content).ns
  srv_recordsets      = yamldecode(data.local_file.configuration.content).srv
}
