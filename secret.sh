#!/bin/bash

# Create namespace
kubectl create namespace neptune

# Create the service account
kubectl create sa -n neptune neptune-sa-v2

# Create the secret for the service account
kubectl apply -f - <<EOF
apiVersion: v1
kind: Secret
metadata:
  name: neptune-sa-token
  namespace: neptune
  annotations:
    kubernetes.io/service-account.name: neptune-sa-v2
type: kubernetes.io/service-account-token
EOF

echo "Team Neptune has it's own ServiceAccount named neptune-sa-v2 in Namespace neptune" 
echo "A coworker needs the token from the secret that belongs to that ServiceAccount"
echo "Write the base64 decoded token to file /opt/token"
