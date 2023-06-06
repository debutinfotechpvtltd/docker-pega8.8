import json
import os

# Path to the .env file
env_file = ".env"

# Load the environment variables from the .env file
with open(env_file, "r") as f:
    for line in f:
        # Skip empty lines and lines starting with '#'
        if line.strip() == "" or line.strip().startswith("#"):
            continue
        key, value = line.strip().split("=", 1)
        os.environ[key] = value

# Access the environment variables
db_username = os.getenv('DB_USERNAME')
hostname = os.getenv('HOSTNAME')
postgres_db = os.getenv('POSTGRES_DB')

print(db_username, hostname, postgres_db)

# Read the original JSON file
with open('/pgadmin4/servers.json', 'r') as file:
    data = json.load(file)

# Perform variable substitution
data['Servers']['1']['Username'] = os.environ.get('DB_USERNAME')
data['Servers']['1']['Host'] = os.environ.get('HOSTNAME')
data['Servers']['1']['MaintenanceDB'] = os.environ.get('POSTGRES_DB')

# Write the substituted JSON to a new file
with open('/pgadmin4/servers1.json', 'w') as file:
    json.dump(data, file, indent=2)
