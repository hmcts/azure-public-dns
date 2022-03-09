data "local_file" "tribunalsdecisions-config" {
  filename = "${path.cwd}/../../environments/prod/tribunalsdecisions-justice-gov-uk.yml"
}

module "tribunalsdecisions" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.tribunalsdecisions-config.content).cname
  a_recordsets        = yamldecode(data.local_file.tribunalsdecisions-config.content).A
  zone_name           = "tribunalsdecisions.justice.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
