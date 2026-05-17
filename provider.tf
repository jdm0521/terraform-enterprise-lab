terraform {
  required_version = ">= 1.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "tfstatejdm0521"
    container_name       = "tfstate"
    key                  = "enterprise-lab.tfstate"
  }
}

provider "azurerm" {
  features {}
}