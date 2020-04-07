# terraform-azurerm-subscription
 Creates azure subscriptions

This Terraform module deploys a new subscription in Azure and assigns it to the management group

## Example Usage

```hcl
provider "azurerm" {
  features {}
}

module "subscription" {
  source                = "github.com/openrba/terraform-azurerm-subscription
  enrollment_acct       = "billing@onmicrosoft.com"
  owner_id              = "FHSUEJ&FHEYF&EHDJF"
  subscription_name     = "productgroup-prod"
  management_group_name = "division-businessunit-market"
  offer_type            = "MS-AZR-0017P"
}

```

## Argument Reference

The following arguments are supported.

- **enrollment_acct** - (Required) The name of the enrollment account which should be used to create a subscription.
- **owner_id** - (Required) The user principal name(s) of owner(s) who should be granted access to the new subscription.
- **subscription_name** - (Required) The display name of the subscription.
- **management_group_name** - (Required) The name of the management group that owns this subscription.
- **offer_type** - (Optional) The offer type of the subscription. For example, MS-AZR-0017P (EnterpriseAgreement) and MS-AZR-0148P (EnterpriseAgreement devTest) are available. accepted values: MS-AZR-0017P, MS-AZR-0148P

## Attribute Reference

The following attributes are exported.

- **id** - The Object ID of the Group

## Diagram

The following is a graphical representation of the module.

![Module Graph](/images/graph.png)