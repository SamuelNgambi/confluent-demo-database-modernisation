#!/bin/bash

accounts_file=".accounts"
env_file=".env"

# Check if .accounts file exists
if [ ! -f "$accounts_file" ]; then
    echo "$accounts_file not found."
    exit 1
fi

# Define the environment variable content
env_content=$(cat <<EOF
CCLOUD_API_KEY=api-key
CCLOUD_API_SECRET=api-secret
CCLOUD_BOOTSTRAP_ENDPOINT=kafka-cluster-endpoint

ORACLE_USERNAME=admin
ORACLE_PASSWORD=db-mod-c0nflu3nt!
ORACLE_ENDPOINT=oracle-endpoint
ORACLE_PORT=1521

CLOUDAMQP_URL=cloudamqp-url
CLOUDAMQP_VIRTUAL_HOST=cloudamqp-vhost
CLOUDAMQP_PASSWORD=cloudamqp-password
CLOUDAMQP_ENDPOINT=cloudamqp-host

MONGO_USERNAME=admin
MONGO_PASSWORD=db-mod-c0nflu3nt!
MONGO_ENDPOINT=mongodb-endpoint
MONGO_DATABASE_NAME=demo-db-mod
EOF
)

# Combine the environment variable content with .accounts and write to .env
echo "$env_content" | cat - "$accounts_file" > "$env_file"

echo "Created an environment file named: $env_file"