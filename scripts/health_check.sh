#!/bin/bash
set -e

echo "❤️ Performing health check..."

BACKEND_URL="http://localhost:5000/health"
FRONTEND_URL="http://localhost"

sleep 5

# Backend health check
if curl -sf $BACKEND_URL > /dev/null; then
  echo "✅ Backend is healthy"
else
  echo "❌ Backend health check failed"
  exit 1
fi

# Frontend health check
if curl -sf $FRONTEND_URL > /dev/null; then
  echo "✅ Frontend is reachable"
else
  echo "❌ Frontend health check failed"
  exit 1
fi

echo "🎉 Health check passed successfully"
