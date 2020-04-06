#!/bin/bash

set -e

# Extract the query json into variables
eval "$(jq -r '@sh "SUBSCRIPTION_NAME=\(.subscription_name)"')"

# Get the subscription id and pass back map
az account list --query "[?name == '${SUBSCRIPTION_NAME}'].id | {id: join(', ', @)}" --output json