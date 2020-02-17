variable "resource_group_name" {
  type        = string
  description = "The name of the resource group that contains the DNS zone where the records will be added."
}

variable "zone_name" {
  description = "List of DNS zones to manage, in the standard terraformdns structure."
}

variable "cname_records" {
  default = []
}
variable "ns_recordsets" {
  default = []
}
variable "mx_recordsets" {
  default = []
}
variable "a_recordsets" {
  default = []
}
variable "txt_recordsets" {
  default = []
}
variable "srv_recordsets" {
  default = []
}
variable "env" {}