# Change to your own arcade name. This becomes part of your public URL.
# Example: http://palacearcade.azurewebsites.net/
variable "prefix" {
  default = "palace-arcade"
}

# Any docker image that runs an app on port 80 will do
# Try the scarolan/pizzaplanet image for an example change.
variable "image" {
  default = "scarolan/palacearcade"
}

# Choose a location
variable "location" {
  default = "centralus"
}

variable "https_only" {
  default = "false"
}

resource "azurerm_resource_group" "arcade" {
  name     = "${var.prefix}-containerapp-demo"
  location = var.location
}

# Utilize the web_app_container module from the public registry.
module "web_app_container" {
  source  = "innovationnorway/web-app-container/azurerm"
  version = "2.6.0"
  name                = var.prefix
  port                = "80"
  https_only          = var.https_only
  resource_group_name = azurerm_resource_group.arcade.name
  container_type      = "docker"
  container_image     = var.image
}

output "container_app_url" {
  value = "https://${module.web_app_container.hostname}"
}
