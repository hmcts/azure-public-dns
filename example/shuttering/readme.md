# Local shuttering example

This is a simple recreation of this Terraform repository that shows how shuttering is implemented.

This can be used locally with an installation of Terraform, no providers, backends or credentials are required.

This shows how the DNS records and the shuttering configuration for those records are matched and then merged to create a single list within the module.

For example, take the following A record and A shutter configuration:

```yaml
A:
  - name: "abc"
    ttl: 3600
    record:
      - "1.2.3.4"
```

```yaml
A:
  - name: "abc"
    shutter: false
```

The files containing these are both referenced by Terraform and then we use a number of built in Terraform functions to merge the configuration:
In the following code we use a for loop to loop over the A records and then merge with the matching A shutter config. The match is done on the `name` field:

```terraform
a_configuration = local.a_records != null ? [for record in local.a_records :
    merge(
        record,
        (local.shutter_all_a != true ? lookup({ for shutter in local.a_shuttering : shutter.name => shutter }, record.name, {}) : { shutter: local.shutter_all_a })
    )
] : []
```

The resulting configuration is:

```terraform
[
    {
        name: "abc"
        ttl: 3600
        record:
            - "1.2.3.4"
        shutter: false
    }
]
```

There are also additional options to shutter all records which overrides the individual configuration per records:

```yaml
shutter_all: false
shutter_all_a: false
shutter_all_cname: false
shutter_all_cft: false
shutter_all_sds: false
```

`shutter_all: false` is the most powerful of these options, it overrides all other shutter settings to match the value set in this option.

`shutter_all_a: false` is specific to A record types and will override individual record shutter settings, has no effect on CNAME records

`shutter_all_cname: false` is specific to CNAME record types and will override individual record shutter settings, has no effect on A records

`shutter_all_cft: false` can be used to shutter any zone or record (A and CNAME only) where `# area: "cft"` is set.

`shutter_all_sds: false` can be used to shutter any zone or record (A and CNAME only) where `area: "sds"` is set.

When false these values are ignored, when true they automatically set all or specific record types, depending on the setting used, to: `{ shutter: true }`.

## Running locally

To run this example code locally, make sure you have changed directory in your terminal into this `example/shuttering` directory.
You should have Terraform installed locally and be at least v1.4.

You can now run:

```bash
terraform init
terraform plan
```

The code has no resources to build, it simply does the formatting of the input files as described above and outputs the results.
You can now use this to change values, add/remove records and shutter config etc to get an understanding of how this works with the real world DNS records of this repository.
