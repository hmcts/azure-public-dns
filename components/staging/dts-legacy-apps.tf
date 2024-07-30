## staging-casetracker-justice-gov-uk
data "local_file" "staging-casetracker-config" {
  filename = "${path.cwd}/../../environments/staging/staging-casetracker-justice-gov-uk.yml"
}

module "casetracker" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "stg"
  dns_config          = data.local_file.staging-casetracker-config.content

}

## staging-certificatedbailiffs-justice-gov-uk
data "local_file" "staging-certificatedbailiffs-config" {
  filename = "${path.cwd}/../../environments/staging/staging-certificatedbailiffs-justice-gov-uk.yml"
}

module "certificatedbailiffs" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "stg"
  dns_config          = data.local_file.staging-certificatedbailiffs-config.content
}

## staging-courtfines-direct-gov-uk
data "local_file" "staging-courtfines-config" {
  filename = "${path.cwd}/../../environments/staging/staging-courtfines-direct-gov-uk.yml"
}

module "courtfines" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "stg"
  dns_config          = data.local_file.staging-courtfines-config.content
}

## staging-immigrationappealsonline-justice-gov-uk
data "local_file" "staging-immigrationappealsonline-config" {
  filename = "${path.cwd}/../../environments/staging/staging-immigrationappealsonline-justice-gov-uk.yml"
}

module "immigrationappealsonline" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "stg"
  dns_config          = data.local_file.staging-immigrationappealsonline-config.content
}

## staging-tribunalsdecisions-service-gov-uk
data "local_file" "staging-tribunalsdecisions-config" {
  filename = "${path.cwd}/../../environments/staging/staging-tribunalsdecisions-service-gov-uk.yml"
}

module "tribunalsdecisions" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "stg"
  dns_config          = data.local_file.staging-tribunalsdecisions-config.content
}
