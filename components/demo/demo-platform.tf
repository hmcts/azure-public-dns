data "local_file" "demo-platform-configuration" {
  filename = "${path.cwd}/../../environments/demo/demo-platform-hmcts-net.yml"
}

module "demo-platform" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.demo-platform-configuration.content).cname
  zone_name           = yamldecode(data.local_file.demo-platform-configuration.content).name
  resource_group_name = var.resource_group_name
  env                 = var.env
}