#!/bin/bash

# Extract arguments
APP_ID=$1
SP_PASS=$2
TENANT_ID=$3
AKS_CLUSTER_NAME=$4
RESOURCE_GROUP_NAME=$5
REPO="GideonBrasil/cloud_engineer"

# Set GitHub Secrets
gh secret set AZURE_AD_APPLICATION_ID --body "$APP_ID" -R $REPO
gh secret set AZURE_AD_SP_PASSWORD --body "$SP_PASS" -R $REPO
gh secret set AZURE_AD_TENANT_ID --body "$TENANT_ID" -R $REPO
gh secret set AKS_CLUSTER_NAME --body "$AKS_CLUSTER_NAME" -R $REPO
gh secret set RESOURCE_GROUP_NAME --body "$RESOURCE_GROUP_NAME" -R $REPO
