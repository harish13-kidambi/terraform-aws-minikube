module "minikube" {
  source = "github.com/scholzj/terraform-aws-minikube"

  aws_region         = data.aws_region.current.name
  cluster_name       = var.project_name
  aws_instance_type  = "t3.medium"
  ssh_public_key     = var.key_location
  aws_subnet_id      = local.public_subnet_ids[0]
  hosted_zone = var.hosted_zone
  hosted_zone_private = false
  tags = {
    Application = var.project_name
  }

}
