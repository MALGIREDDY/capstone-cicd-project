<h1>Capstone Project : Fully Automated CI/CD Pipeline</h1>
<p><strong>Docker • GitHub Actions • DevOps • CI/CD Automation</strong></p>

<hr>

<!-- =============================== -->
<div class="section">
<h2>A. Project Overview</h2>

<h3>1. What does this project do?</h3>
<p>
This project implements a complete, end-to-end CI/CD system that automatically
tests, builds, scans, and deploys a 2-tier web application
through a staging environment using Docker and GitHub Actions.
</p>
<p>The CI/CD pipeline performs the following actions automatically on every push:</p>
<ul>
<li>Builds Docker images for frontend and backend</li>
<li>Runs unit tests inside containers</li>
<li>Scans container images using Trivy</li>
<li>Tags and pushes images to Docker Hub</li>
<li>Deploys the application to a staging server</li>
<li>Runs database migrations</li>
<li>Verifies deployment using health checks</li>
</ul>

<h3>2. Why is this project important?</h3>
<p>
Manual deployments are slow, risky, and error-prone.
This project demonstrates real-world DevOps automation used in enterprise environments.
</p>

<p>
It proves understanding of:
</p>
<ul>
<li>CI/CD pipelines</li>
<li>Containerization</li>
<li>Infrastructure automation</li>
<li>Security scanning</li>
<li>Environment-specific deployments</li>
</ul>
</div>

<!-- =============================== -->
<div class="section">
<h2>B. Core Components</h2>

<ul>
<li> 2-tier web application (Frontend + Backend)</li>
<li> Dockerfiles with best practices</li>
<li> Multi-stage builds</li>
<li> Non-root containers</li>
<li> Docker Compose for local development</li>
<li> GitHub Actions CI/CD pipeline</li>
<li> Trivy security scanning</li>
<li> Automated staging deployment</li>
<li> Deployment scripts</li>
<li> Health verification</li>
<li> Professional documentation</li>
</ul>
</div>

<!-- =============================== -->
<div class="section">
<h2>C. Application Architecture</h2>

<h3>1. High-Level Architecture Diagram</h3>
<pre>
User Browser
     |
     v
Frontend (NGINX :80)
     |
     v
Backend (Flask + Gunicorn :5000)
     |
     v
PostgreSQL Database
</pre>

<h3>2. Container Architecture</h3>
<pre>
+----------------------+
| capstone-frontend    |
| NGINX                |
| Port: 80             |
+----------------------+

+----------------------+
| capstone-backend     |
| Flask + Gunicorn     |
| Port: 5000           |
+----------------------+

+----------------------+
| capstone-db          |
| PostgreSQL           |
| Port: 5432           |
+----------------------+
</pre>
</div>

<!-- =============================== -->
<div class="section">
<h2>D. Project Folder Structure</h2>

<pre>
capstone-project/
│
├── backend/
│   ├── app.py
│   ├── requirements.txt
│   ├── Dockerfile
│   └── tests/
│       └── test_app.py
│
├── frontend/
│   ├── src/
│   │   ├── index.html
│   ├── nginx.conf
│   └── Dockerfile
│
├── scripts/
│   ├── deploy.sh
│   ├── migrate_db.sh
│   └── health_check.sh
│
├── docker-compose.dev.yml
├── docker-compose.staging.yml
├── docker-compose.prod.yml
│
├── .github/workflows/
│   └── ci-cd.yml
│
└── README.md
</pre>
</div>

<!-- =============================== -->
<div class="section">
<h2>E. Docker Implementation </h2>

<h3>Backend Dockerfile</h3>
<ul>
<li>Multi-stage build to reduce image size</li>
<li>Non-root user for security</li>
<li>Minimal base image (python:slim)</li>
<li>Layer caching using requirements.txt</li>
</ul>

<h3>Frontend Dockerfile</h3>
<ul>
<li>Lightweight NGINX alpine image</li>
<li>Static content served efficiently</li>
<li>Custom NGINX configuration</li>
</ul>
</div>

<!-- =============================== -->
<div class="section">
<h2>F. Docker Compose (Local & Staging)</h2>

<h3>Features</h3>
<ul>
<li>Application services (frontend, backend)</li>
<li>PostgreSQL database</li>
<li>Custom Docker network</li>
<li>Volume mounts for database persistence</li>
<li>Environment-specific configuration files</li>
</ul>

<h3>Example Command</h3>
<pre>
docker compose -f docker-compose.staging.yml up -d
</pre>
</div>

<!-- =============================== -->
<div class="section">
<h2>G. CI/CD Pipeline (GitHub Actions)</h2>

<h3>CI Stage</h3>
<ul>
<li>Checkout source code</li>
<li>Build backend image</li>
<li>Run backend unit tests</li>
<li>Scan backend image with Trivy</li>
<li>Build frontend image</li>
<li>Scan frontend image with Trivy</li>
<li>Push images to Docker Hub</li>
</ul>

