## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.57.0 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | 3.2.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.1 |
| <a name="requirement_http"></a> [http](#requirement\_http) | >= 2.4.1 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.1 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 2.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.1 |
| <a name="requirement_template"></a> [template](#requirement\_template) | >= 2.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.57.0 |
| <a name="provider_http"></a> [http](#provider\_http) | >= 2.4.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_eks_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_iam_openid_connect_provider.oidc_provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_security_group.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [http_http.wait_for_cluster](https://registry.terraform.io/providers/terraform-aws-modules/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_egress_cidrs"></a> [cluster\_egress\_cidrs](#input\_cluster\_egress\_cidrs) | List of CIDR blocks that are permitted for cluster egress traffic. | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_cluster_log_retention_in_days"></a> [cluster\_log\_retention\_in\_days](#input\_cluster\_log\_retention\_in\_days) | Number of days to retain log events. Default retention - 90 days. | `number` | `90` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the EKS cluster. Also used as a prefix in names of related resources. | `string` | n/a | yes |
| <a name="input_cluster_role_arn"></a> [cluster\_role\_arn](#input\_cluster\_role\_arn) | IAM Role Arn for this cluster | `string` | n/a | yes |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | Kubernetes version to use for the EKS cluster. | `string` | n/a | yes |
| <a name="input_eks_oidc_root_ca_thumbprint"></a> [eks\_oidc\_root\_ca\_thumbprint](#input\_eks\_oidc\_root\_ca\_thumbprint) | Thumbprint of Root CA for EKS OIDC, Valid until 2037 | `string` | `"9e99a48a9960b14926bb7f3b02e22da2b0ab7280"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name | `string` | n/a | yes |
| <a name="input_external_secrets_region"></a> [external\_secrets\_region](#input\_external\_secrets\_region) | Region to look for external secrets | `string` | n/a | yes |
| <a name="input_node_additional_tags"></a> [node\_additional\_tags](#input\_node\_additional\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_node_k8s_labels"></a> [node\_k8s\_labels](#input\_node\_k8s\_labels) | n/a | `map(string)` | `{}` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | A list of subnets to place the EKS cluster and workers within. | `list(string)` | n/a | yes |
| <a name="input_public_ingress_cert_arn"></a> [public\_ingress\_cert\_arn](#input\_public\_ingress\_cert\_arn) | The ARN of the certificate to use | `string` | n/a | yes |
| <a name="input_public_ingress_max_replicas"></a> [public\_ingress\_max\_replicas](#input\_public\_ingress\_max\_replicas) | Max number of replicas for ingress controller | `number` | `1` | no |
| <a name="input_public_ingress_min_replicas"></a> [public\_ingress\_min\_replicas](#input\_public\_ingress\_min\_replicas) | Min number of replicas for ingress controller | `number` | `1` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources. Tags added to launch configuration or templates override these values for ASG Tags only. | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC where the cluster and workers will be deployed. | `string` | n/a | yes |
| <a name="input_wait_for_cluster_cmd"></a> [wait\_for\_cluster\_cmd](#input\_wait\_for\_cluster\_cmd) | Custom local-exec command to execute for determining if the eks cluster is healthy. Cluster endpoint will be available as an environment variable called ENDPOINT | `string` | `"for i in `seq 1 60`; do if `command -v wget > /dev/null`; then wget --no-check-certificate -O - -q $ENDPOINT/healthz >/dev/null && exit 0 || true; else curl -k -s $ENDPOINT/healthz >/dev/null && exit 0 || true;fi; sleep 5; done; echo TIMEOUT && exit 1"` | no |
| <a name="input_wait_for_cluster_interpreter"></a> [wait\_for\_cluster\_interpreter](#input\_wait\_for\_cluster\_interpreter) | Custom local-exec command line interpreter for the command to determining if the eks cluster is healthy. | `list(string)` | <pre>[<br>  "/bin/sh",<br>  "-c"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_arn"></a> [cluster\_arn](#output\_cluster\_arn) | The Amazon Resource Name (ARN) of the cluster. |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | The CA Certficate used to sign the cluster certs |
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | The endpoint for your EKS Kubernetes API. |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | The name/id of the EKS cluster. Will block on cluster creation until the cluster is really ready |
| <a name="output_cluster_version"></a> [cluster\_version](#output\_cluster\_version) | The Kubernetes server version for the EKS cluster. |
| <a name="output_oidc_issuer_url"></a> [oidc\_issuer\_url](#output\_oidc\_issuer\_url) | n/a |
| <a name="output_oidc_provider_arn"></a> [oidc\_provider\_arn](#output\_oidc\_provider\_arn) | The ARN of the OIDC Provider if `enable_irsa = true`. |
