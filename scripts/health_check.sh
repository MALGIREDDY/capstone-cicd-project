#!/bin/bash

curl -f http://localhost:5000/health || {
  echo "❌ Backend health check failed"
  exit 1
}

echo "✅ Backend health check passed"
