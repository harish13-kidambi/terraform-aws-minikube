module "minikube" {
  source = "github.com/scholzj/terraform-aws-minikube"

  aws_region         = var.aws_region
  cluster_name       = var.project_name
  aws_instance_type  = "t3.medium"
  ssh_public_key     = file(var.key_location)
  aws_subnet_id      = var.public_subnet_cidr
  hosted_zone = var.hosted_zone
  hosted_zone_private = false
  tags = {
    Application = var.project_name
  }

  addons = [
    "https://raw.githubusercontent.com/kubernetes-sigs/metrics-server/master/components.yaml",
    "https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/storage-class.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/external-dns.yaml"
  ]
}
