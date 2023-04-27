terraform {
  # Terraform version
  # Doc: https://github.com/hashicorp/terraform
  required_version = ">= 1.4.0"

  required_providers {
    # Doc: https://registry.terraform.io/providers/hashicorp/kubernetes
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }

    # Doc: https://registry.terraform.io/providers/hashicorp/helm
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }
  }
}
