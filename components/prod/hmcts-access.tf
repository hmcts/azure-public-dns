data "local_file" "hmcts-access-config" {
  filename = "${path.cwd}/../../environments/prod/hmcts-access-service-gov-uk.yml"
}

module "hmcts-access" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.hmcts-access-config.content).cname
  a_recordsets        = yamldecode(data.local_file.hmcts-access-config.content).A
  zone_name           = "hmcts-access.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
