data "local_file" "dev-config" {
  filename = "${path.cwd}/../../environments/dev/justice-gov-uk.yml"
}

module "casetracker" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.dev-config.content).cname
  a_recordsets        = yamldecode(data.local_file.dev-config.content).A
  zone_name           = "dev-casetracker.justice.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "dev"
}

module "certificatedbailiffs" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.dev-config.content).cname
  a_recordsets        = yamldecode(data.local_file.dev-config.content).A
  zone_name           = "dev-certificatedbailiffs.justice.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "dev"
}

module "courtfines" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.dev-config.content).cname
  a_recordsets        = yamldecode(data.local_file.dev-config.content).A
  zone_name           = "dev-courtfines.justice.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "dev"
}

module "immigrationappealsonline" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.dev-config.content).cname
  a_recordsets        = yamldecode(data.local_file.dev-config.content).A
  zone_name           = "dev-immigrationappealsonline.justice.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "dev"
}

module "tribunalsdecisions" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.dev-config.content).cname
  a_recordsets        = yamldecode(data.local_file.dev-config.content).A
  zone_name           = "dev-tribunalsdecisions.justice.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "dev"
}
