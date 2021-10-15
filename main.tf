resource "azurerm_resource_group" "rg" {
  location = var.location
  name     = "${var.prefix}-resources"
  tags     = local.common_tags
}
