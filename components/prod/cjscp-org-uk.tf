data "local_file" "cjscp_org_uk_config" {
  filename = "${path.cwd}/../../environments/prod/cjscp-org-uk.yml"
}

data "local_file" "cjscp_org_uk_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/cjscp-org-uk.yml"
}

module "cjscp_org_uk" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.cjscp_org_uk_config.content
  shutter_config      = data.local_file.cjscp_org_uk_shutter_config.content
}
