#!/bin/bash

# Fail fast with a concise message when not using bash
if [ -z "${BASH_VERSION:-}" ]
then
  echo "Aborting, bash is required to interpret this script."
  exit
fi

# Fail fast when directory is not writable

if ! [ -w `pwd` ]
then
  echo "Aborting, directory $PWD must be writable!"
  exit
fi


# Initialise script
bold=$(tput bold)
normal=$(tput sgr0)

# Parametersfile
ENV_FILE=.env

echo -e
echo "${bold}InfraSonar install script${normal}"
echo  "${bold}=========================${normal}"

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
  read -p "Enter ${bold}agentcore${normal} token:: " AGENTCORE_TOKEN
  read -p "Enter ${bold}agentcore zone ID [0] ${normal}, leave 0 if unsure: " AGENTCORE_ZONE_ID
  AGENTCORE_ZONE_ID=${AGENTCORE_ZONE_ID:-0}
  read -p "Enter ${bold}agent${normal} token: " AGENT_TOKEN
  echo Verify you entered the correct information:
  echo Agentcore token: ${bold}$AGENTCORE_TOKEN${normal}
  echo Agentcore zone: ${bold}$AGENTCORE_ZONE_ID${normal}
  echo Agent token: ${bold}$AGENT_TOKEN${normal}
  echo Is this information correct?
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
  echo "AGENTCORE_ZONE_ID=$AGENTCORE_ZONE_ID" >> $ENV_FILE
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
echo "Status should be: Up ... for all containers"
echo " Check our docs (https://docs.infrasonar.com) for more information"