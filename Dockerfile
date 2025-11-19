FROM python:3.11-slim

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers de dépendances
COPY requirements.txt .

# Installer les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Copier le code du serveur MCP
COPY mcp_server.py .

# Exposer le port (optionnel pour MCP stdio)
EXPOSE 8000

# Commande de démarrage
CMD ["python", "mcp_server.py"]
