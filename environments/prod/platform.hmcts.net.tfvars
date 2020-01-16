recordsets = [
{ name = "@", records = ["ns1-04.azure-dns.com.",
"ns2-04.azure-dns.net.",
"ns3-04.azure-dns.org.",
"ns4-04.azure-dns.info.",], ttl = 172800, type = "NS" },
{ name = "@", records = [""], ttl = 3600, type = "CAA" },
{ name = "_9c4d3a31c7755933c820c13ece0caaca", records = ["5FB0CEFAAA0AA8102FDD0A6804FB846B.516553A1B23D93381A318F4E0A1B67C6.7fea1fb9e9b410a5a0c5.comodoca.com."], ttl = 900, type = "CNAME" },
{ name = "aat", records = ["ns1-03.azure-dns.com",
"ns2-03.azure-dns.net",
"ns3-03.azure-dns.org",
"ns4-03.azure-dns.info",], ttl = 900, type = "NS" },
{ name = "probate.aat", records = ["hmcts-probate-frontend-aat.trafficmanager.net"], ttl = 60, type = "CNAME" },
{ name = "awverify.probate.aat", records = ["awverify.probate-frontend-aat-shutter.azurewebsites.net"], ttl = 1, type = "CNAME" },
{ name = "administer-orgs", records = ["hmcts-xui-ao-webapp-prod.trafficmanager.net"], ttl = 60, type = "CNAME" },
{ name = "_32b104df3aace6a2d9e9ff6637a81c2f.administer-orgs", records = ["A55BDFDFA635B5D69F9770A7D344E4BF.E78E96400CB03D8CA3945CB7A0931989.d5e95a3c9f187c3d6835.comodoca.com."], ttl = 300, type = "CNAME" }
{ name = "apply-divorce", records = ["www.apply-divorce.platform.hmcts.net"], ttl = 3600, type = "CNAME" }
{ name = "tmwww.apply-divorce", records = ["divorce-palo-prod.platform.hmcts.net"], ttl = 60, type = "CNAME" }
{ name = "www.apply-divorce", records = ["www.apply-divorce.service.gov.uk"], ttl = 60, type = "CNAME" }
{ name = "apply-for-probate", records = ["hmcts-probate-frontend-prod.trafficmanager.net"], ttl = 60, type = "CNAME" }
{ name = "tmwww.apply-for-probate", records = ["05c4d7c6-49f9-42a5-bc31-20127cb4443d.cloudapp.net"], ttl = 60, type = "CNAME" }
{ name = "www.apply-for-probate", records = ["apply-for-probate.platform.hmcts.net."], ttl = 60, type = "CNAME" }
{ name = "bar", records = ["51.143.156.74"], ttl = 900, type = "A" }
{ name = "bar-aat", records = ["52.151.76.90"], ttl = 900, type = "A" }
{ name = "benefit-appeal", records = ["d9bb5705-1e1d-43d7-9a3d-8a7a97562873.cloudapp.net"], ttl = 60, type = "CNAME" }
{ name = "www.benefit-appeal", records = ["hmcts-sscs-tribunals-frontend-prod.trafficmanager.net"], ttl = 3600, type = "CNAME" }
{ name = "build", records = ["51.141.228.15"], ttl = 60, type = "A" }
{ name = "build-beta", records = ["51.145.50.201"], ttl = 60, type = "A" }
{ name = "build-failure-analyzer", records = ["51.141.230.224"], ttl = 60, type = "A" }
{ name = "bulkscan", records = ["0c825335-3be3-454d-af9a-ff6a54a9fbc2.cloudapp.net"], ttl = 60, type = "CNAME" }
{ name = "asverify.bulkscan", records = ["asverify.bulkscanprod.blob.core.windows.net"], ttl = 60, type = "CNAME" }
{ name = "ccd", records = ["hmcts-ccd-case-management-web-prod.trafficmanager.net"], ttl = 60, type = "CNAME" }
{ name = "gateway.ccd", records = ["hmcts-ccd-api-gateway-web-prod.trafficmanager.net"], ttl = 60, type = "CNAME" }
{ name = "tmgateway.ccd", records = ["5a052b01-331d-4789-9c63-8ccea30883da.cloudapp.net"], ttl = 60, type = "CNAME" }
{ name = "tmwww.ccd", records = ["5a052b01-331d-4789-9c63-8ccea30883da.cloudapp.net"], ttl = 60, type = "CNAME" }
{ name = "www.ccd", records = ["ccd.platform.hmcts.net"], ttl = 60, type = "CNAME" }
{ name = "courts", records = ["51.140.44.46"], ttl = 60, type = "A" }
{ name = "ctsc-web-forms-ui-stg", records = ["51.145.47.4"], ttl = 60, type = "A" }
{ name = "demo", records = ["ns1-02.azure-dns.com",
"ns2-02.azure-dns.net",
"ns3-02.azure-dns.org",
"ns4-02.azure-dns.info.",], ttl = 900, type = "NS" }
{ name = "apply-divorce.demo", records = ["315e3bca-08c2-4597-a4fb-1dd076eff917.cloudapp.net"], ttl = 600, type = "CNAME" }
{ name = "tmwww.apply-divorce.demo", records = ["315e3bca-08c2-4597-a4fb-1dd076eff917.cloudapp.net"], ttl = 3600, type = "CNAME" }
{ name = "www.apply-divorce.demo", records = ["315e3bca-08c2-4597-a4fb-1dd076eff917.cloudapp.net"], ttl = 60, type = "CNAME" }
{ name = "gateway.ccd.demo", records = ["hmcts-ccd-api-gateway-web-demo.trafficmanager.net"], ttl = 300, type = "CNAME" }
{ name = "tmgateway.ccd.demo", records = ["315e3bca-08c2-4597-a4fb-1dd076eff917.cloudapp.net"], ttl = 300, type = "CNAME" }
{ name = "www.ccd.demo", records = ["315e3bca-08c2-4597-a4fb-1dd076eff917.cloudapp.net"], ttl = 900, type = "CNAME" }
{ name = "_72b3a0f9ed774e1b8b760515c730bbe0.enquiry.demo", records = ["9A2B3A109D6D5C3A22AFD9F47225EEBA.F04D34FF5A0EF8DAF2774AC358E3E8FA.2d2c18c1aaeac9fcc028.comodoca.com."], ttl = 300, type = "CNAME" }
{ name = "hmcts-access.demo", records = ["bdd07956-53a1-46ed-a7b9-baf686c9bee1.cloudapp.net"], ttl = 900, type = "CNAME" }
{ name = "awverify.sscs.demo", records = ["awverify.sscs-tya-frontend-demo-shutter.azurewebsites.net"], ttl = 60, type = "CNAME" }
{ name = "divorce-palo-prod", records = ["52.151.74.140"], ttl = 60, type = "A" }
{ name = "_51d8b1c9dd4e64d34db2fbe4ee69a972.docmosis", records = ["C1DF7BB648B8C6A26E8BE421298A8110.E423F10778C699B9F67661AF08050428.91f5738a827405b0f0bd.comodoca.com."], ttl = 300, type = "CNAME" }
{ name = "_03e19b887aab622531c6eedb5e375d07.enquiry", records = ["8ACA4868E050A1C9D5621621EDC9E9F8.6AD45D4646F72722AF5602E076ED8A8F.10088cc50a44bc6d611a.comodoca.com."], ttl = 300, type = "CNAME" }
{ name = "fees-register", records = ["hmcts-fees-register-frontend-prod.trafficmanager.net"], ttl = 900, type = "CNAME" }
{ name = "tmwww.fees-register", records = ["58fd15f9-7a11-4de2-8df1-9aef0e807ec2.cloudapp.net"], ttl = 900, type = "CNAME" }
{ name = "www.fees-register", records = ["hmcts-fees-register-frontend-prod.trafficmanager.net"], ttl = 900, type = "CNAME" }
{ name = "gateway-ccd-ethosldata", records = ["hmcts-ccd-api-gateway-web-ethosldata.trafficmanager.net"], ttl = 60, type = "CNAME" }
{ name = "hmctsdemo", records = ["ns1-06.azure-dns.com.",
"ns2-06.azure-dns.net.",
"ns3-06.azure-dns.org.",
"ns4-06.azure-dns.info.",], ttl = 3600, type = "NS" }
{ name = "idam", records = ["hmcts-idam-web-public-idam-prod.trafficmanager.net"], ttl = 60, type = "CNAME" }
{ name = "www.idam", records = ["hmcts-idam-web-public-idam-prod.trafficmanager.net"], ttl = 60, type = "CNAME" }
{ name = "idam-api-ethosldata", records = ["10.14.66.11"], ttl = 60, type = "A" }
{ name = "idam-web-admin", records = ["hmcts-idam-web-admin-idam-prod.trafficmanager.net"], ttl = 60, type = "CNAME" }
{ name = "idam-web-public-ethosldata", records = ["hmcts-idam-web-public-idam-ethosldata.trafficmanager.net"], ttl = 60, type = "CNAME" }
{ name = "ithc", records = ["ns1-01.azure-dns.com",
"ns2-01.azure-dns.net",
"ns3-01.azure-dns.org",
"ns4-01.azure-dns.info",], ttl = 900, type = "NS" }
{ name = "_daa65891b4b28959dc2cba8b2137cfb3.ithc", records = ["DA0140C78CC21363E7612FB5B696B2F0.72669650AD22FEAC804FFF33F441B4A9.ed1dac006b5ef6170e64.comodoca.com."], ttl = 300, type = "CNAME" }
{ name = "jdbureau", records = ["51.11.44.158"], ttl = 60, type = "A" }
{ name = "jdbureau-nle", records = ["51.145.47.4"], ttl = 60, type = "A" }
{ name = "jdfrontend", records = ["51.104.252.236"], ttl = 60, type = "A" }
{ name = "jdfrontend-nle", records = ["51.145.47.4"], ttl = 60, type = "A" }
{ name = "jdproxy-nle", records = ["51.145.47.4"], ttl = 3600, type = "A" }
{ name = "jlfsrhi3m76w", records = ["gv-st2ccjwg4awsh2.dv.googlehosted.com"], ttl = 300, type = "CNAME" }
{ name = "maintenance-ccd", records = ["51.140.63.161"], ttl = 3600, type = "A" }
{ name = "manage-case", records = ["hmcts-xui-webapp-prod.trafficmanager.net"], ttl = 300, type = "CNAME" }
{ name = "_5ecfb849dc48eea11d818fd219b68bb1.manage-case", records = ["2CA16B148A8386A15DD52D1B6FF6ED42.A81C8A2EA633B271718353B91541677A.de3c1a733c9c51de130b.comodoca.com."], ttl = 300, type = "CNAME" }
{ name = "manage-org", records = ["hmcts-xui-mo-webapp-prod.trafficmanager.net"], ttl = 60, type = "CNAME" }
{ name = "_227c728ce7ed54743e78fb8f4843fcd5.manage-org", records = ["ADD9E7046E11AB4A157C185A2CDD1458.919EB75126175B997DCAA66BE4A0E9EC.e52c9599ea82e0087458.comodoca.com."], ttl = 300, type = "CNAME" }
{ name = "manage-payments", records = ["hmcts-bar-web-prod.trafficmanager.net"], ttl = 900, type = "CNAME" }
{ name = "tmwww.manage-payments", records = ["58fd15f9-7a11-4de2-8df1-9aef0e807ec2.cloudapp.net"], ttl = 900, type = "CNAME" }
{ name = "www.manage-payments", records = ["hmcts-bar-web-prod.trafficmanager.net"], ttl = 900, type = "CNAME" }
{ name = "mobilevpn", records = ["51.145.22.57"], ttl = 60, type = "A" }
{ name = "mobilevpn-mgmt", records = ["51.145.22.150"], ttl = 3600, type = "A" }
{ name = "www.nonprod.moneyclaim", records = ["51.140.33.54"], ttl = 3600, type = "A" }
{ name = "www.moneyclaim", records = ["moneyclaim.reform.hmcts.net"], ttl = 300, type = "CNAME" }
{ name = "tmwww.moneyclaim-legal", records = ["2a2a11d5-16a8-48c3-955a-2712ccc85d1e.cloudapp.net"], ttl = 300, type = "CNAME" }
{ name = "www.moneyclaim-legal", records = ["hmcts-cmc-legal-frontend-prod.trafficmanager.net"], ttl = 300, type = "CNAME" }
{ name = "moneyclaim-legal-maint", records = ["51.143.153.124"], ttl = 60, type = "A" }
{ name = "moneyclaim-maint", records = ["51.145.44.112"], ttl = 60, type = "A" }
{ name = "divorce.nonprod", records = ["mojmaintenance.azurewebsites.net"], ttl = 3600, type = "CNAME" }
{ name = "maintenance.nonprod", records = ["mojmaintenance.azurewebsites.net"], ttl = 3600, type = "CNAME" }
{ name = "moneyclaim-legal.nonprod", records = ["mojmaintenance.azurewebsites.net"], ttl = 300, type = "CNAME" }
{ name = "maintenance.moneyclaim-legal.nonprod", records = ["mojmaintenance.azurewebsites.net"], ttl = 3600, type = "CNAME" }
{ name = "tmdivorce.nonprod", records = ["7f3cb82c-0944-4944-b8fd-0d736315b202.cloudapp.net"], ttl = 900, type = "CNAME" }
{ name = "tmmoneyclaim.nonprod", records = ["7f3cb82c-0944-4944-b8fd-0d736315b202.cloudapp.net"], ttl = 3600, type = "CNAME" }
{ name = "tmmoneyclaim-legal.nonprod", records = ["7f3cb82c-0944-4944-b8fd-0d736315b202.cloudapp.net"], ttl = 3600, type = "CNAME" }
{ name = "track-appeal.nonprod", records = ["51.140.157.202"], ttl = 60, type = "A" }
{ name = "paybubble", records = ["www.paybubble.platform.hmcts.net"], ttl = 300, type = "CNAME" }
{ name = "_274fa105e35a1c6271534224dcfcc482.paybubble", records = ["9F30B8FF955609E7056D651B27162A6F.71EA2C4A41C2C63882CABF5E5CB7649E.8cb94e7a9661ea20b129.comodoca.com."], ttl = 300, type = "CNAME" }
{ name = "www.paybubble", records = ["hmcts-ccpay-bubble-frontend-prod.trafficmanager.net"], ttl = 300, type = "CNAME" }
{ name = "_274fa105e35a1c6271534224dcfcc482.www.paybubble", records = ["9F30B8FF955609E7056D651B27162A6F.71EA2C4A41C2C63882CABF5E5CB7649E.8cb94e7a9661ea20b129.comodoca.com."], ttl = 300, type = "CNAME" }
{ name = "_c3b5fe13b4756db80168bc42e0db38eb.perftest", records = ["28AC2C3343F82103E5B6E3CE2E408F9A.3A56404AB020AE88C3FCCACBED8F7066.9f2998dcc45d58baf6f7.comodoca.com."], ttl = 300, type = "CNAME" }
{ name = "portal", records = ["51.145.4.100"], ttl = 60, type = "A" }
{ name = "portal-temp", records = ["40.120.41.232"], ttl = 60, type = "A" }
{ name = "preview", records = ["ns1-06.azure-dns.com",
"ns2-06.azure-dns.net",
"ns3-06.azure-dns.org",
"ns4-06.azure-dns.info",], ttl = 900, type = "NS" }
{ name = "probate", records = ["6a9d29fa-e848-4bc7-b62b-31f7e3979eda.cloudapp.net"], ttl = 60, type = "CNAME" }
{ name = "asverify.probate", records = ["asverify.probateprod.blob.core.windows.net"], ttl = 60, type = "CNAME" }
{ name = "awverify.probate", records = ["awverify.probate-frontend-prod-shutter.azurewebsites.net"], ttl = 1, type = "CNAME" }
{ name = "prod", records = ["ns1-05.azure-dns.com",
"ns2-05.azure-dns.net",
"ns3-05.azure-dns.org",
"ns4-05.azure-dns.info",], ttl = 3600, type = "NS" }
{ name = "register-org", records = ["hmcts-xui-mo-webapp-prod.trafficmanager.net"], ttl = 60, type = "CNAME" }
{ name = "_c2c531954464a2c755d6a6dd2c487d88.register-org", records = ["F6DE5E30E7052660D9019668EA45C85F.C9519747E6B82801DCE298E005B0D8AE.db4b852fceaa5260e33e.comodoca.com."], ttl = 300, type = "CNAME" }
{ name = "_92ffb1be77f85c0ee399f4ac827f2fe2.www.registration", records = ["4F322C641E1B2C63C893DAFAC1ADB44F.05D83D4E12FDA00572A7750ED4111315.5ba0eda06642d.comodoca.com"], ttl = 300, type = "CNAME" }
{ name = "saat", records = ["ns1-03.azure-dns.com",
"ns2-03.azure-dns.net",
"ns3-03.azure-dns.org",
"ns4-03.azure-dns.info",], ttl = 900, type = "NS" }
{ name = "probate.saat", records = ["probate-frontend-0f57-saat.azurewebsites.net"], ttl = 60, type = "CNAME" }
{ name = "awverify.probate.saat", records = ["awverify.probate-frontend-0f57-saat.azurewebsites.net"], ttl = 60, type = "CNAME" }
{ name = "sandbox", records = ["ns1-05.azure-dns.com",
"ns2-08.azure-dns.net",
"ns3-08.azure-dns.org",
"ns4-08.azure-dns.info",], ttl = 900, type = "NS" }
{ name = "sandbox-build", records = ["51.140.32.178"], ttl = 60, type = "A" }
{ name = "sandbox-build-beta", records = ["40.120.54.64"], ttl = 60, type = "A" }
{ name = "sandbox-build-failure-analyzer", records = ["52.151.93.193"], ttl = 60, type = "A" }
{ name = "sftp", records = ["51.132.40.106"], ttl = 300, type = "A" }
{ name = "_fe952d2ae36602de857ba2c3e66d049f.sharedservices", records = ["3D4173ADC0AA3CD47318DC2295E46A17.BC942C46B4C23BD4BB4C58E14F3B218B.a5537a7ededd2ffe4de4.comodoca.com."], ttl = 300, type = "CNAME" }
{ name = "_3b5e9d1a9a79a5e31335db08218959ea.snl", records = ["A7B189C7C4F1A978D3A38A0B82D1C130.19259BC1E2806E3CDEDB77E0346DCCA2.5be957abaab99.comodoca.com"], ttl = 60, type = "CNAME" }
{ name = "_3b5e9d1a9a79a5e31335db08218959ea.snl-api", records = ["A7B189C7C4F1A978D3A38A0B82D1C130.19259BC1E2806E3CDEDB77E0346DCCA2.5be957abaab99.comodoca.com"], ttl = 60, type = "CNAME" }
{ name = "_3b5e9d1a9a79a5e31335db08218959ea.snl-notes", records = ["A7B189C7C4F1A978D3A38A0B82D1C130.19259BC1E2806E3CDEDB77E0346DCCA2.5be957abaab99.comodoca.com"], ttl = 60, type = "CNAME" }
{ name = "_3b5e9d1a9a79a5e31335db08218959ea.snl1", records = ["A7B189C7C4F1A978D3A38A0B82D1C130.19259BC1E2806E3CDEDB77E0346DCCA2.5be957abaab99.comodoca.com"], ttl = 60, type = "CNAME" }
{ name = "_3b5e9d1a9a79a5e31335db08218959ea.snl1-api", records = ["A7B189C7C4F1A978D3A38A0B82D1C130.19259BC1E2806E3CDEDB77E0346DCCA2.5be957abaab99.comodoca.com"], ttl = 60, type = "CNAME" }
{ name = "_3b5e9d1a9a79a5e31335db08218959ea.snl1-notes", records = ["A7B189C7C4F1A978D3A38A0B82D1C130.19259BC1E2806E3CDEDB77E0346DCCA2.5be957abaab99.comodoca.com"], ttl = 60, type = "CNAME" }
{ name = "_3b5e9d1a9a79a5e31335db08218959ea.snl2", records = ["A7B189C7C4F1A978D3A38A0B82D1C130.19259BC1E2806E3CDEDB77E0346DCCA2.5be957abaab99.comodoca.com"], ttl = 60, type = "CNAME" }
{ name = "_3b5e9d1a9a79a5e31335db08218959ea.snl2-api", records = ["A7B189C7C4F1A978D3A38A0B82D1C130.19259BC1E2806E3CDEDB77E0346DCCA2.5be957abaab99.comodoca.com"], ttl = 60, type = "CNAME" }
{ name = "_3b5e9d1a9a79a5e31335db08218959ea.snl2-notes", records = ["A7B189C7C4F1A978D3A38A0B82D1C130.19259BC1E2806E3CDEDB77E0346DCCA2.5be957abaab99.comodoca.com"], ttl = 60, type = "CNAME" }
{ name = "_3b5e9d1a9a79a5e31335db08218959ea.snl3", records = ["A7B189C7C4F1A978D3A38A0B82D1C130.19259BC1E2806E3CDEDB77E0346DCCA2.5be957abaab99.comodoca.com"], ttl = 60, type = "CNAME" }
{ name = "_3b5e9d1a9a79a5e31335db08218959ea.snl3-api", records = ["A7B189C7C4F1A978D3A38A0B82D1C130.19259BC1E2806E3CDEDB77E0346DCCA2.5be957abaab99.comodoca.com"], ttl = 60, type = "CNAME" }
{ name = "_3b5e9d1a9a79a5e31335db08218959ea.snl3-notes", records = ["A7B189C7C4F1A978D3A38A0B82D1C130.19259BC1E2806E3CDEDB77E0346DCCA2.5be957abaab99.comodoca.com"], ttl = 60, type = "CNAME" }
{ name = "sod-ss", records = ["51.132.42.55"], ttl = 60, type = "A" }
{ name = "spreview", records = ["ns1-08.azure-dns.com",
"ns2-08.azure-dns.net",
"ns3-08.azure-dns.org",
"ns4-08.azure-dns.info",], ttl = 54000, type = "NS" }
{ name = "sprod", records = ["ns1-01.azure-dns.com",
"ns2-01.azure-dns.net",
"ns3-01.azure-dns.org",
"ns4-01.azure-dns.info",], ttl = 900, type = "NS" }
{ name = "tmadminister-orgs", records = ["3ea55565-0202-4fa4-a74b-e9b0bccdefd5.cloudapp.net"], ttl = 60, type = "CNAME" }
{ name = "tmbenefit-appeal", records = ["58fd15f9-7a11-4de2-8df1-9aef0e807ec2.cloudapp.net"], ttl = 3600, type = "CNAME" }
{ name = "tmgateway-ccd-ethosldata", records = ["b1e5bfab-d489-40f8-b559-5b30d02f1b48.cloudapp.net"], ttl = 60, type = "CNAME" }
{ name = "tmidam-web-admin", records = ["7436ed5c-c64c-4053-9c36-6d8ee8702a6d.cloudapp.net"], ttl = 60, type = "CNAME" }
{ name = "tmidam-web-public", records = ["7436ed5c-c64c-4053-9c36-6d8ee8702a6d.cloudapp.net"], ttl = 60, type = "CNAME" }
{ name = "tmidam-web-public-ethosldata", records = ["500f1820-ccf8-4799-9d15-900c58827d70.cloudapp.net"], ttl = 60, type = "CNAME" }
{ name = "tmmanage-case", records = ["3ea55565-0202-4fa4-a74b-e9b0bccdefd5.cloudapp.net"], ttl = 300, type = "CNAME" }
{ name = "tmmanage-org", records = ["3ea55565-0202-4fa4-a74b-e9b0bccdefd5.cloudapp.net"], ttl = 300, type = "CNAME" }
{ name = "tmpaybubble", records = ["3563cbf6-3619-4245-9ff8-bd4ffc8bd57f.cloudapp.net"], ttl = 300, type = "CNAME" }
{ name = "tmtrack-appeal", records = ["58fd15f9-7a11-4de2-8df1-9aef0e807ec2.cloudapp.net"], ttl = 3600, type = "CNAME" }
{ name = "tmwww-ccd-ethosldata", records = ["b1e5bfab-d489-40f8-b559-5b30d02f1b48.cloudapp.net"], ttl = 60, type = "CNAME" }
{ name = "track-appeal", records = ["hmcts-sscs-tya-frontend-prod.trafficmanager.net"], ttl = 3600, type = "CNAME" }
{ name = "www.track-appeal", records = ["hmcts-sscs-tya-frontend-prod.trafficmanager.net"], ttl = 900, type = "CNAME" }
{ name = "traefik-sod-ss", records = ["51.132.42.55"], ttl = 60, type = "A" }
{ name = "traefik-stg", records = ["51.145.47.4"], ttl = 60, type = "A" }
{ name = "traefik-ui-jb", records = ["51.11.44.158"], ttl = 60, type = "A" }
{ name = "traefik-ui-jd", records = ["51.104.252.236"], ttl = 60, type = "A" }
{ name = "vpn", records = ["51.141.230.130"], ttl = 60, type = "A" }
{ name = "www-ccd-ethosldata", records = ["hmcts-ccd-case-management-web-ethosldata.trafficmanager.net"], ttl = 60, type = "CNAME" }
]
