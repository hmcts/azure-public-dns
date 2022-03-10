data "local_file" "immigrationappealsonline-config" {
  filename = "${path.cwd}/../../environments/prod/immigrationappealsonline-justice-gov-uk.yml"
}

module "immigrationappealsonline" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.immigrationappealsonline-config.content).cname
  a_recordsets        = yamldecode(data.local_file.immigrationappealsonline-config.content).A
  zone_name           = "immigrationappealsonline.justice.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
