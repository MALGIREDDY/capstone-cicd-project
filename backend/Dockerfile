FROM python:3.10-slim AS builder
WORKDIR /app
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*
COPY requirements.txt .
RUN pip install --user --no-cache-dir -r requirements.txt
FROM python:3.10-slim
RUN useradd -m appuser
WORKDIR /app
# Copy installed Python packages from builder
COPY --from=builder /root/.local /home/appuser/.local
COPY app.py .
ENV PATH="/home/appuser/.local/bin:$PATH"
ENV PYTHONUNBUFFERED=1
USER appuser
EXPOSE 5000
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
