data "local_file" "internal-hmcts-config" {
  filename = "${path.cwd}/../../environments/prod/internal-hmcts-net.yml"
}

module "internal-hmcts" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.internal-hmcts-config.content).cname
  a_recordsets        = yamldecode(data.local_file.internal-hmcts-config.content).A
  ns_recordsets       = yamldecode(data.local_file.internal-hmcts-config.content).ns
  zone_name           = "internal.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}