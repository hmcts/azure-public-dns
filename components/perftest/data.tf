data "local_file" "configuration" {
  filename = "${path.cwd}/../../environments/perftest.yml"
}
