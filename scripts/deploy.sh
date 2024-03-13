#!/bin/bash
# deploy.sh

chmod +x scripts/deploy.sh

# Load environment variables
if [ "$1" = "prod" ]; then
  source .env.prod
else
  source .env.dev
fi

# Navigate to the Terraform directory
cd ../IaC

# Initialize Terraform
terraform init

# Apply Terraform configuration
terraform apply -auto-approve