#!/bin/bash

# Executa os comandos de criação e migração do banco de dados
bundle exec rails db:create db:migrate db:seed

# Inicia o servidor Rails
exec "$@"
