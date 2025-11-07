provider "azurerm" {
  features {}
  subscription_id = "e7a256dc-769a-421c-9f8e-e283ed3cbefa"
  tenant_id       = "f958e84a-92b8-439f-a62d-4f45996b6d07"
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

resource "azurerm_linux_web_app" "main" {
  name                = "${var.prefix}-appservice"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  service_plan_id     = azurerm_service_plan.main.id
  site_config {
    application_stack {
      node_version = "18-lts" # or python_version, dotnet_version, etc.
    }
    always_on = true
  }
  tags = var.tags
}
