data "local_file" "prod-hmcts-net" {
  filename = "${path.cwd}/../../environments/prod/prod-hmcts-net.yml"
}

module "prod-hmcts-net" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.prod-hmcts-net.content).cname
  txt_recordsets      = yamldecode(data.local_file.prod-hmcts-net.content).txt
  a_recordsets        = yamldecode(data.local_file.prod-hmcts-net.content).A
  zone_name           = "prod.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
