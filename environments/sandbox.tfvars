recordsets = [
  { name = "@", records = ["ns1-05.azure-dns.com.",
    "ns2-05.azure-dns.net.",
    "ns3-05.azure-dns.org.",
  "ns4-05.azure-dns.info.", ], ttl = 172800, type = "NS" },
  { name = "@", records = ["0 mail.contact.justice.sandbox.platform.hmcts.net"], ttl = 300, type = "MX" },
  { name = "_1fc88e03b87b33fb04a3b1c5978e80b8", records = ["3FED4C626334D6135F1258241ADBBF36.F6728027F74DAF3E336958B894F24534.ma5er55rQa0HPM55O5Fq.comodoca.com"], ttl = 900, type = "CNAME" },
  { name = "bulkscan", records = ["bulkscansandbox.blob.core.windows.net"], ttl = 60, type = "CNAME" },
  { name = "asverify.bulkscan", records = ["asverify.bulkscansandbox.blob.core.windows.net"], ttl = 60, type = "CNAME" },
  { name = "ctscmail", records = ["51.140.180.140"], ttl = 3600, type = "A" },
  { name = "contact.justice", records = ["10 ctscmail.sandbox.platform.hmcts.net"], ttl = 3600, type = "MX" },
  { name = "contact.justice", records = ["v=spf1 ip4:51.105.21.172  ip4:51.105.21.118 -all"], ttl = 3600, type = "TXT" },
  { name = "_dmarc.contact.justice", records = ["v=DMARC1; p=none"], ttl = 3600, type = "TXT" },
  { name = "plum", records = ["hmtcs-plum-shutter.azureedge.net"], ttl = 300, type = "CNAME" },
  { name = "afdverify.plum", records = ["afdverify.hmcts-sbox.azurefd.net"], ttl = 3600, type = "CNAME" },
  { name = "plum.uksouth", records = ["firewall-sbox.uksouth.cloudapp.azure.com"], ttl = 3600, type = "CNAME" }
]
