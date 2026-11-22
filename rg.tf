resource "azurerm_resource_group" "mlops_iam" {
  name     = "rg-${var.project_prefix}-iam-${var.location}"
  location = var.location

  tags = {
    stage   = "stage-1-iam"
    managed = "terraform"
  }
}
