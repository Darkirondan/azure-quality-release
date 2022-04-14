output "public_ip_address_id" {
  value = "${azurerm_public_ip.test.id}"
}

output "NICid" {
    value = azurerm_network_interface.myterraformnic.id
}
