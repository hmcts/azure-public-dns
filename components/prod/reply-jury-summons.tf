
data "local_file" "reply-jury-summons-config" {
  filename = "${path.cwd}/../../environments/prod/reply-jury-summons-service-gov-uk.yml"
}


data "local_file" "reply_jury_summons_shutter_config" {
  filename = "${path.cwd}/../../shuttering/prod/reply-jury-summons-service-gov-uk.yml"
}

module "reply-jury-summons" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
  dns_config          = data.local_file.reply-jury-summons-config.content
  shutter_config      = data.local_file.reply_jury_summons_shutter_config.content
}
