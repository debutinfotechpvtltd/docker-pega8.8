# Build and start the containers
docker-compose up -d --build pega-postgres

#Build and start the Installer Container
docker-compose up -d --build pega-installer

# Wait for the installer container to finish installation and print "build success" message
$buildSuccess = $false

# Wait for the installer container to finish installation and print "BUILD SUCCESSFUL" message
while (-not $buildSuccess) {
    $containerLogs = docker-compose logs pega-installer --tail=10  # Fetch last 10 lines of logs

    # Print the logs to the console
    Write-Host $containerLogs

    if ($containerLogs -match "BUILD SUCCESSFUL") {
        $buildSuccess = $true
        
        }

    if (-not $buildSuccess) {
        Start-Sleep -Seconds 1
    }
}

# Wait for the installer container to exit
$exitCode = docker wait pega-installer

# Continue with other operations or starting the remaining containers (Start Web container)

if ($exitCode -eq 0) {
    # Start the remaining containers (Start Web container)
   docker-compose up -d --build pega-web
} else {
    Write-Host "Installer container failed with exit code: $exitCode"
}
