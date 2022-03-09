data "local_file" "staging-config" {
  filename = "${path.cwd}/../../environments/staging/justice-gov-uk.yml"
}

module "casetracker" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.staging-config.content).cname
  a_recordsets        = yamldecode(data.local_file.staging-config.content).A
  zone_name           = "staging-casetracker.justice.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "stg"
}

module "certificatedbailiffs" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.staging-config.content).cname
  a_recordsets        = yamldecode(data.local_file.staging-config.content).A
  zone_name           = "staging-certificatedbailiffs.justice.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "stg"
}

module "courtfines" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.staging-config.content).cname
  a_recordsets        = yamldecode(data.local_file.staging-config.content).A
  zone_name           = "staging-courtfines.justice.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "stg"
}

module "immigrationappealsonline" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.staging-config.content).cname
  a_recordsets        = yamldecode(data.local_file.staging-config.content).A
  zone_name           = "staging-immigrationappealsonline.justice.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "stg"
}

module "tribunalsdecisions" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.staging-config.content).cname
  a_recordsets        = yamldecode(data.local_file.staging-config.content).A
  zone_name           = "staging-tribunalsdecisions.justice.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "stg"
}
