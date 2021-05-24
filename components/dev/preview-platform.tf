data "local_file" "preview" {
  filename = "${path.cwd}/../../environments/dev/preview.yml"
}

module "public-dns" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.preview.content).cname
  zone_name           = "preview.platform.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "preview"
  a_recordsets        = yamldecode(data.local_file.preview.content).A
  mx_recordsets       = yamldecode(data.local_file.preview.content).mx
  ns_recordsets       = yamldecode(data.local_file.preview.content).ns
  srv_recordsets      = yamldecode(data.local_file.preview.content).srv
  txt_recordsets      = yamldecode(data.local_file.preview.content).txt
}
