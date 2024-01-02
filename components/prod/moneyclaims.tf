data "local_file" "moneyclaims-config" {
  filename = "${path.cwd}/../../environments/prod/moneyclaims-service-gov-uk.yml"
}

module "moneyclaims" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.moneyclaims-config.content).cname
  txt_recordsets      = yamldecode(data.local_file.moneyclaims-config.content).txt
  a_recordsets        = yamldecode(data.local_file.moneyclaims-config.content).A
  zone_name           = "moneyclaims.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
