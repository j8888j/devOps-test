# mongo and mongo express images

create-network:
	docker network create mongo-db

remove-network:
	docker network remove mongo-db

run-mongo:
	docker run \
	-d \
	--net mongo-db \
	-p 27017:27017 \
	--name mongo-db \
	-e MONGO_INITDB_ROOT_USERNAME=root \
	-e MONGO_INITDB_ROOT_PASSWORD=example \
	mongo

run-mongo-express:
	docker run \
	-d \
	--net mongo-db \
	-p 8081:8081 \
	--name mongo-ui \
	-e ME_CONFIG_MONGODB_ADMINUSERNAME=root \
	-e ME_CONFIG_MONGODB_ADMINPASSWORD=example \
	-e ME_CONFIG_MONGODB_URL=mongodb://root:example@mongo-db:27017/ \
	-e ME_CONFIG_BASICAUTH=false \
	mongo-express

stop-mongo:
	docker stop mongo-db
	docker stop mongo-ui

remove-mongo:
	docker rm mongo-db
	docker rm mongo-ui

# node app image

build-image:
	docker build --build-arg MICROSERVICE_PATH=./microservice1 -t node-app .

tag-image:
	docker tag node-app registry.digitalocean.com/node-app177771/node-app:latest

push-image:
	docker push registry.digitalocean.com/node-app177771/node-app:latest

remove-image:
	docker rmi node-app

run-image:
	docker run -d --name node-app -p 80:3000 node-app

run-registry-image:
	docker run -d --name node-app -p 80:3000 registry.digitalocean.com/node-app177771/node-app:latest

stop-container:
	docker stop node-app

remove-container:
	docker rm node-app

# docker compose

up-dev:
	docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d --build

up-prod:
	docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d

stop:
	docker-compose stop

down:
	docker-compose down
