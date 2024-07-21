resource "azurerm_subnet" "this" {
  name                 = var.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.subnet_address_prefixes
  service_endpoints    = ["Microsoft.Storage"]
}

module "nsg" {
  for_each = var.network_security_group_id != null || var.no_nsg_enabled == true ? tomap({}) : tomap({ 0 = true })

  source = "git::https://github.com/Noya50/hafifot-nsg.git?ref=main"

  name                = var.network_security_group_name
  location            = var.location
  resource_group_name = var.resource_group_name
  security_rules      = var.security_rules
  log_analytics_workspace_id = var.log_analytics_workspace_id
}

resource "azurerm_subnet_network_security_group_association" "this" {
  for_each = var.no_nsg_enabled == true ? tomap({}) : tomap({ 0 = true })

  subnet_id                 = azurerm_subnet.this.id
  network_security_group_id = var.network_security_group_id != null ? var.network_security_group_id : tostring(module.nsg[0].id) 

  depends_on = [
    azurerm_subnet.this,
    module.nsg
  ]
}
