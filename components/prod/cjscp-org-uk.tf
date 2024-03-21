data "local_file" "cjscp_org_uk_config" {
  filename = "${path.cwd}/../../environments/prod/cjscp-org-uk.yml"
}

data "local_file" "cjscp_org_uk_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/cjscp-org-uk.yml"
}

module "cjscp_org_uk" {
  source              = "../../modules/azure-public-dns/"
  a_recordsets        = yamldecode(data.local_file.cjscp_org_uk_config.content).A
  cname_records       = yamldecode(data.local_file.cjscp_org_uk_config.content).cname
  mx_recordsets       = yamldecode(data.local_file.cjscp_org_uk_config.content).mx
  ns_recordsets       = yamldecode(data.local_file.cjscp_org_uk_config.content).ns
  txt_recordsets      = yamldecode(data.local_file.cjscp_org_uk_config.content).txt
  srv_recordsets      = yamldecode(data.local_file.cjscp_org_uk_config.content).srv
  zone_name           = "cjscp.org.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  shutter_config      = data.local_file.cjscp_org_uk_shutter_config.content
}
