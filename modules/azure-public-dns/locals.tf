data "local_file" "shutter_by_platform" {
  filename = "${path.cwd}/../../shuttering/prod/shutter_by_platform.yml"
}

locals {
  // Extract global shutter value if available or false
  shutter_all = lookup(yamldecode(var.shutter_config), "shutter_all", false)

  shutter_all_cft = lookup(yamldecode(data.local_file.shutter_by_platform.content), "shutter_all_cft", false)
  shutter_all_sds = lookup(yamldecode(data.local_file.shutter_by_platform.content), "shutter_all_sds", false)
}
