data "local_file" "demo-apps-hmcts-net-config" {
  filename = "${path.cwd}/../../environments/demo/demo-apps-hmcts-net.yml"
}

module "demo-apps-public-dns" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = var.resource_group_name
  env                 = var.env
  dns_config          = data.local_file.demo-apps-hmcts-net-config.content
}
