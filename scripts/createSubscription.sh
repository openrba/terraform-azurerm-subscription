#!/bin/bash

set -e

# Extract the query json into variables
eval "$(jq -r '@sh "
                    OFFER_TYPE=\(.offer_type) 
                    ENROLLMENT_ACCT=\(.enrollment_acct) 
                    SUBSCRIPTION_NAME=\(.subscription_name) 
                    OWNER_ID=\(.owner_id)
                    "')"

# Add the subscription extention
az extension add --name subscription

# Create the subscription
az account create --offer-type "${OFFER_TYPE}" \
    --display-name "${SUBSCRIPTION_NAME}" \
    --enrollment-account-name "${ENROLLMENT_ACCT}" \
    --owner-object-id "${OWNER_ID}"

# Return the subscription_id
az account list --query "[?name == '${SUBSCRIPTION_NAME}'].id | {id: join(', ', @)}" --output json