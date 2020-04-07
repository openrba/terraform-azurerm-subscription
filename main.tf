data "external" "lookupByName" {
  # Looks up a subscription by its display name and returns id
  program = ["scripts/lookupByName.sh"]

  query = {
    subscription_name = var.subscription_name
  }
}

data "external" "createSubscription" {
  # Creates a subscription by name and returns its id
  count = length(data.external.lookupByName.result.id) > 0 ? 0 : 1
  program = ["scripts/createSubscription.sh"]

  query = {
    offer_type = var.offer_type
    subscription_name = var.subscription_name
    enrollment_acct = var.enrollment_acct
    owner_id = var.owner_id
    subscription_name = var.subscription_name
  }

  # Added dependency to prevent executing on terraform plan
  depends_on = [
    data.external.lookupByName,
  ]
}

resource "azurerm_management_group" "this" {
  # Adds subscription to the management group
  count = length(data.external.lookupByName.result.id) > 0 ? 0 : 1
  display_name = var.management_group_name

  subscription_ids = [
    data.external.createSubscription[0].result.id,
  ]
}