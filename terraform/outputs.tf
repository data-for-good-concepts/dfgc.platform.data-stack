output "workload_provider_name" {
  value = module.workload-identity-pools.workload_provider_name
}

output "service_account_email" {
  value = module.service-accounts.email
}
