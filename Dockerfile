FROM python:3.11-slim

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers de dépendances
COPY requirements.txt .

# Installer les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Copier le code du serveur MCP
COPY mcp_server.py .

# Exposer le port pour HTTP/SSE
EXPOSE 8000

# Railway injecte automatiquement la variable PORT
ENV PORT=8000

# Commande de démarrage
CMD ["python", "mcp_server.py"]
