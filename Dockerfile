# Multi-stage Dockerfile
FROM python:3.11-slim as builder
WORKDIR /app
COPY main.py .
RUN pip install fastapi uvicorn[standard] &&     pip freeze > requirements.txt

FROM python:3.11-slim
WORKDIR /app
COPY --from=builder /app /app
COPY --from=builder /app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
