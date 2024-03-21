locals {
  // Extract global shutter value if available or false
  shutter_all = lookup(yamldecode(var.shutter_config), "shutter_all", false)
}