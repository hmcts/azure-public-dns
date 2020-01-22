data "local_file" "apply-divorce-config" {
  filename = "${path.cwd}/../../environments/prod/apply-divorce-service-gov-uk.yml"
}

data "local_file" "apply-for-probate-config" {
  filename = "${path.cwd}/../../environments/prod/apply-for-probate-service-gov-uk.yml"
}
