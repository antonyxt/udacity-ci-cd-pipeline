provider "azurerm" {
  features {}
  use_cli = true
}

data "azurerm_resource_group" "main" {
  name = "Azuredevops"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default = {
    Environment = "CI-CD"
    Owner       = "final-project"
  }
}

resource "azurerm_service_plan" "main" {
  name                = "${var.prefix}-asp"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  sku_name            = "S1"
  os_type             = "Linux"
  tags                = var.tags
}

resource "azurerm_app_service" "main" {
  name                = "${var.prefix}-appservice"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  app_service_plan_id = azurerm_service_plan.main.id

  tags = var.tags
}
