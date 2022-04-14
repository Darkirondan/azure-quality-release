resource "azurerm_public_ip" "test" {
  name                = "${var.application_type}-${var.resource_type}-pubip"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  allocation_method   = "Dynamic"

}

resource "azurerm_network_interface" "myterraformnic" {
  name                = "myNIC"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "myNicConfiguration"
    subnet_id                     = var.mysubnetid
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.test.id
  }
}