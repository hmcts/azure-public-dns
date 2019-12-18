# Azure DNS Zone Recordsets Module

This module creates/updates DNS zone and recordsets in a given zone.

## Example Usage

`../../components/sandbox/azure-public-dns.main.tf`
```hcl
module "public-dns" {
  source              = "../../modules/azure-public-dns/"
  zone_name           = azurerm_dns_zone.zone.name
  recordsets          = var.recordsets
  resource_group_name = data.azurerm_resource_group.main.name
}
```

`azure-platform-terraform/azure-public-dns/dns-zones.auto.tfvars`
```hcl
  zones = [
    "test.example.com"
  ]
```

`/azure-public-dns/environments/sandbox.tfvars`
```hcl
  recordsets = [
    { name = "www", type = "A", ttl = 3600, records = ["192.0.2.56"] },
    { name = "", type = "MX", ttL = 3600, records = ["1 mail1", "5 mail2", "5 mail3"] },
    { name  = "_sip._tcp", type = "SRV", ttl = 3600, records = ["10 60 5060 sip1", "10 20 5060 sip2", "10 20 5060 sip3", "20 0 5060 sip4"] }
  ]
```

## Terraform Plan Example
[In the azure-public-dns/components/<environment-name> directory]
$ terraform plan -var-file='../../environemtnts/<environment-name>.tfvars

For example:
[In the the azure-public-dns/components/sandbox directory]
../azure-public-dns/components/sandbox$  terraform plan -var-file='../../environemtnts/sandbox.tfvars

## Arguments
- `resource_group_name` is the name of the resource group that contains the
  DNS zone where the records will be added.
- `dns_zone_name` is the name of the DNS zone within the given resource group
  where the records will be added.

This module requires the `azurerm` provider.

Due to current limitations of the Terraform language, recordsets in Azure DNS
are correlated to `recordsets` elements using the index into the `recordsets`
list. Adding or removing records from the list will therefore cause this
module to also update all records with indices greater than where the
addition or removal was made.

## Limitations

This module supports only the following DNS record types, due to limitations
of the underlying Terraform provider:

- `A`
- `AAAA`
- `CNAME`
- `MX`
- `NS`
- `PTR`
- `SRV`
- `TXT`
