output "workload_identity_principal" {
  value = format(
    "principal://iam.googleapis.com/%s/subject/%s",
    google_iam_workload_identity_pool.tfc_identity_pool.name,
    var.tfc_organization_id
  )
}
output "workload_provider_name" {
  value = google_iam_workload_identity_pool_provider.pool-provider.name
}