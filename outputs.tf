

output "subnets" {
  description = "GKE subnets"
  value       = module.subnets.subnets
}


output "range_names" {
  description = "Subnet and secondary range names"
  value       = local.range_names
}


output "region" {
  description = "GCP region"
  value       = var.region
}


output "zones" {
  description = "GKE cluster zones"
  value       = var.zones
}
