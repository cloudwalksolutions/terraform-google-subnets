locals {
  primary_subnet_name  = "${var.name}-primary"
  failover_subnet_name = "${var.name}-failover"


  primary_subnet = {
    subnet_name           = local.primary_subnet_name
    subnet_ip             = var.primary_subnet_range
    subnet_region         = var.region
    subnet_private_access = "true"
  }

  failover_subnet = {
    subnet_name           = local.failover_subnet_name
    subnet_ip             = var.failover_subnet_range
    subnet_region         = var.failover_region
    subnet_private_access = "true"
  }

  use_failover = var.failover_subnet_range != ""
  subnets      = local.use_failover ? [local.primary_subnet, local.failover_subnet] : [local.primary_subnet]

  use_gke = var.gke_project_number != ""

  subnet_users = local.use_gke ? concat([
    "serviceAccount:service-${var.gke_project_number}@container-engine-robot.iam.gserviceaccount.com",
    "serviceAccount:service-${var.gke_project_number}@containerregistry.iam.gserviceaccount.com",
    "serviceAccount:${var.gke_project_number}@cloudservices.gserviceaccount.com",
    "serviceAccount:${var.gke_iac_sa}",
    "serviceAccount:${var.gke_node_sa}",
  ], var.subnet_users) : var.subnet_users

  primary_pods_range_name  = "${local.primary_subnet_name}-pods"
  failover_pods_range_name = "${local.failover_subnet_name}-pods"

  primary_services_range_name  = "${local.primary_subnet_name}-services"
  failover_services_range_name = "${local.failover_subnet_name}-services"

  secondary_ranges = local.use_gke ? {
    (local.primary_subnet_name) = [
      {
        range_name    = local.primary_pods_range_name
        ip_cidr_range = var.primary_pods_range
      },
      {
        range_name    = local.primary_services_range_name
        ip_cidr_range = var.primary_services_range
      }
    ]
    (local.failover_subnet_name) = [
      {
        range_name    = local.failover_pods_range_name
        ip_cidr_range = var.failover_pods_range
      },
      {
        range_name    = local.failover_services_range_name
        ip_cidr_range = var.failover_services_range
      }
    ]
  } : {}

  range_names = local.use_gke ? {
    "primary" = {
      "subnet_name"         = local.primary_subnet_name
      "pods_range_name"     = local.primary_pods_range_name
      "services_range_name" = local.primary_services_range_name
    }
    "failover" = {
      "subnet_name"         = local.failover_subnet_name
      "pods_range_name"     = local.failover_pods_range_name
      "services_range_name" = local.failover_services_range_name
    }
  } : {}

}


