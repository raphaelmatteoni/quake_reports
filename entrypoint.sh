# entrypoint.sh
#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# Executa o script de inicialização
exec /usr/bin/init.sh "$@"
