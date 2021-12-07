dns_settings = {
  "mvpconf-prd.com" = {
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
      }
    ]
  }
  "cloudsquad-prd.com" = {
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
      }
    ]
  }
}
rg_location           = "westeurope"
rg_name               = "rg-mvp-devops-prd"
subnets_vnet = {
  snet-prd = {
    address_prefix = "10.2.0.0/19"
  }
  snet-psql-prd = {
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
vnet_address_space = ["10.2.0.0/16"]
vnet_name          = "vnet-prd"
