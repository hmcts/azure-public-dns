data "local_file" "demo-platform-configuration" {
  filename = "${path.cwd}/../../environments/demo/demo-platform-hmcts-net.yml"
}

module "demo-platform" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = var.resource_group_name
  env                 = var.env
  dns_config          = data.local_file.demo-platform-configuration.content
}

