# Azure Public DNS

This repository contains the Terraform code/module, DNS configuration files and shutter configuration files for the Azure Public DNS zones on HMCTS.

The repository is responsible for creating the zone and each record type within that zone.

The repository covers multiple environments and is deployed via [Azure DevOps](https://dev.azure.com/hmcts/PlatformOperations/_build?definitionId=278&_a=summary)

## Terraform Module

This repository contains a module designed to carry out all the creation necessary for the DNS zone:

- Creates the zone
- Creates records of each type within the zone
- Updates the records based on shutter config as/when required

### Limitations

This module supports only the following DNS record types:

- A
- CNAME
- MX
- NS
- SRV
- TXT

## Example Usage

### `components/demo/demo-platform.tf`

```terraform
data "local_file" "demo-platform-configuration" {
  filename = "${path.cwd}/../../environments/demo/demo-platform-hmcts-net.yml"
}

data "local_file" "demo-platform-configuration-shutter" {
  filename = "${path.cwd}/../../shuttering/demo/demo-platform-hmcts-net.yml"
}

module "demo-platform" {
  source              = "../../modules/azure-public-dns/"
  resource_group_name = var.resource_group_name
  env                 = var.env
  dns_config          = data.local_file.demo-platform-configuration.content
  shutter_config          = data.local_file.demo-platform-configuration-shutter.content
}
```

You can see in the example above that we supply the DNS and Shutter config directly to the module as content by using `data` `local_file` resource types. These look for the file listed and ingest the content which we then provide to the module as a raw input.

The module then handles the rest of the work to decode the yaml in the file and pull out any information necessary such as `zone_name` or `cname`/`A` record types (more record types can be used these are just examples).

This is an example of a `local` within the module that captures the `A` record types from the raw input of the DNS config:

```terraform
a_recordsets     = lookup(yamldecode(var.dns_config), "A")
```

and another for the `zone name`:

```terraform
zone_name = lookup(yamldecode(var.dns_config), "zone_name")
```

You can see that there is no default applied to the lookup (lookups can have a default if no value is found), this is by design to ensure that the config file contains all the necessary inputs and is a simple way of validating that is the case.

### `environments/demo/demo-platform-hmcts-net.yml`

```yaml
zone_name: "demo.platform.hmcts.net"

ns: []

mx: []

txt: []

srv: []

A:
  - name: example-record-name
    ttl: 300
    record:
      - 1.2.3.4

cname:
  - name: "cnamerecord"
    ttl: 60
    record: "example-record-name"
```

In the example above you can see the format of the DNS config file, this contains all the relevant information for a given zone.

If a zone has no records of a particular type we supply a blank list input `[]` and the module knows to do nothing with this, for those with record types it will create each of them as described in the config.

## Syncing CNAMEs to private dns zones

A synchronisation script/pipeline is in place that checks if there are CNAMES which do not exist on any of the corresponding private DNS zones, if not they are created by the script.

The script [sync-to-private-dns-zone.sh](scripts/sync-to-private-dns-zone.sh) is run via a pipeline in [ADO](https://dev.azure.com/hmcts/PlatformOperations/_build?definitionId=961) and runs nightly.

Please note that if you are creating new DNS zone and if that DNS zone also exist on the private dns, in order for sync to work, you will have to manually update the `sync-zones-pipeline.yml` file to include the zone name and file containing the config.

Example:

```yaml
zones: '"[{\"dnsname\": \"sandbox.platform.hmcts.net\", \"filename\": \"environments/sandbox.yml\"}]"'
```

## Shuttering

Please see [shuttering](./example/shuttering/readme.md) for an example of how shuttering works and an example project that you can use locally to get an understand of how to shutter services using this repository.

### Shuttering by platform

In order for a record to be shuttered using the `shutter_all_cft` and `shutter_all_sds` options, it will need to be tagged with the appropriate platform. You can see an example of this [here](./example/shuttering/records.yml)

There is also guidance available [here](https://hmcts.github.io/cloud-native-platform/path-to-live/shutter.html)
