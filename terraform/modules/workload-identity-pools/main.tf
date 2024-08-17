resource "google_iam_workload_identity_pool" "tfc_identity_pool" {
  workload_identity_pool_id = "admin-terraform-pool"
  display_name              = "admin-terraform-pool"
  description               = "Terraform Admin Pool"
  disabled                  = false
}

resource "google_iam_workload_identity_pool_provider" "pool-provider" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.tfc_identity_pool.workload_identity_pool_id
  workload_identity_pool_provider_id = "terraform-cloud-oidc"
  display_name                       = "terraform-cloud-oidc"
  description                        = "Terraform Cloud OIDC Provider"
  disabled                           = false

  attribute_mapping = {
    "google.subject"               = "assertion.terraform_organization_id"
    "attribute.tfc_project_id"     = "assertion.terraform_project_id"
    "attribute.tfc_project_name"   = "assertion.terraform_project_name"
    "attribute.tfc_workspace_name" = "assertion.terraform_workspace_name"
  }

  oidc {
    issuer_uri = "https://app.terraform.io"
  }

  attribute_condition = "attribute.tfc_organization_id == 'athlete-centric' && attribute.tfc_project_name.startsWith ('${var.tfc_project_name_condition}')"
}
