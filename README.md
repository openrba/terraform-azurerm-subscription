# terraform-azurerm-subscription
Creates a subscription in Azure, uses a custom provider from
[terraform-provider-restapi](https://github.com/Mastercard/terraform-provider-restapi)

This Terraform module deploys a new subscription to the enrollment account as provided in the input.

## Example Usage

```hcl
module "subscription" {
  source                = "github.com/openrba/terraform-azurerm-subscription"
  principal_name        = "BillingPlatformTeam@contoso.com"
  subscription_type     = "production"
}

```

## Argument Reference

The following arguments are supported.

- **principal_name** - (Required) Email of the service principal of the enrollment account.
- **subscription_type** - (Required) Type of subscription; Either production or nonprod.
- **api_version** - (Optional) API verssion of the enrollment accounts api.  Defaults to 2018-03-01-preview

## Attribute Reference

The following attributes are exported.

- **id** - The Object ID of the Subscription