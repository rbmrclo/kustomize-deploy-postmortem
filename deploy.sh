#!/bin/bash -eu

# KustomizeVersion:1.0.8

kubectl config use-context docker-for-desktop

cat service.yaml | kubectl apply -f -

echo
echo "============================="
kubectl get services | grep nginx-deployment | awk '{ print $4 }'
echo "============================="

echo
kustomize build overlays | kubectl apply -f -

echo
echo "============================="
kubectl get services | grep nginx-deployment | awk '{ print $4 }'
echo "============================="
echo
