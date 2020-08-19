module "glb-ctsc-hmcts" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.glb-ctsc-hmcts-net-config.content).cname
  a_recordsets        = yamldecode(data.local_file.glb-ctsc-hmcts-net-config.content).A
  zone_name           = azurerm_dns_zone.glb-ctsc-hmcts.name
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}