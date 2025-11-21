# Intégration avec Dust.tt

Ce serveur MCP est configuré pour fonctionner avec Dust via le transport HTTP.

## URL du serveur

Une fois déployé sur Railway, votre serveur MCP sera accessible à :

```
https://votre-service.up.railway.app/mcp
```

## Configuration dans Dust

1. Allez dans Dust.tt
2. Ajoutez un nouveau MCP server
3. Configurez le transport :
   - **Type** : HTTP
   - **URL** : `https://votre-service.up.railway.app/mcp`

## Endpoints disponibles

- `GET /` - Health check
- `POST /message` - Endpoint principal pour les requêtes MCP via SSE
- `GET /sse` - Stream SSE pour les événements

## Variables d'environnement Railway

Assurez-vous que ces variables sont configurées :

- `DATABASE_URL` : URL de connexion PostgreSQL
- `PORT` : Port d'écoute (Railway l'injecte automatiquement)

## Test de l'endpoint

```bash
curl https://votre-service.up.railway.app/
```

Devrait retourner un statut 200 avec les informations du serveur MCP.

## Outils MCP disponibles via Dust

1. **query_sql** - Requêtes SQL personnalisées
2. **get_schema_info** - Schéma de la base
3. **get_activities_stats** - Statistiques générales
4. **get_activities_by_type** - Activités par type
5. **get_activities_by_dentist** - Activités par dentiste
6. **search_activities** - Recherche avec filtres
7. **get_patient_activities** - Activités d'un patient

## Exemple d'utilisation dans Dust

Une fois connecté, vous pourrez demander à Dust :

- "Combien d'activités avons-nous ?"
- "Montre-moi les activités du patient 123"
- "Quels sont les dentistes les plus actifs ?"
- "Exécute cette requête SQL : SELECT COUNT(*) FROM activities WHERE activity_type = 'LAB_SENT_AF_SETUP'"
