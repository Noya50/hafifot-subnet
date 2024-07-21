variable "name" {
  description = "(Optional) The name of the default subnet."
  default     = "default-subnet-tf"
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which the subnet will be created."
  type        = string
}

variable "location" {
  description = "(Required) The location of the subnet."
  type        = string
}

variable "subnet_address_prefixes" {
  description = "(Required) The address prefixes of the default subnet."
  type        = list(string)
}

variable "vnet_name" {
  description = "(Required) The name of the Vnet in which the subnet will be created."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "(Optional) Id of a log analytics workspace for diagnostic setting. Required if creating a new nsg"
  type = string
  default = null
}

variable "no_nsg_enabled" {
  description = "(Optional) Set to 'true' to create a subnet without nsg association. Default to 'false', when set to 'false' network_security_group_id or network_security_group_name must be defined."
  type        = bool
  default     = false
}

variable "network_security_group_id" {
  description = "(Optional) An existing NSG ID that will be associated with the subnets. Required if not defined 'network_security_group_name'."
  type        = string
  default     = null
}

variable "network_security_group_name" {
  description = "(Optional) Name for the NSG that will be associated with the subnets. If receives a value, creates a new nsg. Required if not defined 'network_security_group_id'."
  type        = string
  default     = null
}

variable "security_rules" {
  description = "(Optional) List of rules for the new network security group."
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  default = null
}
