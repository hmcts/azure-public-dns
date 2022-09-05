variable "resource_group_name" {
  type        = string
  description = "The name of the resource group that contains the DNS zone where the records will be added."
  default     = "reformmgmtrg"
}

variable "env" {
  type        = string
}

variable "product" {
  type        = string
}

variable "builtFrom" {
  type        = string
}
