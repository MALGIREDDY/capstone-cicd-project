<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>CI/CD Capstone Project</title>

<style>
body {
    font-family: Arial, Helvetica, sans-serif;
    background-color: #0f172a;
    color: #e5e7eb;
    padding: 30px;
}
h1, h2, h3 {
    color: #38bdf8;
}
.section {
    background-color: #020617;
    padding: 25px;
    margin-bottom: 30px;
    border-radius: 8px;
    box-shadow: 0 10px 20px rgba(0,0,0,0.4);
}
pre {
    background: #020617;
    padding: 15px;
    border-left: 4px solid #22d3ee;
    overflow-x: auto;
}
ul li {
    margin-bottom: 8px;
}
hr {
    border: 1px solid #1e293b;
}
</style>
</head>

<body>

<h1>🚀 CI/CD Capstone Project</h1>

<p>
A fully automated <strong>CI/CD pipeline</strong> that builds, tests, scans, and deploys a
<strong>2-tier web application</strong> using <strong>Docker</strong> and <strong>GitHub Actions</strong>
with environment-specific deployments.
</p>

<hr>

<div class="section">
<h2>1. Project Overview</h2>

<h3>What does this project do?</h3>
<p>
This project implements a complete CI/CD workflow that automatically:
</p>
<ul>
    <li>Builds Docker images for frontend and backend</li>
    <li>Runs unit tests inside containers</li>
    <li>Scans images for vulnerabilities using Trivy</li>
    <li>Pushes images to Docker Hub</li>
    <li>Deploys the application automatically to a staging environment</li>
</ul>

<h3>Why is it useful?</h3>
<ul>
    <li>Eliminates manual deployments</li>
    <li>Improves release reliability</li>
    <li>Detects security issues early</li>
    <li>Demonstrates real-world DevOps practices</li>
</ul>
</div>

<hr>

<div class="section">
<h2>2. Application Architecture</h2>

<ul>
    <li><strong>Frontend</strong>: Static UI served using Nginx</li>
    <li><strong>Backend</strong>: Flask API with health endpoint</li>
    <li><strong>Database</strong>: PostgreSQL container</li>
    <li><strong>CI/CD</strong>: GitHub Actions</li>
    <li><strong>Registry</strong>: Docker Hub</li>
</ul>

<pre>
User
  ↓
Nginx (Frontend)
  ↓
Flask API (Backend)
  ↓
PostgreSQL Database

CI/CD:
GitHub → GitHub Actions → Docker → Trivy → Docker Hub → Staging Server
</pre>
</div>

<hr>

<div class="section">
<h2>3. Docker Implementation</h2>

<h3>Backend Dockerfile</h3>
<ul>
    <li>Multi-stage build</li>
    <li>Non-root user</li>
    <li>Minimal Python slim image</li>
</ul>

<h3>Frontend Dockerfile</h3>
<ul>
    <li>Nginx Alpine base image</li>
    <li>Optimized static file serving</li>
</ul>

<h3>Docker Compose</h3>
<pre>
docker-compose.dev.yml
docker-compose.staging.yml
docker-compose.prod.yml
</pre>
</div>

<hr>

<div class="section">
<h2>4. CI Pipeline (GitHub Actions)</h2>

<h3>Pipeline Stages</h3>
<ul>
    <li>Checkout source code</li>
    <li>Build backend & frontend images</li>
    <li>Run backend unit tests inside container</li>
    <li>Scan images using Trivy</li>
    <li>Push images to Docker Hub</li>
</ul>

<h3>Security Scanning</h3>
<p>
Trivy scans both frontend and backend images for HIGH and CRITICAL vulnerabilities.
</p>
</div>

<hr>

<div class="section">
<h2>5. CD Pipeline (Automated Deployment)</h2>

<h3>Deployment Trigger</h3>
<p>
Deployment starts automatically after CI succeeds.
</p>

<h3>Deployment Script</h3>
<pre>
./scripts/deploy.sh staging
</pre>

<h3>Deployment Steps</h3>
<ul>
    <li>Pull latest images</li>
    <li>Stop existing containers</li>
    <li>Start new containers</li>
    <li>Run database migrations</li>
    <li>Verify backend health</li>
</ul>
</div>

<hr>

<div class="section">
<h2>6. Environment-Specific Configuration</h2>

<ul>
    <li>Development – Local testing</li>
    <li>Staging – CI/CD deployment target</li>
    <li>Production – Ready for extension</li>
</ul>

<pre>
docker-compose.staging.yml
.env.staging
</pre>
</div>

<hr>

<div class="section">
<h2>7. Health Checks & Verification</h2>

<h3>Backend Health Endpoint</h3>
<pre>
curl http://localhost:5000/health
</pre>

<h3>Expected Output</h3>
<pre>
{"status":"UP"}
</pre>
</div>

<hr>

<div class="section">
<h2>8. Troubleshooting Guide</h2>

<ul>
    <li>Backend unreachable → Check ports and container logs</li>
    <li>Frontend not updating → Rebuild image with --no-cache</li>
    <li>Pipeline stuck → Verify runner availability</li>
    <li>Deployment fails → Run deploy script manually</li>
</ul>
</div>

<hr>

<div class="section">
<h2>9. Demo Walkthrough</h2>

<ol>
    <li>Push code to GitHub</li>
    <li>Show CI pipeline execution</li>
    <li>Show Docker Hub image update</li>
    <li>Show automated deployment</li>
    <li>Open frontend in browser</li>
    <li>Verify backend health endpoint</li>
</ol>
</div>

<hr>

<div class="section">
<h2>10. What I Learned</h2>

<ul>
    <li>End-to-end CI/CD automation</li>
    <li>Docker image optimization</li>
    <li>Security scanning with Trivy</li>
    <li>Infrastructure-as-Code</li>
    <li>Production-style deployment workflows</li>
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
