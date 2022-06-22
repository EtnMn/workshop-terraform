variable "resource-group-name" { # <.>
  description = "Azure resource group name"
  type        = string # <.>
}

variable "azure-region" {
  description = "Azure location"
  type        = string
  default     = "westeurope" # <.>
}

variable "storage-account-name" {
  description = "Azure storage account name"
  type        = string
}

variable "storage-account-container-name" {
  description = "Azure storage account container name"
  type        = string
  default     = "files"
}
