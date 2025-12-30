# ---------- Builder stage ----------
FROM python:3.10-slim AS builder

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python deps
COPY requirements.txt .
RUN pip install --user --no-cache-dir -r requirements.txt


# ---------- Runtime stage ----------
FROM python:3.10-slim

# Create non-root user
RUN useradd -m appuser

WORKDIR /app

# Copy installed Python packages from builder
COPY --from=builder /root/.local /home/appuser/.local

# Copy application files (IMPORTANT)
COPY app.py .
COPY test_app.py .

# Set PATH for user-installed packages
ENV PATH="/home/appuser/.local/bin:$PATH"

# Switch to non-root user
USER appuser

# Expose backend port
EXPOSE 5000

# Start backend
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]

