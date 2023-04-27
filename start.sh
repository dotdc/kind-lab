#!/bin/bash

export W=$'\e[0m' # White
export B=$'\e[96m' # Blue

kind_cluster_name="kind-kube-prometheus-stack"

# kind cluster configuration file
kind_kubeconf_file="kind-kubeconfig.yml"

# Create kind cluster
echo -e "[${B}INFO${W}] Creating kind cluster"
sudo kind create cluster --name "${kind_cluster_name}" --config="kind-config.yaml"

# Save kind kubeconfig
sudo kind get kubeconfig --name "${kind_cluster_name}" > "$(pwd)/${kind_kubeconf_file}"

# Install Cilium
echo -e "[${B}INFO${W}] Installing Cilium"
export KUBECONFIG="$(pwd)/${kind_kubeconf_file}"
cilium install

# Terraform apply
echo -e "[${B}INFO${W}] Terraform apply"
cd terraform/
# Clean
rm -rf .terraform
rm -f terraform.tfstate
rm -f terraform.tfstate.backup
rm -f .terraform.lock.hcl
# Install
terraform init
terraform apply -auto-approve

# Output
cd ..
echo -e "[${B}INFO${W}] To use kind:\nexport KUBECONFIG=\$(pwd)/${kind_kubeconf_file}\n"
