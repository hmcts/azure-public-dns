data "local_file" "childarrangement-familyinjunction-config" {
  filename = "${path.cwd}/../../environments/prod/childarrangement-familyinjunction-service-gov-uk.yml"
}

module "childarrangement-familyinjunction" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.childarrangement-familyinjunction-config.content).cname
  ns_recordsets       = yamldecode(data.local_file.childarrangement-familyinjunction-config.content).ns
  a_recordsets        = yamldecode(data.local_file.childarrangement-familyinjunction-config.content).A
  txt_recordsets      = yamldecode(data.local_file.childarrangement-familyinjunction-config.content).txt
  mx_recordsets       = yamldecode(data.local_file.childarrangement-familyinjunction-config.content).mx
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
