variable "environment" {
  description = "The environment."
}
  
variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  default     = "West US 2"
}

variable "owner" {
  description = "Project owner."
  default     = "Andy Assareh"
}

variable "prefix" {
  description = "The name prefix to prepend or append to resource names. This may become part of a public URL."
}

locals {
  common_tags = {
    owner              = var.owner
    se-region          = "AMER - West E2 - R2"
    purpose            = "Demo"
    ttl                = "3"    # hours
    terraform          = "true" # true/false
    hc-internet-facing = "true" # true/false
  }
}
