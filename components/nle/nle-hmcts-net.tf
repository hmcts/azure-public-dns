data "local_file" "nle-hmcts-net" {
  filename = "${path.cwd}/../../environments/nle/nle-hmcts-net.yml"
}

module "nle-hmcts-net" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.nle-hmcts-net.content).cname
  txt_recordsets      = yamldecode(data.local_file.nle-hmcts-net.content).txt
  a_recordsets        = yamldecode(data.local_file.nle-hmcts-net.content).A
  zone_name           = "nle.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "stg"
}
