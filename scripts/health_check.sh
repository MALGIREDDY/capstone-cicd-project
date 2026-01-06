#!/bin/bash

echo "Waiting for backend health..."

for i in {1..15}; do
  if curl -sf http://localhost:5000/health >/dev/null; then
    echo "Backend is healthy"
    exit 0
  fi
  echo "Backend not ready yet ($i/15)"
  sleep 2
done

echo "Backend health check failed"
exit 1
