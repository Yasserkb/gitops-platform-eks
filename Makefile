SHELL := /usr/bin/env bash
APP := demo-api
NAMESPACE := demo-api

.PHONY: kind-up kind-down install-argocd bootstrap-gitops helm-template helm-lint test build docker-build validate

kind-up:
	kind create cluster --config scripts/kind-config.yaml --name yasser-gitops || true

kind-down:
	kind delete cluster --name yasser-gitops

install-argocd:
	./scripts/install-argocd.sh

bootstrap-gitops:
	./scripts/bootstrap-gitops.sh "$(REPO_URL)"

helm-template:
	helm template $(APP) apps/demo-api/chart -f environments/dev/demo-api/values.yaml

helm-lint:
	helm lint apps/demo-api/chart -f environments/dev/demo-api/values.yaml

test:
	cd apps/demo-api && mvn -B test

build:
	cd apps/demo-api && mvn -B package

docker-build:
	docker build -t demo-api:local apps/demo-api

validate: helm-template helm-lint
