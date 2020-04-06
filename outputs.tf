output "id" {
    value = data.external.createSubscription.*.result.id
    depends_on =  [
        azurerm_management_group.this,
    ]
}