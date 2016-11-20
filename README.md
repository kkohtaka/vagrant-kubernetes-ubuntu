# vagrant-kubernetes-ubuntu

This project helps you to host a Kubernetes cluster with `kubeadm`.

## How to start a Kubernetes cluster

```bash
# This command will download Vagrant box: `boxcutter/ubuntu1610`.
make box

# This command will build a new Vagrant box which contains `kubeadm` and is based on `boxcutter/ubuntu1610`.
make build

# This command will start Vagrant instances of the Vagrant box and configure them as a Kubernetes cluster.
make run
```
