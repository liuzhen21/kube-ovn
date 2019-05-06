#!/bin/bash
set -euo pipefail

# Remove finalizers in svc
kubectl patch svc -n kube-ovn ovn-nb --type='json' -p '[{"op": "replace", "path": "/metadata/finalizers", "value": []}]'
kubectl patch svc -n kube-ovn ovn-sb --type='json' -p '[{"op": "replace", "path": "/metadata/finalizers", "value": []}]'

# Delete Kube-OVN components
kubectl delete ns kube-ovn

# Remove annotations in namespaces and nodes
kubectl annotate no --all ovn.kubernetes.io/cidr-
kubectl annotate no --all ovn.kubernetes.io/gateway-
kubectl annotate no --all ovn.kubernetes.io/ip_address-
kubectl annotate no --all ovn.kubernetes.io/logical_switch-
kubectl annotate no --all ovn.kubernetes.io/mac_address-
kubectl annotate no --all ovn.kubernetes.io/port_name-
kubectl annotate ns --all ovn.kubernetes.io/cidr-
kubectl annotate ns --all ovn.kubernetes.io/exclude_ips-
kubectl annotate ns --all ovn.kubernetes.io/gateway-
kubectl annotate ns --all ovn.kubernetes.io/logical_switch-
kubectl annotate ns --all ovn.kubernetes.io/private-
kubectl annotate ns --all ovn.kubernetes.io/allow-
