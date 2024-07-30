##  Casetracker
data "local_file" "dev-casetracker-config" {
  filename = "${path.cwd}/../../environments/dev/dev-casetracker.yml"
}

module "casetracker" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "dev"
  dns_config          = data.local_file.dev-casetracker-config.content
}

##  Certificated Bailiffs
data "local_file" "dev-certificatedbailiffs-config" {
  filename = "${path.cwd}/../../environments/dev/dev-certificatedbailiffs.yml"
}

module "certificatedbailiffs" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "dev"
  dns_config          = data.local_file.dev-certificatedbailiffs-config.content
}

## Court Fines
data "local_file" "dev-courtfines-config" {
  filename = "${path.cwd}/../../environments/dev/dev-courtfines.yml"
}

module "courtfines" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "dev"
  dns_config          = data.local_file.dev-courtfines-config.content
}

## Immigration Appeals Online
data "local_file" "dev-immigrationappealsonline-config" {
  filename = "${path.cwd}/../../environments/dev/dev-immigrationappealsonline.yml"
}

module "immigrationappealsonline" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "dev"
  dns_config          = data.local_file.dev-immigrationappealsonline-config.content
}
