data "local_file" "demo-api-hmcts-config" {
  filename = "${path.cwd}/../../environments/demo/demo-api-hmcts-net.yml"
}

module "demo-api-hmcts" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = var.resource_group_name
  env                 = var.env
  dns_config          = data.local_file.demo-api-hmcts-config.content
}
