# Runbook

## Argo CD app is OutOfSync

1. Check the diff: `argocd app diff demo-api-dev`.
2. Confirm whether the change is expected in Git.
3. If drift is manual, revert by syncing from Git: `argocd app sync demo-api-dev`.
4. If Git is wrong, open a PR with corrected values/manifests.

## Demo API is down

```bash
kubectl -n demo-api-dev get pods
kubectl -n demo-api-dev describe pod -l app.kubernetes.io/name=demo-api
kubectl -n demo-api-dev logs -l app.kubernetes.io/name=demo-api --tail=100
```

Check readiness/liveness endpoints:

```bash
kubectl -n demo-api-dev port-forward svc/demo-api-demo-api 8080:80
curl localhost:8080/actuator/health
```

## Prometheus is not scraping

1. Confirm `ServiceMonitor` exists.
2. Confirm Prometheus selectors allow cross-release ServiceMonitors.
3. Check `/targets` in Prometheus UI.
