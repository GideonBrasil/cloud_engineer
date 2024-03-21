# Run before Terraform
#!/bin/bash
# setup-env.sh

set -e
set -o pipefail
set -x

# Define your application name and Azure subscription ID
appName="cloud_engineer"
subscriptionId=$(az account show --query id -o tsv)

# Create a Service Principal for your application
sp=$(az ad sp create-for-rbac --name $appName --query "{clientId:appId, clientSecret:password, tenantId:tenant}" -o json)

if [ $? -ne 0 ]; then
    echo "Failed to create a Service Principal."
    exit 1
fi

clientId=$(echo $sp | jq -r .clientId)
clientPwd=$(echo $sp | jq -r .clientSecret)
tenantId=$(echo $sp | jq -r .tenantId)

if [ $# -eq 0 ]
then
  echo "No .env file supplied"
  exit 1
fi

set -a  # automatically export all variables
source "$1"
set +a

export TF_VAR_sp_password=$clientPwd
export TF_VAR_subscription_id=$subscriptionId
export TF_VAR_client_id=$clientId

echo "Environment variables set."
echo "TF_VAR_subscription_id: $TF_VAR_subscription_id"
echo "TF_VAR_client_id: $TF_VAR_client_id"
echo "TF_VAR_sp_password: $TF_VAR_sp_password"

# export TF_VAR_sp_password="your-secure-password"
# export TF_VAR_subscription_id="your-subscription-id"
# export TF_VAR_client_id="your-service-principal-client-id"