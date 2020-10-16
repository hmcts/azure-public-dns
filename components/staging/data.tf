data "local_file" "configuration" {
  filename = "${path.cwd}/../../environments/staging/aat.yml"
}
