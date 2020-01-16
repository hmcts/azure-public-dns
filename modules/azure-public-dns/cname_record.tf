resource "azurerm_dns_cname_record" "this" {
  count = length(var.cname_records)

  resource_group_name = lower(var.resource_group_name)
  zone_name           = var.zone_name

  name   = var.cname_records[count.index].name
  ttl    = var.cname_records[count.index].ttl
  record = var.cname_records[count.index].record
}

resource "null_resource" "enable_shutter" {
  count = length(var.shutter_records)

  provisioner "local-exec" {
    command = <<EOF
az network dns record-set cname set-record \
  --cname "hmcts-${split(".", replace(var.shutter_records[count.index], "www.", ""))[0]}-shutter-${var.env}.azureedge.net"
  --record-set-name "${replace(replace(var.shutter_records[count.index], var.zone_name, ""), ".", "")}" \
  --resource-group "${lower(var.resource_group_name)}" \
  --zone-name "${var.zone_name}"
EOF
  }
  depends_on = [azurerm_dns_cname_record.this]
}