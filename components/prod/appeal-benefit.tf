data "local_file" "appeal-benefit-config" {
  filename = "${path.cwd}/../../environments/prod/appeal-benefit-decision-service-gov-uk.yml"
}

module "appeal-benefit" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.appeal-benefit-config.content).cname
  zone_name           = "appeal-benefit-decision.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
