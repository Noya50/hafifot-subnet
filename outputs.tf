output "name" {
  value       = azurerm_subnet.this.name
  description = "The name of the subnet."
}

output "id" {
  value       = azurerm_subnet.this.id
  description = "The id of the subnet."
}

output "resource_group_name" {
  value       = azurerm_subnet.this.resource_group_name
  description = "The name of the resource group of the subnet."
}

output "location" {
  value = var.location
  description = "The location of the subnet"
}

output "nsg_id" {
  value       = var.network_security_group_id != null ? var.network_security_group_id : var.no_nsg_enabled == true ? null : tostring(module.nsg[0].id)
  description = "The id of the nsg of the subnet."
}
