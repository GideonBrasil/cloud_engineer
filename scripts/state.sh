#!/bin/bash
# state.sh

chmod +x scripts/deploy.sh

#!/bin/bash

# Set variables
RESOURCE_GROUP_NAME="pocTerraformStateRG"
LOCATION="Canada Central"
STORAGE_ACCOUNT_NAME="pocstatewellsperformance"
CONTAINER_NAME="poctfstate"

# Ensure the storage account name is lowercase as Azure requires it
STORAGE_ACCOUNT_NAME=${STORAGE_ACCOUNT_NAME,,}

# Create Resource Group
echo "Creating Resource Group: $RESOURCE_GROUP_NAME..."
az group create --name $RESOURCE_GROUP_NAME --location "$LOCATION"

# Create the Storage Account
echo "Creating Storage Account: $STORAGE_ACCOUNT_NAME..."
az storage account create \
    --resource-group $RESOURCE_GROUP_NAME \
    --name $STORAGE_ACCOUNT_NAME \
    --sku Standard_LRS \
    --encryption-services blob

# Get the Storage Account key
echo "Retrieving Storage Account Key..."
ACCOUNT_KEY=$(az storage account keys list \
    --resource-group $RESOURCE_GROUP_NAME \
    --account-name $STORAGE_ACCOUNT_NAME \
    --query '[0].value' -o tsv)

echo "Storage Account Key: $ACCOUNT_KEY"

# Create Blob Container
echo "Creating Blob Container: $CONTAINER_NAME..."
az storage container create \
    --name $CONTAINER_NAME \
    --account-name $STORAGE_ACCOUNT_NAME \
    --account-key $ACCOUNT_KEY

echo "Terraform state Backend Setup Complete!"