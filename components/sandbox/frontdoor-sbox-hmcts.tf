data "local_file" "frontdoor-sbox-hmcts-config" {
  filename = "${path.cwd}/../../environments/sandbox/frontdoor-sbox-hmcts.yml"
}

data "local_file" "frontdoor-sbox-hmcts-shutter-config" {
  filename = "${path.cwd}/../../shuttering/sandbox/frontdoor-sbox-hmcts.yml"
}

module "prod-internal" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.frontdoor-sbox-hmcts-config.content).cname
  a_recordsets        = yamldecode(data.local_file.frontdoor-sbox-hmcts-config.content).a
  ns_recordsets       = yamldecode(data.local_file.frontdoor-sbox-hmcts-config.content).ns
  zone_name           = "frontdoor.sandbox.platform.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "sbox"
  shutter_config      = data.local_file.frontdoor-sbox-hmcts-shutter-config.content

}
