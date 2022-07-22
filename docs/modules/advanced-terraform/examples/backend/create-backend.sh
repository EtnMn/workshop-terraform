ENV=Prod
LOCATION=westeurope
RESOURCE_GROUP_NAME=rg-workshopstate-${ENV,,}-$LOCATION
TF_STORAGE_ACCOUNT=ststate$RANDOM
CONTAINER_NAME=tfstate
LOCK_NAME=delete-lock

az group create --name $RESOURCE_GROUP_NAME --location $LOCATION
az storage account create \
  --resource-group $RESOURCE_GROUP_NAME \
  --name $TF_STORAGE_ACCOUNT \
  --sku Standard_LRS \
  --allow-blob-public-access false \
  --tags 'ApplicationName=Terraform' 'Env=Prod'
  --encryption-services blob # <.> <.> <.> <.>

az storage account blob-service-properties update --account-name $TF_STORAGE_ACCOUNT \
    --resource-group $RESOURCE_GROUP_NAME \
    --enable-delete-retention true \
    --delete-retention-days 7 # <.>

ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $TF_STORAGE_ACCOUNT --query '[0].value' -o tsv) # <.>
az storage container create --name $CONTAINER_NAME --account-name $TF_STORAGE_ACCOUNT --account-key $ACCOUNT_KEY
az lock create --name $LOCK_NAME --resource-group $RESOURCE_GROUP_NAME --lock-type CanNotDelete --resource-type Microsoft.Storage/storageAccounts  --resource $TF_STORAGE_ACCOUNT # <.>
