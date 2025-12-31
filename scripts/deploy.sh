#!/bin/bash
ENV=$1

if [ "$ENV" != "staging" ]; then
  echo "Usage: ./deploy.sh staging"
  exit 1
fi

echo "🚀 Deploying to STAGING environment..."

docker compose -f docker-compose.staging.yml pull
docker compose -f docker-compose.staging.yml down
docker compose -f docker-compose.staging.yml up -d

./scripts/migrate_db.sh
./scripts/health_check.sh

echo "✅ Staging deployment successful"
