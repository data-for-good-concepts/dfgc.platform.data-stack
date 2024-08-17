variable "gcp_project_id" {
  description = "The Google Cloud project ID"
  type        = string
}

variable "gcp_region" {
  description = "The Google Cloud region"
  type        = string
}

variable "tfc_organization_id" {
  description = "The Terraform Cloud organization ID"
  type        = string
}

variable "tfc_project_name_condition" {
  description = "The condition the Terraform Cloud project name must meet"
  type        = string
}