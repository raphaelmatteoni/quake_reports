#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /quake_reports/tmp/pids/server.pid

# Executa os comandos de criação e migração do banco de dados
bundle exec rails db:create db:migrate db:seed

# Inicia o servidor Rails
exec "$@"
