
data "local_file" "juror-bureau-config" {
  filename = "${path.cwd}/../../environments/prod/juror-bureau-justice-gov-uk.yml"
}

module "juror-bureau" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.juror-bureau-config.content).cname
  a_recordsets        = yamldecode(data.local_file.juror-bureau-config.content).A
  zone_name           = "juror-bureau.justice.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
