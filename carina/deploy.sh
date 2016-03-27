docker-compose --file docker-compose-farm.yml build
docker-compose --file docker-compose-farm.yml up -d
docker port pythonwebapp_lb 80
