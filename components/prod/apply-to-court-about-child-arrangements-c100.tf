data "local_file" "apply-to-court-about-child-arrangements-c100-config" {
  filename = "${path.cwd}/../../environments/prod/apply-to-court-about-child-arrangements-c100-service-gov-uk.yml"
}

module "apply-to-court-about-child-arrangements-c100" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.apply-to-court-about-child-arrangements-c100-config.content).cname
  ns_recordsets       = yamldecode(data.local_file.apply-to-court-about-child-arrangements-c100-config.content).ns
  a_recordsets        = yamldecode(data.local_file.apply-to-court-about-child-arrangements-c100-config.content).A
  txt_recordsets      = yamldecode(data.local_file.apply-to-court-about-child-arrangements-c100-config.content).txt
  mx_recordsets       = yamldecode(data.local_file.apply-to-court-about-child-arrangements-c100-config.content).mx
  zone_name           = "apply-to-court-about-child-arrangements-c100.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
