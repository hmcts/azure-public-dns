data "local_file" "configuration" {
  filename = "${path.cwd}/../../environments/aat.yml"
}
