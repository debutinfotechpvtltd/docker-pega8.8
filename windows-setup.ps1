# Build and start the containers
docker-compose up -d --build pega-postgres

#Build and start the Installer Container
docker-compose up -d --build pega-installer

# Wait for the installer container to finish installation and print "build success" message
$containerLogs = docker-compose logs -f pega-installer
while (-not ($containerLogs.Contains("BUILD SUCCESSFUL"))) {
    $containerLogs = docker-compose logs -f pega-installer
    Start-Sleep -Seconds 1
}

# Wait for the installer container to terminate
docker wait pega-installer

# Continue with other operations or starting the remaining containers(Start Web container)
docker-compose up -d --build pega-web  
