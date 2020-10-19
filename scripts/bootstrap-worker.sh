#!/bin/sh
set -e
cd `dirname $0`

export KUBECONFIG=~/.kube/config
export DATASTORE_TYPE=kubernetes

sudo sh ./00_configure.sh
sudo sh ./01_join-k8s-cluster.sh
sudo sh ./02_install-calico-worker.sh