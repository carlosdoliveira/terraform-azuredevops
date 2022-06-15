#------------------------------------
# RG Vars
#------------------------------------
rg_name     = "rg-yt-001"
rg_location = "eastus2"

#------------------------------------
# DNS Vars
#------------------------------------

dns_settings = {
  "cloudsquad.com" = {
    dns_records = [
      {
        name   = "protheus"
        type   = "A"
        ttl    = 3600
        record = ["178.52.183.100"]
      },
      {
        name   = "@"
        type   = "A"
        ttl    = 300
        record = ["112.123.2.31"]
      },
      {
        name   = "files"
        type   = "CNAME"
        ttl    = 3600
        record = "file.core.windows.net"
      },
      {
        name   = "demo"
        type   = "TXT"
        ttl    = 300
        record = ["Code FC Show Demais"]
      }
    ]
  }
}

tags = {
  projeto = "youtube"
  env     = "dev"
}
