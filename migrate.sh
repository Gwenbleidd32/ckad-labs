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

echo ""
echo "[✔] Lab setup complete!"
echo "    All pods are healthy and running."
echo "    You're only looking for one pod."
echo ""
echo "👉 Use this to find it:"
echo "   The board of Team Neptune decided to take over control of one e-commerce webserver from the default namespace."
echo "   The admin who once set up this webserver is no longer part of the organization."
echo "   All information you could get was that the application contains a system called 'parser'."
echo "   Search for the application containing the parser system and migrate it into the 'neptune' namespace."

