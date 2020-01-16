data "local_file" "configuration-1" {
  filename = "${path.cwd}/../../environments/prod/appeal-benefit-decision.service.gov.uk.tfvars"
}

data "local_file" "configuration-2" {
  filename = "${path.cwd}/../../environments/prod/apply-divorce.service.gov.uk.tfvars"
}

data "local_file" "configuration-3" {
  filename = "${path.cwd}/../../environments/prod/apply-for-probate.service.gov.uk.tfvars"
}

data "local_file" "configuration-4" {
  filename = "${path.cwd}/../../environments/prod/divorce.service.gov.uk.tfvars"
}

data "local_file" "configuration-5" {
  filename = "${path.cwd}/../../environments/prod/hearings.hmcts.net.tfvars"
}

data "local_file" "configuration-6" {
  filename = "${path.cwd}/../../environments/prod/hmcts-access.service.gov.uk.tfvars"
}

data "local_file" "configuration-7" {
  filename = "${path.cwd}/../../environments/prod/jcm.judiciary.uk.tfvars"
}

data "local_file" "configuration-8" {
  filename = "${path.cwd}/../../environments/prod/moneyclaims.service.gov.uk.tfvars"
}

data "local_file" "configuration-9" {
  filename = "${path.cwd}/../../environments/prod/platform.hmcts.net.tfvars"
}

data "local_file" "configuration-10" {
  filename = "${path.cwd}/../../environments/prod/prod.platform.hmcts.net.tfvars"
}

data "local_file" "configuration-11" {
  filename = "${path.cwd}/../../environments/prod/reform.hmcts.net.tfvars"
}

data "local_file" "configuration-12" {
  filename = "${path.cwd}/../../environments/prod/respond-divorce.service.gov.uk.tfvars"
}

data "local_file" "configuration-13" {
  filename = "${path.cwd}/../../environments/prod/tmapply-divorce.service.gov.uk.tfvars"
}

data "local_file" "configuration-14" {
  filename = "${path.cwd}/../../environments/prod/tmjcm.judiciary.uk.tfvars"
}

data "local_file" "configuration-15" {
  filename = "${path.cwd}/../../environments/prod/tmrespond-divorce.service.gov.uk.tfvars"
}

data "local_file" "configuration-16" {
  filename = "${path.cwd}/../../environments/prod/track-benefit-appeal.service.gov.uk.tfvar"
}