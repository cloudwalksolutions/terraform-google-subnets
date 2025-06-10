# Terraform Module: GCP Subnets

This is a Terraform module repository for creating a pair of subnets (primary/failover) as well as the necessary permissions on the subnets to use GKE in a shared VPC environment (if needed)

<img alt="Terraform" src="https://www.terraform.io/assets/images/logo-text-8c3ba8a6.svg" width="600px">

Documentation is available on the [Terraform website](http://www.terraform.io):

- [Intro](https://www.terraform.io/intro/index.html)
- [Docs](https://www.terraform.io/docs/index.html)

<!-- BEGIN_TF_DOCS -->
## Requirements

VPC to create the subnets in

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_network_iam_bindings"></a> [network\_iam\_bindings](#module\_network\_iam\_bindings) | terraform-google-modules/iam/google//modules/projects_iam | n/a |
| <a name="module_subnets"></a> [subnets](#module\_subnets) | terraform-google-modules/network/google//modules/subnets | n/a |

## Resources

| Name | Type |
|------|------|
| [google_compute_subnetwork_iam_binding.network_users](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork_iam_binding) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_failover_pods_range"></a> [failover\_pods\_range](#input\_failover\_pods\_range) | Non-RFC1918 CIDR range used for automl GKE failover pods | `string` | `""` | no |
| <a name="input_failover_region"></a> [failover\_region](#input\_failover\_region) | GCP Failover Region | `string` | `"us-east4"` | no |
| <a name="input_failover_services_range"></a> [failover\_services\_range](#input\_failover\_services\_range) | Non-RFC1918 CIDR range used for automl GKE failover services | `string` | `""` | no |
| <a name="input_failover_subnet_range"></a> [failover\_subnet\_range](#input\_failover\_subnet\_range) | RFC1918 CIDR range used for automl GKE failover nodes, leave empty if not using failover | `string` | `""` | no |
| <a name="input_failover_zones"></a> [failover\_zones](#input\_failover\_zones) | GCP Failover Zone | `list(string)` | <pre>[<br>  "us-east4-b",<br>  "us-east4-c"<br>]</pre> | no |
| <a name="input_gke_iac_sa"></a> [gke\_iac\_sa](#input\_gke\_iac\_sa) | GKE IaC service account | `string` | `""` | no |
| <a name="input_gke_node_sa"></a> [gke\_node\_sa](#input\_gke\_node\_sa) | GKE node service account | `string` | `""` | no |
| <a name="input_gke_project_number"></a> [gke\_project\_number](#input\_gke\_project\_number) | Project number to attach Network User role to GKE service agents | `string` | `""` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Network name | `string` | n/a | yes |
| <a name="input_network_project_id"></a> [network\_project\_id](#input\_network\_project\_id) | GCP Network project ID | `string` | n/a | yes |
| <a name="input_pods_range"></a> [pods\_range](#input\_pods\_range) | Non-RFC1918 CIDR range used for GKE pods | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | GCP Region | `string` | `"us-central1"` | no |
| <a name="input_services_range"></a> [services\_range](#input\_services\_range) | Non-RFC1918 CIDR range used for GKE services | `string` | `""` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | Subnet name | `string` | n/a | yes |
| <a name="input_subnet_range"></a> [subnet\_range](#input\_subnet\_range) | RFC1918 CIDR range used for automl GKE nodes | `string` | n/a | yes |
| <a name="input_subnet_users"></a> [subnet\_users](#input\_subnet\_users) | List of accounts to give Network User role to | `list(string)` | `[]` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | GKE Cluster Zones | `list(string)` | <pre>[<br>  "us-central1-a",<br>  "us-central1-b"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_failover_pods_range_name"></a> [failover\_pods\_range\_name](#output\_failover\_pods\_range\_name) | GKE pods secondary for failover region |
| <a name="output_failover_region"></a> [failover\_region](#output\_failover\_region) | GCP failover region |
| <a name="output_failover_services_range_name"></a> [failover\_services\_range\_name](#output\_failover\_services\_range\_name) | GKE services secondary for failover region |
| <a name="output_failover_subnet_name"></a> [failover\_subnet\_name](#output\_failover\_subnet\_name) | GKE subnet for failover |
| <a name="output_failover_zones"></a> [failover\_zones](#output\_failover\_zones) | List of GCP failover zone |
| <a name="output_pods_range_name"></a> [pods\_range\_name](#output\_pods\_range\_name) | GKE pods secondary for primary region |
| <a name="output_region"></a> [region](#output\_region) | GCP region |
| <a name="output_services_range_name"></a> [services\_range\_name](#output\_services\_range\_name) | GKE services secondary for primary region |
| <a name="output_subnet_name"></a> [subnet\_name](#output\_subnet\_name) | GKE subnet name |
| <a name="output_subnets"></a> [subnets](#output\_subnets) | GKE subnets |
| <a name="output_zones"></a> [zones](#output\_zones) | GKE cluster zones |
<!-- END_TF_DOCS -->