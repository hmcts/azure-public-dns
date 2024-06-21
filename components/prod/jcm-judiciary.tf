data "local_file" "jcm-judiciary-config" {
  filename = "${path.cwd}/../../environments/prod/jcm-judiciary-uk.yml"
}

data "local_file" "jcm_judiciary_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/jcm-judiciary-uk.yml"
}

module "jcm-judiciary" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.jcm-judiciary-config.content).cname
  a_recordsets        = yamldecode(data.local_file.jcm-judiciary-config.content).A
  zone_name           = "jcm.judiciary.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  shutter_config      = data.local_file.jcm_judiciary_shutter_config.content
  zone_platform       = lookup(yamldecode(data.local_file.jcm-judiciary-config.content), "platform", null)
}
