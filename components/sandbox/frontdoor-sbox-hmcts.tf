data "local_file" "frontdoor-sbox-hmcts-config" {
  filename = "${path.cwd}/../../environments/sandbox/frontdoor-sbox-hmcts.yml"
}

module "prod-internal" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.frontdoor-sbox-hmcts-config.content).cname
  a_recordsets        = yamldecode(data.local_file.frontdoor-sbox-hmcts-config.content).A
  ns_recordsets       = yamldecode(data.local_file.frontdoor-sbox-hmcts-config.content).ns
  zone_name           = "frontdoor.sandbox.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
