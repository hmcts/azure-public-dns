data "local_file" "configuration" {
  filename = "${path.cwd}/../../environments/sandbox.yml"
}
