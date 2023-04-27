provider "kubernetes" {
  config_path = "../kind-kubeconfig.yml"
}

provider "helm" {
  kubernetes {
    config_path = "../kind-kubeconfig.yml"
  }
}

resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }
}

resource "helm_release" "kube_prometheus_stack" {
  name       = "kube-prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  namespace  = "monitoring"
  version    = var.helm_kube_prometheus_stack_version

  values = [templatefile("${path.module}/values/kube-prometheus-stack.yml", {})]
}
