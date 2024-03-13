data "local_file" "tribunalsdecisions-config" {
  filename = "${path.cwd}/../../environments/prod/tribunalsdecisions-service-gov-uk.yml"
}

data "local_file" "tribunalsdecisions_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/tribunalsdecisions-service-gov-uk.yml"
}

module "tribunalsdecisions" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.tribunalsdecisions-config.content).cname
  a_recordsets        = yamldecode(data.local_file.tribunalsdecisions-config.content).A
  zone_name           = "tribunalsdecisions.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  shutter_config      = data.local_file.tribunalsdecisions_shutter_config.content
}
