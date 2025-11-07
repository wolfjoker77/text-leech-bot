# Use official lightweight Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy all project files
COPY . .

# Install system dependencies (for yt-dlp, ffmpeg, etc.)
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg aria2 gcc libffi-dev && \
    pip install --no-cache-dir -r requirements.txt && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Ensure Python outputs are shown immediately (no buffering)
ENV PYTHONUNBUFFERED=1

# Set Python path (fixes ModuleNotFoundError issues)
ENV PYTHONPATH=/app

# Default command to run the bot
CMD ["python3", "-m", "modules.main"]
