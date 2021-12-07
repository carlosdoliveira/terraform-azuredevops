#----------------------
# Makefile Commands
#----------------------

all: prepare-documentation prepare-tfvars tf-setup validate-code create-environment

validate-code: tf-validate tf-format

create-environent: tf-setup tf-plan tf-apply

destroy-environment: tf-setup tf-plan-destroy tf-apply-destroy

prepare-tfvars: cleanup-tfvars prepare-tfvars

prepare-documentation: cleanup-docs prepare-readme

#----------------------
# Terraform Steps
#----------------------

terra-tests:
	terraform init && terraform validate && terraform plan -out main.tfplan && checkov -f create-remote-storage.tf

tf-setup: 
	./bootstrap/init.sh

tf-format:
	@echo "############################"
	@echo "📝 Validating Code..."
	@echo "############################"
	@echo ""
	@terraform format -check
	@echo "...Done 🏁"

tf-validate:
	@echo "############################"
	@echo "🖥 Validating Syntax..."
	@echo "############################"
	@echo ""
	@terraform validate
	@echo "...Done 🏁"

tf-plan: 
	@echo "############################"
	@echo "Creating Execution Plan..."
	@echo "############################"
	@echo ""
	@terraform plan -out ./plan/plan.tfplan
	@echo "...Done 🏁"

tf-apply:
	@echo "############################"
	@echo "Applying Execution Plan..."
	@echo "############################"
	@echo ""
	@terraform apply -auto-approve ./plan/plan.tfplan
	@echo "...Done 🏁"

tf-plan-destroy: 
	@echo "############################"
	@echo "Creating Execution Plan to destroy all..."
	@echo "############################"
	@echo ""
	@terraform plan -destroy -out ./plan/plan.tfplan
	@echo "...Done 🏁"

tf-apply-destroy:
	@echo "############################"
	@echo "Applying Execution Plan to destroy all..."
	@echo "############################"
	@echo ""
	@terraform apply -destroy -auto-approve ./plan/plan.tfplan
	@echo "...Done 🏁"

#----------------------
# Documentation Steps
#----------------------
.PHONY: cleanup-docs

cleanup-docs: 
	@rm ./README.md

prepare-readme: 
	@echo "Preparing all Environment Documentation..."
	@terraform-docs -c ./docs/.readme.yml . > README.md
	@echo "...Done 🏁"

.PHONY: cleanup-tfvars

cleanup-tfvars:
	@rm ./terraform.tfvars

prepare-tfvars:
	@echo "Preparando arquivo de Tfvars..."
	@terraform-docs -c ./docs/.terraform-docs.yml . > terraform.tfvars
	@echo "...Done 🏁"

#--------------------------------------
# Landing Zone Terraform Creation Steps
#--------------------------------------

#Faça um login utilizando o device code:
az-login:
	az login --use-device-code

#Crie uma service principal:
create-sp:
	az ad sp create-for-rbac --name $$SERVICE_PRINCIPAL_NAME

# Crie um resource group:
create-rg:
	az group create --name $$TF_BACKEND_RESOURCE_GROUP --location westeurope

# crie um storage account:
create-st:
	az storage account create --resource-group $$TF_BACKEND_RESOURCE_GROUP --name $$TF_BACKEND_STORAGE_ACCOUNT --sku Standard_LRS --encryption-services blob

# crie um container blob:
create-container:	
	az storage container create --name $$TF_BACKEND_CONTAINER --account-name $$TF_BACKEND_STORAGE_ACCOUNT

# Crie uma key vault:
create-kv:
	az keyvault create --name $$KEY_VAULT_NAME --resource-group $$TF_BACKEND_RESOURCE_GROUP --location westeurope

# Garanta o acesso ao key vault:
acesso-kv:
	az keyvault set-policy --name $$KEY_VAULT_NAME --object-id $$ARM_CLIENT_ID --secret-permissions get list --key-permissions get list --certificate-permissions get list

#create secrets key for all env vars:
create-access-all-vars:
	az keyvault secret set --vault-name $$KEY_VAULT_NAME --name "TF-BACKEND-STORAGE-ACCOUNT" --value $$TF_BACKEND_STORAGE_ACCOUNT
	az keyvault secret set --vault-name $$KEY_VAULT_NAME --name "TF-BACKEND-KEY" --value $$TF_BACKEND_KEY
	az keyvault secret set --vault-name $$KEY_VAULT_NAME --name "ARM-TENANT-ID" --value $$ARM_TENANT_ID
	az keyvault secret set --vault-name $$KEY_VAULT_NAME --name "ARM-CLIENT-ID" --value $$ARM_CLIENT_ID
	az keyvault secret set --vault-name $$KEY_VAULT_NAME --name "ARM-CLIENT-SECRET" --value $$ARM_CLIENT_SECRET
	az keyvault secret set --vault-name $$KEY_VAULT_NAME --name "SERVICE-PRINCIPAL-NAME" --value $$SERVICE_PRINCIPAL_NAME
	az keyvault secret set --vault-name $$KEY_VAULT_NAME --name "ARM-SUBSCRIPTION-ID" --value $$ARM_SUBSCRIPTION_ID
	az keyvault secret set --vault-name $$KEY_VAULT_NAME --name "TF-BACKEND-RESOURCE-GROUP" --value $$TF_BACKEND_RESOURCE_GROUP
	az keyvault secret set --vault-name $$KEY_VAULT_NAME --name "TF-BACKEND-CONTAINER" --value $$TF_BACKEND_CONTAINER

#terraform init config:
terraform-init:
	terraform init -reconfigure \
	-backend-config "resource_group_name=$$TF_BACKEND_RESOURCE_GROUP" \
	-backend-config "storage_account_name=$$TF_BACKEND_STORAGE_ACCOUNT" \
    -backend-config "container_name=$$TF_BACKEND_CONTAINER" \
    -backend-config "key=$$TF_BACKEND_KEY" \
    -backend-config "subscription_id=$$ARM_SUBSCRIPTION_ID" \
	-backend-config "access_key=$$ACCESS_KEY"
