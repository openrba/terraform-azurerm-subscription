variable "api_version"{
    description = "The api version of the enrollment_accounts api"
    default = "2018-03-01-preview"
}

variable "principal_name"{
    type = string
    description = "Specify the subscription type as production or nonprod"

    validation {
    # regex(...) fails if it cannot find a match
    condition     = can(regex("^\S+@\S+\.\S+$", var.principal_name))
    error_message = "The principal name must be a valid email address"
  }
}

variable "subscription_type"{
    type = string
    description = "Specify the subscription type as production or nonprod"

    validation {
    # regex(...) fails if it cannot find a match
    condition     = can(regex("(production|nonprod)", var.subscription_type))
    error_message = "The subscription_type variable must be one of production or nonprod."
  }
}

variable "offer_type"{
    description = "Maps the subscription type to the offer_type in Azure"
    default = map{
        "production"    : "MS-AZR-0017P"
        "nonprod"       : "MS-AZR-0148P"
    }
}