data "azurerm_client_config" "current" {}

output "resource_group_name" {
  value = azurerm_resource_group.mlops_iam.name
}

output "client_id" {
  value = azurerm_user_assigned_identity.gh_actions_mlops.client_id
}

output "tenant_id" {
  value = azurerm_user_assigned_identity.gh_actions_mlops.tenant_id
}

output "subscription_id" {
  value = data.azurerm_client_config.current.subscription_id
}
