#!/bin/zsh

env_file_path="./.env"
env_example_file_path="./.env.example"

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