# Experiment - k3d in Gitpod

This workspace tests whether kubernetes can run in Gitpod. Here is the issue where the Gitpod team is tracking this:
- https://github.com/gitpod-io/gitpod/issues/4889

## Launch workspace

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/chuck-confluent/scratch/tree/gitpod-k8s-experiment)

## Install stuff

Install k3d, helm, kubectl
```bash
./install-k3d.sh
./install-helm.sh
./install-kubectl.sh
```

# Run k8s
Create a kubernetes cluster.
```bash
./start-kubernetes.sh
```

## Current Status

As of 18 March 2022

### Creating a simple test cluster
Running the `k3d cluster create testcluster`:
- cluster creation completes
- `kubectl cluster-info` shows valid output
- `kubectl get nodes` shows no resources or times out with "apiserver not ready" response

See `k8s-api-server.log` for more info. Errors mention "read-only filesystem". This log file was obtained with `docker logs k3d-testcluster-server-0 2>&1 | cat >  server.log`, where `k3d-testcluster-server-0` is the name of the docker container acting as the kubernetes control plane (aka api server) node.