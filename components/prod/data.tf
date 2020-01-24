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