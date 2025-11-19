# Déploiement du serveur MCP sur Railway

Ce guide explique comment déployer le serveur MCP sur Railway avec Docker.

## Prérequis

- Un compte Railway (https://railway.app)
- Une base PostgreSQL (Railway ou externe)

## Déploiement avec Docker (Recommandé)

### 1. Créer un nouveau projet Railway

1. Allez sur https://railway.app
2. Cliquez sur "New Project"
3. Sélectionnez "Deploy from GitHub repo"
4. Choisissez `Akilinoxx/aligneurs-mcp-server`

Railway détectera automatiquement le `Dockerfile` et construira l'image Docker.

### 2. Ajouter un service PostgreSQL (si nécessaire)

Si vous n'avez pas encore de base PostgreSQL sur Railway :

1. Dans votre projet, cliquez sur "+ New"
2. Sélectionnez "Database" → "PostgreSQL"
3. Railway créera automatiquement la base et injectera `DATABASE_URL`

### 3. Connecter à une base PostgreSQL existante

Si vous utilisez une base PostgreSQL externe (AWS, autre Railway, etc.) :

1. Dans votre service MCP, allez dans "Variables"
2. Ajoutez la variable `DATABASE_URL` :
   ```
   postgresql://user:password@host:port/database
   ```

### 4. Configuration automatique

Railway détectera automatiquement :
- `railway.json` - Configuration du build et déploiement
- `requirements.txt` - Dépendances Python
- `Procfile` - Commande de démarrage

### 5. Déploiement

Railway déploiera automatiquement le serveur MCP. Vous verrez les logs de déploiement.

## Variables d'environnement

Le serveur MCP nécessite uniquement :

- `DATABASE_URL` : URL de connexion PostgreSQL (injectée automatiquement si vous utilisez PostgreSQL Railway)

## Utilisation du serveur MCP déployé

Une fois déployé, le serveur MCP sera accessible via :

- **URL Railway** : Fournie dans les paramètres du service
- **MCP Protocol** : Le serveur écoute sur stdio (standard pour MCP)

## Configuration locale pour tester

Pour tester localement avant de déployer :

```bash
# Définir DATABASE_URL
export DATABASE_URL="postgresql://user:password@host:port/database"

# Installer les dépendances
pip install -r requirements.txt

# Lancer le serveur
python mcp_server.py
```

## Outils MCP disponibles

Le serveur expose 7 outils :

1. **query_sql** - Requêtes SQL personnalisées
2. **get_schema_info** - Schéma de la base
3. **get_activities_stats** - Statistiques générales
4. **get_activities_by_type** - Activités par type
5. **get_activities_by_dentist** - Activités par dentiste
6. **search_activities** - Recherche avec filtres
7. **get_patient_activities** - Activités d'un patient

## Connexion depuis Windsurf

Pour connecter Windsurf au serveur MCP déployé sur Railway, ajoutez dans votre configuration MCP :

```json
{
  "mcpServers": {
    "aligneurs": {
      "command": "python",
      "args": ["/path/to/mcp_server.py"],
      "env": {
        "DATABASE_URL": "postgresql://user:password@host:port/database"
      }
    }
  }
}
```

## Monitoring

Railway fournit :
- Logs en temps réel
- Métriques de performance
- Alertes de santé du service

## Support

Pour toute question, consultez :
- Documentation Railway : https://docs.railway.app
- Documentation MCP : https://modelcontextprotocol.io
