module "workload-identity-pools" {
  source = "./modules/workload-identity-pools"

  tfc_organization_id        = var.tfc_organization_id
  tfc_project_name_condition = var.tfc_project_name_condition
}

module "service-accounts" {
  source = "./modules/service-accounts"

  workload_identity_principal = module.workload-identity-pools.workload_identity_principal
}
