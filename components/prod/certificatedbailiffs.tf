data "local_file" "certificatedbailiffs-config" {
  filename = "${path.cwd}/../../environments/prod/certificatedbailiffs-justice-gov-uk.yml"
}

module "certificatedbailiffs" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.certificatedbailiffs-config.content).cname
  a_recordsets        = yamldecode(data.local_file.certificatedbailiffs-config.content).A
  zone_name           = "certificatedbailiffs.justice.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
