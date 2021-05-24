data "local_file" "demo-platform-configuration" {
  filename = "${path.cwd}/../../environments/demo/demo-platform-hmcts-net.yml"
}

module "demo-platform" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.demo-platform-configuration.content).cname
  zone_name           = "demo.platform.hmcts.net"
  resource_group_name = var.resource_group_name
  env                 = var.env
  a_recordsets        = yamldecode(data.local_file.demo-platform-configuration.content).A
  mx_recordsets       = yamldecode(data.local_file.demo-platform-configuration.content).mx
  ns_recordsets       = yamldecode(data.local_file.demo-platform-configuration.content).ns
  srv_recordsets      = yamldecode(data.local_file.demo-platform-configuration.content).srv
  txt_recordsets      = yamldecode(data.local_file.demo-platform-configuration.content).txt
}
