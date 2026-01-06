#!/bin/bash
ENV=$1

if [[ "$ENV" != "dev" && "$ENV" != "staging" && "$ENV" != "prod" ]]; then
  echo "Usage: ./deploy.sh {dev|staging|prod}"
  exit 1
fi

COMPOSE_FILE="docker-compose.$ENV.yml"

echo " Deploying to $ENV environment..."

docker compose -f $COMPOSE_FILE pull
docker compose -f $COMPOSE_FILE down
docker compose -f $COMPOSE_FILE up -d

echo " Running database migrations..."
./scripts/migrate_db.sh

echo " Running health check..."
./scripts/health_check.sh

echo " $ENV deployment successful"
