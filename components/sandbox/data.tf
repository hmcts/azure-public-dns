data "local_file" "configuration" {
  filename = "${path.cwd}/../../environments/sandbox.yml"
}

data "local_file" "shutterconfig" {
  filename = "${path.cwd}/../../shutter/shutter-apps-sbox.yml"
}