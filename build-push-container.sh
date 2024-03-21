#!/bin/sh

ACR_NAME='wellsperformanceacrdev'

az acr login -n $ACR_NAME

docker build . -t build-dev

docker tag build-dev $ACR_NAME.azurecr.io/build-dev:1.0
docker push $ACR_NAME.azurecr.io/build-dev:1.0

# az account set --subscrpition $SUBSCRIPTION_ID
# az aks get-credentials --resource-group $RESOURCE_GROUP_NAME --name $AKS_NAME --admin