
resource "azurerm_resource_group" "main" {
  name     = "tfeautorgdnd1"
  location = "${var.region}"
  tags = "${local.common_tags}"
}

resource "azurerm_app_service_plan" "main" {
  name                = "${var.prefix}-asp"
  location            = "${azurerm_resource_group.main.location}"
  resource_group_name = "${azurerm_resource_group.main.name}"

  sku {
    tier = "Basic"
    size = "B1"
  }
  tags = "${local.common_tags}"
}

resource "azurerm_app_service" "main" {
  name                = "${var.prefix}-appservice"
  location            = "${azurerm_resource_group.main.location}"
  resource_group_name = "${azurerm_resource_group.main.name}"
  app_service_plan_id = "${azurerm_app_service_plan.main.id}"

  site_config {
    dotnet_framework_version = "v4.0"
    remote_debugging_enabled = true
    remote_debugging_version = "VS2017"
  }
  tags = "${local.common_tags}"
}

locals {
  # Commmon tags to be assigned to all resources
  common_tags = "${map(
   " User", "${var.user}",
   " CostCenter", "${var.cost_center}"
 )}"
}


output "app_service_name" {
  value = "${azurerm_app_service.main.name}"
}

output "app_service_default_hostname" {
  value = "https://${azurerm_app_service.main.default_site_hostname}"
}

