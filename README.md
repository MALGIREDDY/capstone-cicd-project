<h1>Capstone Project: Fully Automated CI/CD Pipeline</h1>
<p><strong>Docker • GitHub Actions • DevOps • CI/CD Automation</strong></p>

<hr>

<!-- =============================== -->
<div class="section">
<h2>A. Project Overview</h2>

<h3>1. What does this project do?</h3>
<p>
This project implements a <strong>complete, end-to-end CI/CD system</strong> that automatically
<strong>tests, builds, scans, and deploys</strong> a <strong>2-tier web application</strong>
through a <strong>staging environment</strong> using <strong>Docker and GitHub Actions</strong>.
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
This project demonstrates <strong>real-world DevOps automation</strong> used in enterprise environments.
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
<h2>B. Core Components </h2>

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
│   │   ├── styles.css
│   │   └── app.js
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
<h2>K. Key Deliverables (Trainer Checklist)</h2>

<ul>
<li> Working web application with database</li>
<li>Optimized Docker images</li>
<li>Fully automated CI/CD pipeline</li>
<li>Staging deployment scripts</li>
<li>Shell scripts for automation</li>
<li>Security scanning</li>
</ul>
</div>

<!-- =============================== -->
<div class="section">
<h2>L. Learning Outcomes</h2>

<ul>
<li>CI/CD pipeline design</li>
<li>Docker best practices</li>
<li>Security scanning with Trivy</li>
<li>Environment-based deployments</li>
<li>Production-grade DevOps workflows</li>
</ul>
</div>

<hr>

<h2>Author</h2>
<p>
<strong>Saideep Malgireddy</strong><br>
GitHub: <a href="https://github.com/MALGIREDDY">https://github.com/MALGIREDDY</a>
</p>

</body>
</html>
