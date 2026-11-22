variable "location" {
  type        = string
  default     = "eastus2"
  description = "Primary Azure region"
}

variable "project_prefix" {
  type        = string
  default     = "mlops"
  description = "Short prefix for naming resources"
}

variable "github_org" {
  type        = string
  description = "GitHub username or organization"
}

variable "github_repo" {
  type        = string
  description = "GitHub repository name"
}

variable "github_branch" {
  type        = string
  default     = "main"
  description = "Branch allowed to exchange OIDC tokens"
}
