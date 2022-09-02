#

resource "random_string" "suffix" {
  length  = 8
  special = false
}

locals {
  cluster_name = "${var.cluster_name}-${var.environment}-eks-${random_string.suffix.result}"
}

#------------------------------------------------------------------------------------------------------