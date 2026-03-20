#!/bin/bash

echo "Adding the NGINX Helm repository"
helm repo add nginx-stable https://helm.nginx.com/stable
helm repo update

echo "Installing NGINX Ingress Controller"
helm install my-nginx-controller nginx-stable/nginx-ingress \
  --namespace nginx-ingress \
  --create-namespace

echo "Script complete!"
