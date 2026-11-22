resource "azurerm_user_assigned_identity" "gh_actions_mlops" {
  name                = "id-${var.project_prefix}-gh-oidc"
  resource_group_name = azurerm_resource_group.mlops_iam.name
  location            = azurerm_resource_group.mlops_iam.location

  tags = {
    stage = "stage-1-iam"
  }
}

resource "azurerm_federated_identity_credential" "github_main" {
  name                = "fic-github-${var.github_branch}"
  resource_group_name = azurerm_resource_group.mlops_iam.name
  audience            = ["api://AzureADTokenExchange"]
  issuer              = "https://token.actions.githubusercontent.com"
  parent_id           = azurerm_user_assigned_identity.gh_actions_mlops.id
  subject             = "repo:${var.github_org}/${var.github_repo}:ref:refs/heads/${var.github_branch}"
}

resource "azurerm_role_assignment" "mlops_rg_contributor" {
  scope                = azurerm_resource_group.mlops_iam.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.gh_actions_mlops.principal_id
}
