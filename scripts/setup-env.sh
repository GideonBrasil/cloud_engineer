# Run before Terraform
#!/bin/bash
# setup-env.sh

if [ $# -eq 0 ]
then
  echo "No .env file supplied"
  exit 1
fi

set -a  # automatically export all variables
source "$1"
set +a

chmod +x /path/to/your/scripts/setup-env.sh

export TF_VAR_sp_password="your-secure-password"
export TF_VAR_subscription_id="your-subscription-id"
export TF_VAR_client_id="your-service-principal-client-id"
