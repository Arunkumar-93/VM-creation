provider "azurerm"{
    features{}
}

resource "azurerm_resource_group" "ED_rg"{
    name     = "Devapp resource_group"
    location = "East_US"
}

resource "azurerm_virtual_network" "ED_Vnet"{
    name                = "Devapp_Vnet"
    address_space       = ["10.0.0.0.16"]
    location            = azurerm_resource_group.ED_rg.location
    resource_group_name = azurerm_resource_group.ED_rg.name
}
resource "azurerm_linux_virtual_machine" "ED_VM"{
    name                = "Devapp_VM"
    resource_group_name = azurerm_resource_group.ED_rg.name
    location            = azurerm_resource_group.ED_rg.location
    size                = "standard B1s"
}
source_image_reference {
    publisher = "canonical"
    offer = "ubuntu"
    sku = "20"
    version = "latest"
}