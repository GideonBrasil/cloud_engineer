# Run before ci/cd and Terraform to create and store sp
#!/bin/bash

# Variables (Replace YOUR_GITHUB_REPO in the format "owner/repo")
SP_NAME=cloud_engineer_sp
SUBSCRIPTION_ID=$(az account show --query id -o tsv)
REPO=GideonBrasil/cloud_engineer

# Create the Service Principal
SP_JSON=$(az ad sp create-for-rbac --name "$SP_NAME" --role Contributor --scopes /subscriptions/$SUBSCRIPTION_ID --sdk-auth 2>/dev/null)

# Check if the Service Principal was created successfully
if [ -z "$SP_JSON" ]; then
    echo "Failed to create the Service Principal or retrieve the JSON output."
    exit 1
fi

# Assign the RBAC Administrator Role to the Service Principal
SP_OBJECT_ID=$(az ad sp list --display-name "$SP_NAME" --query "[].id" --output tsv)
if [ -z "$SP_OBJECT_ID" ]; then
    echo "Failed to retrieve the Service Principal's object ID."
    exit 1
else
    az role assignment create --assignee $SP_OBJECT_ID --role "f58310d9-a9f6-439a-9e8d-f62e7b41a168" --scope /subscriptions/$SUBSCRIPTION_ID > /dev/null 2>&1
fi

CLIENT_ID=$(echo "$SP_JSON" | jq -r '.clientId')
SECRET=$(echo "$SP_JSON" | jq -r '.clientSecret')
SUBSCRIPTION_ID=$(echo "$SP_JSON" | jq -r '.subscriptionId')
TENANT_ID=$(echo "$SP_JSON" | jq -r '.tenantId')

echo "Service Principal created successfully."

# Output the JSON to a file
echo $SP_JSON > azure_credentials.json
echo "Credentials saved to azure_credentials.json."

# Set GitHub Secrets
gh secret set AZURE_CREDENTIALS --body "$SP_JSON" -R $REPO
gh secret set AZURE_CLIENT_ID --body "$CLIENT_ID" -R $REPO -e "development"
gh secret set AZURE_CLIENT_SECRET --body "$SECRET" -R $REPO -e "development"
gh secret set AZURE_SUBSCRIPTION_ID --body "$SUBSCRIPTION_ID" -R $REPO -e "development"
gh secret set AZURE_TENANT_ID --body "$TENANT_ID" -R $REPO -e "development"