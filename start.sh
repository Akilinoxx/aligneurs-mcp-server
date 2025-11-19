#!/bin/bash
# Script de démarrage pour Railway
PORT=${PORT:-8000}
exec fastmcp run mcp_server.py --transport http --host 0.0.0.0 --port $PORT
