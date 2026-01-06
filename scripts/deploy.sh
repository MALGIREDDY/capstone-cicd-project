#!/bin/bash

ENV=$1

if [[ "$ENV" != "development" && "$ENV" != "staging" && "$ENV" != "production" ]]; then
  echo "Usage: ./deploy.sh {development|staging|production}"
  exit 1
fi

echo "🚀 Deploying to $ENV environment..."

docker compose -f docker-compose.$ENV.yml pull
docker compose -f docker-compose.$ENV.yml down
docker compose -f docker-compose.$ENV.yml up -d

./scripts/migrate_db.sh
./scripts/health_check.sh

echo "✅ $ENV deployment successful"
