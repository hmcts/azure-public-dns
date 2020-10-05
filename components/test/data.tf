data "local_file" "configuration" {
  filename = "${path.cwd}/../../environments/test.yml"
}
