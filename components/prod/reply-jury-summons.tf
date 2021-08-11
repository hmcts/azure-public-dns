
data "local_file" "reply-jury-summons-config" {
  filename = "${path.cwd}/../../environments/prod/reply-jury-summons-service-gov-uk.yml"
}

module "reply-jury-summons" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.reply-jury-summons-config.content).cname
  zone_name           = "reply-jury-summons.service.gov.uk"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
