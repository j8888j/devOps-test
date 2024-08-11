#!/bin/bash

kubectl create secret generic rabbitmq-secret \
  --from-literal=RABBITMQ_ERLANG_COOKIE="$RABBITMQ_ERLANG_COOKIE" \
  --from-literal=RABBITMQ_DEFAULT_USER="$RABBITMQ_DEFAULT_USER" \
  --from-literal=RABBITMQ_DEFAULT_PASS="$RABBITMQ_DEFAULT_PASS" \
  --dry-run=client -o yaml | kubectl apply -f -
