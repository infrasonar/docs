#!/bin/bash

# Fail fast with a concise message when not using bash
if [ -z "${BASH_VERSION:-}" ]
then
  abort "Bash is required to interpret this script."
fi

# Initialise script
bold=$(tput bold)
normal=$(tput sgr0)

# Parametersfile
ENV_FILE=.env

echo -e
echo "${bold}InfraSonar install script${normal}"
echo        "========================="

function check_prerequiste_docker_compose {
  echo "--> Checking if docker compose is installed"
  docker compose version > /dev/null 2>&1
  if [ $? -eq 0 ]; then
      echo "Docker compose in installed"
  else
      echo "${bold}No docker compose found.${normal}"
      echo "Ensure docker compose is installed prior to executing this script"
      echo "See also: https://docs.docker.com/compose/install/"
      echo -e
      echo "Exiting script"
      exit
  fi
}


function check_for_env_file {
  # Check if we have a local .env file
  echo "--> Checking .env file existence"
  if [ -f "$ENV_FILE" ]; then
    echo "Existing token file found ($ENV_FILE)"
  else 
    echo "No local token file found."
    echo "Please enter the required tokens."
    ask_tokens
  fi
}

function ask_tokens {
  # Ask for tokens
  echo Enter ${bold}agentcore${normal} token:
  read AGENTCORE_TOKEN
  echo Enter ${bold}agent${normal} token:
  read AGENT_TOKEN
  echo Verify you entered the correct tokens:
  echo Agentcore token: ${bold}$AGENTCORE_TOKEN${normal}
  echo Agent token: ${bold}$AGENT_TOKEN${normal}
  echo Are these tokens correct?
  select yn in "Yes" "No"; do
    case $yn in
        Yes ) save_env_file; break;;
        No ) ask_tokens;;
    esac
done
}

function save_env_file {
  # save tokens to disk
  echo "--> Saving tokens to disk"
  echo "AGENTCORE_TOKEN=$AGENTCORE_TOKEN" > $ENV_FILE
  echo "AGENT_TOKEN=$AGENT_TOKEN" >> $ENV_FILE
}

function check_for_docker_compose_file {
  # Check if we have a local .env file
  echo "--> Checking dokcer-compose.yml file existence"
  if [ -f "./docker-compose.yml" ]; then
    echo "Existing docker compose file found."
    exit
  else 
    echo "docker-compose.yml file not found."
    download_latest_docker_compose_file
  fi
}

function download_latest_docker_compose_file {
  # This downloads and overwrites the docker-compose file
  echo "--> Downloading latest docker-compose.yml file"
  curl -s -o docker-compose.yml https://docs.infrasonar.com/collectors/probes/appliance/docker-compose.yml
}

# Check if docker compose is installed
check_prerequiste_docker_compose
# Check if we have an environment file, if not create one.
check_for_env_file
# Check if we have a docker compose file, is not download the latest.
check_for_docker_compose_file
# Pull the docker containers
echo "--> Pulling InfraSonar containers"
docker compose pull
echo "--> Starting InfraSonar containers"
docker compose up -d 
echo "--> Ready"
docker compose ps
echo "Status should be: Up Less than a second for all containers"
echo " Check our docs (https://docs.infrasonar.com) for more information"

