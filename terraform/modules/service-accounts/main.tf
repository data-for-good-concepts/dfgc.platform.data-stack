resource "google_service_account" "sa_tf_admin" {
  account_id   = "tf-admin"
  display_name = "Athlete Centric Terraform Admin Service Account"
}

resource "google_service_account_iam_member" "sa_tf_admin_iam" {
  service_account_id = google_service_account.sa_tf_admin.name
  role               = "roles/iam.workloadIdentityUser"
  member             = var.workload_identity_principal
}