# Nutzen Sie ein stabiles, schlankes Basis-Image
FROM python:3.12-slim

# Verhindert, dass Python pyc-Dateien schreibt und puffert
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Arbeitsverzeichnis im Container festlegen
WORKDIR /workspace

# System-Abhängigkeiten minimieren (nur falls Git/SSH benötigt wird)
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    && rm -rf /var/lib/apt/lists/*

# Pip aktualisieren
RUN pip install --no-cache-dir --upgrade pip

