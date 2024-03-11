data "local_file" "frontdoor-sbox-hmcts-config" {
  filename = "${path.cwd}/../../environments/sandbox/frontdoor-sbox-hmcts.yml"
}

data "local_file" "shuttering" {
  filename = "${path.cwd}/../../shuttering/sandbox/frontdoor-sbox-hmcts.yml"
}

locals {
    frontdoor_sbox_hmcts_a_records = yamldecode(data.local_file.configuration.content).a
    frontdoor_sbox_hmcts_a_shuttering = yamldecode(data.local_file.shuttering.content).a
    
    // Merge a record values with shutter values, if global shutter is true then ignore shutter file and set all to value of local.global_shutter(true)
    frontdoor_sbox_hmcts_a_config = [for t1 in local.frontdoor_sbox_hmcts_a_records :
        merge(
            t1, 
            (local.global_shutter != true ? lookup({ for t in local.frontdoor_sbox_hmcts_a_shuttering : t.name => t }, t1.name, {}): {shutter: local.global_shutter})
        )
    ]

    frontdoor_sbox_hmcts_cname_records = yamldecode(data.local_file.configuration.content).cname
    frontdoor_sbox_hmcts_cname_shuttering = yamldecode(data.local_file.shuttering.content).cname
    
    // Merge cname record values with shutter values, if global shutter is true then ignore shutter file and set all to value of local.global_shutter(true)
    frontdoor_sbox_hmcts_cname_config = [for t1 in local.frontdoor_sbox_hmcts_cname_records :
        merge(
            t1, 
            (local.global_shutter != true ? lookup({ for t in local.frontdoor_sbox_hmcts_cname_shuttering : t.name => t }, t1.name, {}): {shutter: local.global_shutter})
        )
    ]
}

module "prod-internal" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = local.frontdoor_sbox_hmcts_cname_config
  a_recordsets        = local.frontdoor_sbox_hmcts_a_config
  ns_recordsets       = yamldecode(data.local_file.frontdoor-sbox-hmcts-config.content).ns
  zone_name           = "frontdoor.sandbox.platform.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "sbox"
}
