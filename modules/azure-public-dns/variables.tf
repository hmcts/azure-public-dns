variable "resource_group_name" {
  type        = string
  description = "The name of the resource group that contains the DNS zone where the records will be added."
}

# variable "zone_name" {
#   description = "List of DNS zones to manage, in the standard terraformdns structure."
# }

# variable "cname_records" {
#   default = []
# }
# variable "ns_recordsets" {
#   default = []
# }
# variable "mx_recordsets" {
#   default = []
# }
# variable "a_recordsets" {
#   default = []
# }
# variable "txt_recordsets" {
#   default = []
# }
# variable "srv_recordsets" {
#   default = []
# }

variable "dns_config" {
  description = <<EOF
    (Required) A YAML formatted file or content that contains the following information:
    - DNS Zone Name
    - A records
    - CNAME records
    - NS records
    - MX records
    - TXT records
    - SRV records

    The file does not need to have a record for each type but must contain a blank entry for that record type e.g.
      A: []
      CNAME: []

    The only required field that MUST have a value is `zone_name`
  EOF
}

variable "shutter_config" {
  description = <<EOF
    (Optional) A tuple containing name and shutter configuration to apply to DNS records (A and CNAME only). Missing/Unmatched records will default to false in the module code.
    This variable is parsed by yamldecode so yaml formatted document must be supplied.
    Example
    A: or cname:
      - (Required) name - Name that matches the record name supplied to `cname_records` or `a_recordsets`. This is the `name` not the `record` value.
        (Required) shutter - Boolean to enable shuttering defaults to false within the module code

  EOF

  default = "{ A: [], cname: []}"
}
variable "env" {}
