data "local_file" "manage-your-support-for-hmcts-services-config" {
  filename = "${path.cwd}/../../environments/prod/manage-your-support-for-hmcts-services-service-gov-uk.yml"
}

module "manage-your-support-for-hmcts-services" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.manage-your-support-for-hmcts-services-config.content).cname
  zone_name           = "manage-your-support-for-hmcts-services.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
