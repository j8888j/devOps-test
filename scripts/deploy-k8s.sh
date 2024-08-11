#!/bin/bash

# redis
kubectl apply -f ./k8s/config/app-config.yaml

# rabbitmq
kubectl apply -f ./k8s/rabbitmq/rabbitmq.yaml

# microservice 1
kubectl apply -f ./k8s/microservice1/microservice1.yaml

# microservice 2
kubectl apply -f ./k8s/microservice2/microservice2.yaml

# app config
kubectl apply -f ./k8s/config/app-config.yaml

# certificate
kubectl apply -f ./k8s/certificate/certificate.yaml
kubectl apply -f ./k8s/certificate/issuer.yaml

# ingress
kubectl apply -f ./k8s/ingress.yaml
