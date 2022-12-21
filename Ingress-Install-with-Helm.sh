#!/bin/bash

# Install Ingress
helm install nginx-ingress ingress-ngin/ingress-nginx \ 
  --namespace development --set controller.replicaCount=1 \
  --set controller.nodeSelector."kubernetes\.io/os"=linux \
  --set controller.admissionWebhooks.patch.nodeSelector."kubernetes\.io/os"=linux \
  --set controller.service.loadBalancerIP=<YOUR-IP-PUBLIC-ADDRESS>

# Install Cert Manager for SSL
helm install cert-manager jetstack/cert-manager --namespace development --version v1.5.3 --set installCRDs=true