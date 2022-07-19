name                = "tftestpe"
location            = "eastus"
resource_group_name = "validation-rg"

private_endpoints = {
  "testpe1" = {
    subnet_id                      = ""
    private_connection_resource_id = ""
    subresource_names              = ["sqlServer"]
    private_dns_zone_name          = "tftestdelme-tf-delme.database.windows.net"
    tags                           = {}
  }
}
