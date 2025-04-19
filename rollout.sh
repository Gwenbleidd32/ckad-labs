#!/bin/bash

set -e

echo "[+] Creating namespace 'neptune'..."
kubectl create namespace neptune --dry-run=client -o yaml | kubectl apply -f -

echo "[+] Creating initial working deployment 'api-newc32' in namespace 'neptune'..."
cat <<EOF | kubectl apply -n neptune -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: api-newc32
  annotations:
    kubernetes.io/change-cause: "initial deployment"
spec:
  replicas: 2
  selector:
    matchLabels:
      app: api-newc32
  template:
    metadata:
      labels:
        app: api-newc32
    spec:
      containers:
      - name: api-newc32
        image: nginx:1.21.6
        ports:
        - containerPort: 80
EOF

echo "[+] Waiting for initial deployment to finish..."
kubectl rollout status deployment/api-newc32 -n neptune

echo "[+] Applying a broken update"
cat <<EOF | kubectl apply -n neptune -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: api-newc32
  annotations:
    kubernetes.io/change-cause: "update"
spec:
  replicas: 2
  selector:
    matchLabels:
      app: api-newc32
  template:
    metadata:
      labels:
        app: api-newc32
    spec:
      containers:
      - name: api-newc32
        image: nginx:dank-loves.3.5.0
        ports:
        - containerPort: 80
EOF

echo "[+] Waiting 10 seconds for rollout to fail..."
sleep 10

echo "[⚠] Scenario Complete"

echo " Lab Setup is Now Complete!"
echo "📌 You now have a broken rollout in 'api-newc32'."
echo "🎯 Task: Fix this Deployment by rolling back to a working revision"
echo "💬 Message from Team Neptune: Can you please identify the issue causing the latest revision to fail?"

