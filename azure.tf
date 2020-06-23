

provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.0.0"
  features {}
}


terraform {
  backend "azurerm" {
    resource_group_name  = "tstate"
    storage_account_name = "tstate20021"
    container_name       = "tstate"
    key                  = "terraform.tfstate"
  }
}
 
 
resource "azurerm_resource_group" "resourcegroup" {
  name     = "challenge1"
  location = "southindia"
}

resource "azurerm_app_service_plan" "appserviceplan" {
  name                = "challenge1-appserviceplan"
  location            = azurerm_resource_group.resourcegroup.location
  resource_group_name = azurerm_resource_group.resourcegroup.name

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "appservice" {
  name                = "challenge1-app-service"
  location            = azurerm_resource_group.resourcegroup.location
  resource_group_name = azurerm_resource_group.resourcegroup.name
  app_service_plan_id = azurerm_app_service_plan.appserviceplan.id

  app_settings = {
    "WEBSITE_NODE_DEFAULT_VERSION" = "10.15.2"
    "ApiUrl" = ""
    "ApiUrlShoppingCart" = ""
    "MongoConnectionString" = ""
    "SqlConnectionString" = ""
    "productImagesUrl" = "https://raw.githubusercontent.com/microsoft/TailwindTraders-Backend/master/Deploy/tailwindtraders-images/product-detail"
    "Personalizer__ApiKey" = ""
    "Personalizer__Endpoint" = ""
  }

}


