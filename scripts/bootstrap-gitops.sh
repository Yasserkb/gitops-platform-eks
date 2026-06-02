#!/usr/bin/env bash
set -euo pipefail
REPO_URL="${1:-}"
if [[ -z "$REPO_URL" ]]; then
  echo "Usage: $0 https://github.com/Yasserkb/gitops-platform-eks.git" >&2
  exit 1
fi
TMP=$(mktemp)
sed "s#https://github.com/Yasserkb/gitops-platform-eks.git#${REPO_URL}#g" argocd/bootstrap/root-application.yaml > "$TMP"
kubectl apply -f "$TMP"
rm -f "$TMP"
