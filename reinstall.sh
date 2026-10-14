#!/bin/bash
set -euo pipefail

readonly name_cluster=kind
readonly cluster_config=cluster-config.yaml
readonly calico_url="https://raw.githubusercontent.com/projectcalico/calico/v3.28.1/manifests/calico.yaml"


echo "Deleting cluster $name_cluster"
kind delete cluster --name "$name_cluster"
echo "Deleted cluster $name_cluster"

echo -n "Creating Cluster..."
kind create cluster --config $cluster_config --name "$name_cluster"
echo -n "Created Cluster"

echo -n "Create CNI Calico"
kubectl create -f "$calico_url"
echo -n "Created calico"

