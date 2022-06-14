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
#************************************
# VNET Vars
#************************************
vnet_name          = "vnet-dev"
vnet_address_space = ["10.2.0.0/16"]
subnets_vnet = {
  snet-dev = {
    address_prefix = "10.2.0.0/19"
  }
  snet-psql-dev = {
    address_prefix = "10.2.34.0/23"
    delegation = {
      name = "psql"
      service_delegation = {
        name = "Microsoft.DBforPostgreSQL/flexibleServers"
        actions = [
          "Microsoft.Network/virtualNetworks/subnets/join/action",
        ]
      }
    }
  }
}


