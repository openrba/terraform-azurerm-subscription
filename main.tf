provider "restapi" {
  uri                  = "https://management.azure.com"
  write_returns_object = true
}

data "restapi_object" "enrollment_accounts" {
  path = "/providers/Microsoft.Billing/enrollmentAccounts"
  query_string = "api-version=${var.api_version}"
  search_key = "principalName"
  search_value = "${var.principal_name}"
}

data "template_file" "subscription_json" {
  template = "${file("subscription_json.tpl")}"
  vars = {
    offer_type = "${lookup(offer_type, var.subscription_type)}"
    consul_address = "${aws_instance.consul.private_ip}"
  }
}