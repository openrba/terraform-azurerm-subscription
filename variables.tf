variable "enrollment_acct" {
  # The enrollment name of the account to assign this subscription to
  type = string
}

variable "owner_id" {
  # Object ID of a user or service principal that should own this subscription
  type = string
}

variable "subscription_name" {
  # The name you wish to call this subscription by in the form of
  # <product-delivery-platform>-<prod||nonprod>
  type = string
}

variable "management_group_name" {
  # The name of the managment group that owns this subscription
  type = string
}

variable "offer_type" {
  # The offer type of the subscription
  default = "MS-AZR-0017P"
  type = string
}