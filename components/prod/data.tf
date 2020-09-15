data "local_file" "apply-divorce-config" {
  filename = "${path.cwd}/../../environments/prod/apply-divorce-service-gov-uk.yml"
}

data "local_file" "apply-for-probate-config" {
  filename = "${path.cwd}/../../environments/prod/apply-for-probate-service-gov-uk.yml"
}

data "local_file" "appeal-benefit-config" {
  filename = "${path.cwd}/../../environments/prod/appeal-benefit-decision-service-gov-uk.yml"
}

data "local_file" "hmcts-access-config" {
  filename = "${path.cwd}/../../environments/prod/hmcts-access-service-gov-uk.yml"
}

data "local_file" "track-benefit-appeal-config" {
  filename = "${path.cwd}/../../environments/prod/track-benefit-appeal-service-gov-uk.yml"
}

data "local_file" "respond-divorce-config" {
  filename = "${path.cwd}/../../environments/prod/respond-divorce-service-gov-uk.yml"
}

data "local_file" "prod-platform-config" {
  filename = "${path.cwd}/../../environments/prod/prod-platform-hmcts-net.yml"
}

data "local_file" "moneyclaims-config" {
  filename = "${path.cwd}/../../environments/prod/moneyclaims-service-gov-uk.yml"
}

data "local_file" "platform-hmcts-config" {
  filename = "${path.cwd}/../../environments/prod/platform-hmcts-net.yml"
}

data "local_file" "hearings-config" {
  filename = "${path.cwd}/../../environments/prod/hearings-hmcts-net.yml"
}

data "local_file" "reform-hmcts-config" {
  filename = "${path.cwd}/../../environments/prod/reform-hmcts-net.yml"
}

data "local_file" "jcm-judiciary-config" {
  filename = "${path.cwd}/../../environments/prod/jcm-judiciary-uk.yml"
}

data "local_file" "ctsc-hmcts-config" {
  filename = "${path.cwd}/../../environments/prod/ctsc-hmcts-net.yml"
}