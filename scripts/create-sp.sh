# Run before ci/cd and Terraform to create and store sp
#!/bin/bash

# Variables
SP_NAME=cloud_engineer_sp
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

# Create the Service Principal
SP_JSON=$(az ad sp create-for-rbac --name "$SP_NAME" --role Contributor --scopes /subscriptions/$SUBSCRIPTION_ID --sdk-auth)

# Check if the Service Principal was created successfully
if [ $? -ne 0 ]; then
    echo "Failed to create the Service Principal."
    exit 1
fi

echo "Service Principal created successfully."

# Output the JSON to a file
echo $SP_JSON > azure_credentials.json
echo "Credentials saved to azure_credentials.json."

# Replace YOUR_GITHUB_REPO in the format "owner/repo"
gh secret set AZURE_CREDENTIALS --body "$SP_JSON" -R GideonBrasil/cloud_engineer