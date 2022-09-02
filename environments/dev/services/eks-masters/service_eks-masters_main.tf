#

module "eks" {
  source           = "../../modules/eks-masters"
  cluster_name     = local.cluster_name
  cluster_role_arn = module.eks_master_iam.cluster_role_arn
  cluster_version  = var.cluster_version
  private_subnets  = data.terraform_remote_state.remote_state.outputs.private_subnets
  environment      = var.environment
  vpc_id           = data.terraform_remote_state.remote_state.outputs.vpc_id

  tags = {
    Environment = var.environment
    Owner       = var.cluster_owner
  }

  node_k8s_labels = {
    Environment = var.environment
  }

  node_additional_tags = {

  }

}