#!/bin/zsh

env_file_path="./.env"
env_example_file_path="./.env.example"
hosts_file_path="/etc/hosts"

if [ -f "$env_file_path" ]; then
    echo "Environment file already exists."
else

  if [ -f "$env_example_file_path" ]; then
    cp .env.example .env
    echo "Environment file created."
  else
    echo "Example environment file is missing."
  fi

fi

if [ -f "$hosts_file_path" ]; then
    echo "127.0.0.1       staging.ci-workflow.test production.ci-workflow.test" >> $hosts_file_path
fi

