// Chart: https://github.com/prometheus-community/helm-charts/blob/main/charts/kube-prometheus-stack/Chart.yaml
variable "helm_kube_prometheus_stack_version" {
  description = "Helm chart version for kube-prometheus-stack."
  type        = string
  default     = "45.21.0"
}
