#!/bin/bash

set -e

echo "[+] Creating deployment with 5 identical pods..."
kubectl create deployment checker --image=nginx || true
kubectl scale deployment checker --replicas=5
kubectl create namespace neptune

echo "[+] Waiting a few seconds for pods to become ready..."
sleep 5

echo "[+] Getting all pod names..."
PODS=($(kubectl get pods -l app=checker -o jsonpath="{.items[*].metadata.name}"))

BAD_POD_INDEX=$((RANDOM % ${#PODS[@]}))
BAD_POD=${PODS[$BAD_POD_INDEX]}

echo "[+] Patching pod $BAD_POD with a special label ..."
kubectl label pod "$BAD_POD" purpose=parser --overwrite

echo "[✔] Lab setup complete!"
echo "    All pods are healthy and running."
echo "    You're only looking for one pod."
echo ""
echo "👉 Use this to find it:"
echo "   The board of team neptune decided to take over control of one e-commerce webserver from the default namespace."
echo "   The admin who once setup this webserver is not part of the organisation any longer. All information you could get was that the application contains a system was known as 'parser'"
echo "   Search for the application contiaining the parser system and migrate it into the neptune namespace  "

