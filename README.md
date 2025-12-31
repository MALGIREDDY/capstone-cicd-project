## Continuous Deployment (CD)

This project implements a scripted deployment mechanism for the staging environment.

Due to infrastructure constraints, automated SSH-based deployment is documented
but not executed in GitHub Actions.

Deployment is performed using:

- Docker Compose (staging configuration)
- Automated shell scripts
- Health verification

### Deployment Steps
```bash
./scripts/deploy.sh staging
