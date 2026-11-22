resource "azurerm_virtual_network" "mlops_vnet" {
  name                = "vnet-${var.project_prefix}-${var.location}"
  address_space       = ["10.20.0.0/16"]
  location            = azurerm_resource_group.mlops_iam.location
  resource_group_name = azurerm_resource_group.mlops_iam.name

  tags = {
    stage = "stage-1-iam"
  }
}

resource "azurerm_subnet" "ml_workloads" {
  name                 = "snet-ml-workloads"
  resource_group_name  = azurerm_resource_group.mlops_iam.name
  virtual_network_name = azurerm_virtual_network.mlops_vnet.name
  address_prefixes     = ["10.20.1.0/24"]
}
