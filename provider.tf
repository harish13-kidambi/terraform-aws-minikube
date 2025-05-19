# which provider you are connecting to, version
terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.4.0"
    }
  }

  backend "s3" {
    bucket         = "terraform-docker-kub8-resource"
    key            = "minikube/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
  }
}

provider "aws" {
  # Configuration options
  region = "ap-south-1"
  #access_key = "AKIAYSMUYFFIFNQRXMFE"
  #secret_key = "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"
}