<h3>CD Stage</h3>
<ul>
<li>Triggered automatically after CI success</li>
<li>Deploys to staging server</li>
<li>Uses self-hosted GitHub runner</li>
</ul>
</div>

<!-- =============================== -->
<div class="section">
<h2>H. Deployment Automation</h2>

<h3>Deployment Script Responsibilities</h3>
<ul>
<li>Pull latest images</li>
<li>Stop old containers</li>
<li>Start new containers</li>
<li>Run database migrations</li>
<li>Verify application health</li>
</ul>

<h3>Command</h3>
<pre>
./scripts/deploy.sh staging
</pre>
</div>

<!-- =============================== -->
<div class="section">
<h2>I. Health Check & Verification</h2>

<h3>Backend Health Endpoint</h3>
<pre>
curl http://localhost:5000/health
</pre>

<h3>Expected Output</h3>
<pre>
{ "status": "UP" }
</pre>

<h2> Deployment & Runtime Screenshots</h2>

<h3> CI/CD Deployment Successful</h3>
<p>
This screenshot confirms that the GitHub Actions pipeline completed CI and CD successfully.
</p>
<img src="screenshots/deploy%20screenshot.png" alt="Deployment Screenshot" width="800">

<h3>Frontend Running (http://localhost)</h3>
<p>
This confirms the frontend container is running and serving the UI via NGINX on port 80.
</p>
<img src="screenshots/local%20host%20succesfully%20output.png" alt="Frontend Output" width="800">

<h3> Backend Health Endpoint (http://localhost:5000)</h3>
<p>
This confirms the backend Flask service is running and reachable.
</p>
<img src="screenshots/local%20host%205000%20.png" alt="Backend Output" width="800">

<h3> Backend Health Check Verification</h3>
<p>
Final confirmation that backend status is <strong>UP</strong>.
</p>
<img src="screenshots/local%20host%20health%20check.png" alt="Health Check" width="800">
</div>

<hr>


<p>Deployment is marked successful only after health check passes.</p>
</div>

<!-- =============================== -->
<div class="section">
<h2>J. Troubleshooting Guide</h2>

<ul>
<li><strong>Backend unreachable:</strong> Check backend container logs</li>
<li><strong>Frontend not loading:</strong> Verify NGINX configuration</li>
<li><strong>CI failure:</strong> Inspect GitHub Actions logs</li>
<li><strong>CD stuck:</strong> Ensure self-hosted runner is online</li>
<li><strong>DB errors:</strong> Verify migrations</li>
</ul>
</div>

<!-- =============================== -->
<div class="section">
<!-- =============================== -->
<div class="section">
<h2>K. CI/CD Pipeline Flow Diagram</h2>

<p>
This diagram represents the complete CI/CD flow executed automatically using
GitHub Actions and a self-hosted runner.
</p>
<pre>
Developer Push (GitHub)
        |
        v
GitHub Actions CI Trigger
        |
        v
Checkout Source Code
        |
        v
Build Backend Docker Image
        |
        v
Run Backend Unit Tests
        |
        v
Trivy Security Scan (Backend)
        |
        v
Build Frontend Docker Image
        |
        v
Trivy Security Scan (Frontend)
        |
        v
Push Images to Docker Hub
        |
        v
CD Stage Trigger
        |
        v
Self-Hosted Runner (Server)
        |
        v
Deploy to Staging Environment
        |
        v
Run Database Migrations
        |
        v
Health Check Verification
        |
        v
Deployment Success 
</pre>
<p>
This flow ensures that only secure, tested, and verified images
are deployed to the target environment.
</p>
</div>

<!-- =============================== -->
<div class="section">
<h2>L. Deployment Runbook</h2>

<p>
This runbook defines the exact operational steps required to deploy,
verify, and troubleshoot the application in a real-world environment.
</p>

<h3>1. Prerequisites</h3>
<ul>
<li>Docker & Docker Compose installed</li>
<li>Self-hosted GitHub Actions runner running</li>
<li>Docker Hub credentials configured</li>
<li>Server ports 80, 5000, and 5432 available</li>
</ul>

<h3>2. Triggering a Deployment</h3>
<p>
A deployment is triggered automatically when code is pushed to the configured branch:
</p>

<pre>
git add .
git commit -m "Deploy latest changes"
git push origin main
</pre>

<h3>3. What Happens Automatically</h3>
<ol>
<li>GitHub Actions CI pipeline starts</li>
<li>Docker images are built and tested</li>
<li>Images are scanned using Trivy</li>
<li>Images are pushed to Docker Hub</li>
<li>Self-hosted runner pulls latest images</li>
<li>Old containers are stopped</li>
<li>New containers are started</li>
<li>Database migrations are applied</li>
<li>Backend health is verified</li>
</ol>

<h3>4. Manual Deployment (Fallback)</h3>
<p>
If automation fails, deployment can be executed manually:
</p>

<pre>
docker compose -f docker-compose.staging.yml pull
docker compose -f docker-compose.staging.yml down
docker compose -f docker-compose.staging.yml up -d
</pre>

<h3>5. Post-Deployment Verification</h3>

<p>Frontend verification:</p>
<pre>
http://localhost
</pre>

<p>Backend health verification:</p>
<pre>
curl http://localhost:5000/health
</pre>

<p><strong>Expected Output:</strong></p>
<pre>
{ "status": "UP" }
</pre>

<h3>6. Rollback Strategy</h3>
<p>
If deployment fails:
</p>
<ul>
<li>Stop current containers</li>
<li>Re-deploy last known stable image tags</li>
<li>Verify health endpoint</li>
</ul>

<p>
This ensures <strong>safe recovery</strong> without downtime.
</p>
</div>


<hr>

<div class="section">
<h2>M. CI/CD Commands & Execution Flow</h2>

<p>
This section documents all commands used during development, CI, and CD
so that the complete automation flow is clearly understood.
</p>

<h3>1. Manual Docker Build Commands (Local Development)</h3>

<p>These commands were used during local testing before automation:</p>

<pre>
docker build --no-cache -t dinnusaideep/capstone-frontend:latest ./frontend
docker build --no-cache -t dinnusaideep/capstone-backend:latest ./backend
</pre>

<p>
The <code>--no-cache</code> flag ensures that the image is rebuilt from scratch,
preventing stale layers.
</p>

<h3>2. Docker Image Push to Registry (Docker Hub)</h3>

<p>After successful build, images are pushed to Docker Hub:</p>

<pre>
docker push dinnusaideep/capstone-frontend:latest
docker push dinnusaideep/capstone-backend:latest
</pre>

<p>
These images are later pulled automatically during deployment.
</p>

<h3>3. Deployment Script Execution (Staging)</h3>

<p>The following command deploys the application to the staging environment:</p>

<pre>
./scripts/deploy.sh staging
</pre>

<p>This script performs:</p>
<ul>
<li>Pulls latest images from Docker Hub</li>
<li>Stops old containers</li>
<li>Starts new containers</li>
<li>Runs database migrations</li>
<li>Verifies deployment using health checks</li>
</ul>

<h3>4. Script Permissions Setup</h3>

<p>Execution permissions were added using:</p>

<pre>
chmod +x scripts/deploy.sh
chmod +x scripts/health_check.sh
chmod +x scripts/migrate_db.sh
</pre>

<h3>5. Health Verification Commands</h3>

<p>Backend health is verified using:</p>

<pre>
curl http://localhost:5000/health
</pre>

<p>Expected Output:</p>
<pre>
{ "status": "UP" }
</pre>
</div>

<hr>

<div class="section">
<h2>N. CI/CD Pipeline Stages </h2>

<h3>Continuous Integration (CI)</h3>
<ul>
<li>Build Docker images</li>
<li>Run unit tests inside containers</li>
<li>Scan images using Trivy</li>
<li>Tag images</li>
<li>Push images to Docker Hub</li>
</ul>

<h3>Continuous Deployment (CD)</h3>
<ul>
<li>Triggered automatically after CI success</li>
<li>Pulls latest images</li>
<li>Stops existing containers</li>
<li>Starts new containers</li>
<li>Runs database migrations</li>
<li>Performs health checks</li>
</ul>
</div>

<hr>

<div class="section">
<h2>O. Environment-Specific Configuration</h2>

<p>
This project uses separate Docker Compose files for each environment:
</p>

<ul>
<li><strong>docker-compose.dev.yml</strong> – Development</li>
<li><strong>docker-compose.staging.yml</strong> – Staging (CI/CD target)</li>
<li><strong>docker-compose.prod.yml</strong> – Production-ready</li>
</ul>

<p>
This ensures environment isolation and configuration safety.
</p>

<h3>Staging Deployment Example</h3>

<pre>
docker compose -f docker-compose.staging.yml pull
docker compose -f docker-compose.staging.yml down
docker compose -f docker-compose.staging.yml up -d
</pre>
</div>

<hr>

<div class="section">
<h2>P. Deployment Script Responsibilities </h2>

<p>The deployment script guarantees safe rollout by performing the following steps:</p>

<ol>
<li>Pull latest Docker images</li>
<li>Stop old containers gracefully</li>
<li>Start new containers</li>
<li>Apply database migrations</li>
<li>Verify backend health</li>
<li>Mark deployment as successful</li>
</ol>
</div>
<h2>Author</h2>
<p>
<strong>Saideep Malgireddy</strong><br>
GitHub: <a href="https://github.com/MALGIREDDY">https://github.com/MALGIREDDY</a>
</p>

</body>
</html>

