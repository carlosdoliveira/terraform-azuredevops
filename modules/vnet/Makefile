# Terraform-Azurerm-Vnet
all: cleanup prepare-readme

.PHONY: cleanup

cleanup: 
	rm ./README.md

prepare-readme: 
	echo "Preparando nova documentação"
	terraform-docs -c .terraform-docs.yml . > README.md
