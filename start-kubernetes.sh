#!/bin/bash

# Start kubernetes cluster
k3d cluster create --config k3d-updated.yml

# label nodes according to availability zone
kubectl label node k3d-mykube-agent-0 topology.kubernetes.io/zone=us-east-1a
kubectl label node k3d-mykube-agent-1 topology.kubernetes.io/zone=us-east-1a
kubectl label node k3d-mykube-agent-2 topology.kubernetes.io/zone=us-east-1b
kubectl label node k3d-mykube-agent-3 topology.kubernetes.io/zone=us-east-1b
kubectl label node k3d-mykube-agent-4 topology.kubernetes.io/zone=us-east-1c
kubectl label node k3d-mykube-agent-5 topology.kubernetes.io/zone=us-east-1c

# Create confluent namespace and use it
kubectl create namespace confluent
kubectl config set-context --current --namespace=confluent