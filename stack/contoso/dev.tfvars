#************************************
# RG Vars
#************************************
rg_name     = "rg-mvp-devops-dev"
rg_location = "eastus2"
#************************************
# DNS Vars
#************************************
dns_settings = {
  "cloudsquad.com" = {
    dns_records = [
      {
        name   = "protheus"
        type   = "A"
        ttl    = 3600
        record = ["177.52.183.104"]
      },
      {
        name   = "@"
        type   = "A"
        ttl    = 300
        record = ["182.123.2.31"]
      },
      {
        name   = "files"
        type   = "CNAME"
        ttl    = 3600
        record = "files.blob.azure.com"
      }
    ]
  }
}
