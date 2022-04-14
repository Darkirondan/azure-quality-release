terraform {
      required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
  
  # backend "azurerm" {
  #   resource_group_name  = "tstate"
  #   storage_account_name = "tstate32272"
  #   container_name       = "tstate"
  #   key                  = "terraform.tfstate"
  #   //access_key           = ""
  # }
}