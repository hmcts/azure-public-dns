module "public-dns-1" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.configuration.content).cname
  ns_recordsets       = yamldecode(data.local_file.configuration.content).ns
  mx_recordsets       = yamldecode(data.local_file.configuration.content).mx
  a_recordsets        = yamldecode(data.local_file.configuration.content).A
  txt_recordsets      = yamldecode(data.local_file.configuration.content).txt
  zone_name           = zone1
  resource_group_name = data.azurerm_resource_group.main.name
}

module "public-dns-2" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.configuration.content).cname
  ns_recordsets       = yamldecode(data.local_file.configuration.content).ns
  mx_recordsets       = yamldecode(data.local_file.configuration.content).mx
  a_recordsets        = yamldecode(data.local_file.configuration.content).A
  txt_recordsets      = yamldecode(data.local_file.configuration.content).txt
  zone_name           = zone2
  resource_group_name = data.azurerm_resource_group.main.name
}

module "public-dns-3" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.configuration.content).cname
  ns_recordsets       = yamldecode(data.local_file.configuration.content).ns
  mx_recordsets       = yamldecode(data.local_file.configuration.content).mx
  a_recordsets        = yamldecode(data.local_file.configuration.content).A
  txt_recordsets      = yamldecode(data.local_file.configuration.content).txt
  zone_name           = zone3
  resource_group_name = data.azurerm_resource_group.main.name
}

module "public-dns-4" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.configuration.content).cname
  ns_recordsets       = yamldecode(data.local_file.configuration.content).ns
  mx_recordsets       = yamldecode(data.local_file.configuration.content).mx
  a_recordsets        = yamldecode(data.local_file.configuration.content).A
  txt_recordsets      = yamldecode(data.local_file.configuration.content).txt
  zone_name           = zone4
  resource_group_name = data.azurerm_resource_group.main.name
}

module "public-dns-5" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.configuration.content).cname
  ns_recordsets       = yamldecode(data.local_file.configuration.content).ns
  mx_recordsets       = yamldecode(data.local_file.configuration.content).mx
  a_recordsets        = yamldecode(data.local_file.configuration.content).A
  txt_recordsets      = yamldecode(data.local_file.configuration.content).txt
  zone_name           = zone5
  resource_group_name = data.azurerm_resource_group.main.name
}

module "public-dns-6" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.configuration.content).cname
  ns_recordsets       = yamldecode(data.local_file.configuration.content).ns
  mx_recordsets       = yamldecode(data.local_file.configuration.content).mx
  a_recordsets        = yamldecode(data.local_file.configuration.content).A
  txt_recordsets      = yamldecode(data.local_file.configuration.content).txt
  zone_name           = zone6
  resource_group_name = data.azurerm_resource_group.main.name
}

module "public-dns-7" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.configuration.content).cname
  ns_recordsets       = yamldecode(data.local_file.configuration.content).ns
  mx_recordsets       = yamldecode(data.local_file.configuration.content).mx
  a_recordsets        = yamldecode(data.local_file.configuration.content).A
  txt_recordsets      = yamldecode(data.local_file.configuration.content).txt
  zone_name           = zone7
  resource_group_name = data.azurerm_resource_group.main.name
}

module "public-dns-8" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.configuration.content).cname
  ns_recordsets       = yamldecode(data.local_file.configuration.content).ns
  mx_recordsets       = yamldecode(data.local_file.configuration.content).mx
  a_recordsets        = yamldecode(data.local_file.configuration.content).A
  txt_recordsets      = yamldecode(data.local_file.configuration.content).txt
  zone_name           = zone8
  resource_group_name = data.azurerm_resource_group.main.name
}

module "public-dns-9" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.configuration.content).cname
  ns_recordsets       = yamldecode(data.local_file.configuration.content).ns
  mx_recordsets       = yamldecode(data.local_file.configuration.content).mx
  a_recordsets        = yamldecode(data.local_file.configuration.content).A
  txt_recordsets      = yamldecode(data.local_file.configuration.content).txt
  zone_name           = zone9
  resource_group_name = data.azurerm_resource_group.main.name
}

module "public-dns-10" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.configuration.content).cname
  ns_recordsets       = yamldecode(data.local_file.configuration.content).ns
  mx_recordsets       = yamldecode(data.local_file.configuration.content).mx
  a_recordsets        = yamldecode(data.local_file.configuration.content).A
  txt_recordsets      = yamldecode(data.local_file.configuration.content).txt
  zone_name           = zone10
  resource_group_name = data.azurerm_resource_group.main.name
}

module "public-dns-11" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.configuration.content).cname
  ns_recordsets       = yamldecode(data.local_file.configuration.content).ns
  mx_recordsets       = yamldecode(data.local_file.configuration.content).mx
  a_recordsets        = yamldecode(data.local_file.configuration.content).A
  txt_recordsets      = yamldecode(data.local_file.configuration.content).txt
  zone_name           = zone11
  resource_group_name = data.azurerm_resource_group.main.name
}

module "public-dns-12" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.configuration.content).cname
  ns_recordsets       = yamldecode(data.local_file.configuration.content).ns
  mx_recordsets       = yamldecode(data.local_file.configuration.content).mx
  a_recordsets        = yamldecode(data.local_file.configuration.content).A
  txt_recordsets      = yamldecode(data.local_file.configuration.content).txt
  zone_name           = zone12
  resource_group_name = data.azurerm_resource_group.main.name
}

module "public-dns-13" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.configuration.content).cname
  ns_recordsets       = yamldecode(data.local_file.configuration.content).ns
  mx_recordsets       = yamldecode(data.local_file.configuration.content).mx
  a_recordsets        = yamldecode(data.local_file.configuration.content).A
  txt_recordsets      = yamldecode(data.local_file.configuration.content).txt
  zone_name           = zone13
  resource_group_name = data.azurerm_resource_group.main.name
}

module "public-dns-14" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.configuration.content).cname
  ns_recordsets       = yamldecode(data.local_file.configuration.content).ns
  mx_recordsets       = yamldecode(data.local_file.configuration.content).mx
  a_recordsets        = yamldecode(data.local_file.configuration.content).A
  txt_recordsets      = yamldecode(data.local_file.configuration.content).txt
  zone_name           = zone14
  resource_group_name = data.azurerm_resource_group.main.name
}

module "public-dns-15" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.configuration.content).cname
  ns_recordsets       = yamldecode(data.local_file.configuration.content).ns
  mx_recordsets       = yamldecode(data.local_file.configuration.content).mx
  a_recordsets        = yamldecode(data.local_file.configuration.content).A
  txt_recordsets      = yamldecode(data.local_file.configuration.content).txt
  zone_name           = zone15
  resource_group_name = data.azurerm_resource_group.main.name
}

module "public-dns-16" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.configuration.content).cname
  ns_recordsets       = yamldecode(data.local_file.configuration.content).ns
  mx_recordsets       = yamldecode(data.local_file.configuration.content).mx
  a_recordsets        = yamldecode(data.local_file.configuration.content).A
  txt_recordsets      = yamldecode(data.local_file.configuration.content).txt
  zone_name           = zone16
  resource_group_name = data.azurerm_resource_group.main.name
}