${jsonencode({
  "displayName": "${subscription_name}",
  "offerType": "${offer_type}",
  "owners": [for users in ip_addrs : "${addr}:${port}"],
})}