# Azure DNS Zone Recordsets Module

This module creates/updates DNS zone and recordsets in a given zone.

## Example Usage

`../../components/mgmt.main.tf`

```hcl
module "public-dns" {
  source = "hmcts/azure-platform-terraform/modules/azure-public-dns"
  project            = var.project
}
```

`azure-platform-terraform/azure-public-dns/dns-zones.auto.tfvars`

```hcl
  zones = [
    "test.example.com"
  ]
```

`azure-platform-terraform/azure-public-dns/dns-zones.auto.tfvars`


```hcl
  recordsets = [
    {
      name    = "www"
      type    = "A"
      ttl     = 3600
      records = [
        "192.0.2.56",
      ]
    },
    {
      name    = ""
      type    = "MX"
      ttl     = 3600
      records = [
        "1 mail1",
        "5 mail2",
        "5 mail3",
      ]
    },
    {
      name    = "_sip._tcp"
      type    = "SRV"
      ttl     = 3600
      records = [
        "10 60 5060 sip1",
        "10 20 5060 sip2",
        "10 20 5060 sip3",
        "20 0 5060 sip4",
      ]
    }
  ]
```

## Terraform Plan Example

In the `azure-public-dns/components/<environment-name>` directory:

```shell
terraform plan -var-file='../../environemtnts/<environment-name>.tfvars
```

For example:
In the the `azure-public-dns/components/sbox` directory:

```shell
terraform plan -var-file='../../environemtnts/sbox.tfvars
```

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

## Syncing cnames to private dns zones

We have got sync in place where if there are CNAMES which does not exist on any of the corresponding private DNS zone, we will sync it overnight using sync-zones-pipeline.yml.

Please note that if you are creating new dns zone and if that dns zone also exist on the private dns, in order for sync to work, you will have to manually update on `sync-zones-pipeline.yml` file.

## Shuttering

Please see [shuttering](./example/shuttering/readme.md) for an example of how shuttering works and an example project that you can use locally to get an understand of how to shutter services using this repository.

### Shuttering by platform

In order for a record to be shuttered using the `shutter_all_cft` and `shutter_all_sds` options, it will need to be tagged with the appropriate platform. You can see an example of this [here](./example/shuttering/records.yml)

There is also guidance available [here](https://hmcts.github.io/cloud-native-platform/path-to-live/shutter.html)
