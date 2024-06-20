data "local_file" "shutter_all_cft" {
  filename = "${path.cwd}/../../shuttering/prod/shutter_all_cft.yml"
}

data "local_file" "shutter_all_sds" {
  filename = "${path.cwd}/../../shuttering/prod/shutter_all_sds.yml"
}

locals {
  // Extract global shutter value if available or false
  shutter_all = lookup(yamldecode(var.shutter_config), "shutter_all", false)

  shutter_all_cft = lookup(yamldecode(data.local_file.shutter_all_cft.content), "shutter_all_cft", false)
  shutter_all_sds = lookup(yamldecode(data.local_file.shutter_all_sds.content), "shutter_all_sds", false)
}
