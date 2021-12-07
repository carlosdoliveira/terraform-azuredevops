terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"

    }
    random = {
      source = "hashicorp/random"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "random" {

}
