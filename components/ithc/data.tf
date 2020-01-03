data "local_file" "configuration" {
  filename = "${path.cwd}/../../environments/ithc.yml"
}
