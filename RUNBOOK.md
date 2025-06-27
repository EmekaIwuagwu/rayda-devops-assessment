# Runbook: FastAPI Production Service

## Health Check

```bash
curl http://<host>/health
```

## Rollback

```bash
bash scripts/rollback.sh
```

## Scaling

```bash
kubectl scale deployment fastapi-app --replicas=3
```
