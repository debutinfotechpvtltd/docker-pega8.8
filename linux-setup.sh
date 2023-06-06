#!/bin/bash

# Build and start the postgres containers
docker-compose up -d --build pega-postgres

#Build and start the pgadmin Container
docker-compose up -d --build pg-admin


# Build and start the Installer containers
docker-compose up -d --build pega-installer

# Wait for the installer container to finish installation and print "BUILD SUCCESSFUL" message
docker-compose logs -f pega-installer | while IFS= read -r line; do
  echo "$line"
  if [[ "$line" == *"BUILD SUCCESSFUL"* ]]; then
    break
  fi
done

# Wait for the installer container to terminate
docker wait pega-installer



docker-compose up -d --build pega-web
# Continue with other operations or starting the remaining containers
