data "local_file" "claim-et-sya-config" {
  filename = "${path.cwd}/../../environments/prod/claim-et-sya-hmcts-net.yml"
}

module "claim-employment-tribunals" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.claim-et-sya-config.content).cname
  #a_recordsets        = yamldecode(data.local_file.claim-et-sya-config.content).A
  zone_name           = "claim-employment-tribunals.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
