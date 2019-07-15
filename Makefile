.PHONY: test

COMPOSE_PROJECT_NAME=app

COMPOSE_FILE?=docker-compose.yml

COMPOSE=docker-compose -f $(COMPOSE_FILE)

build:
	$(COMPOSE) build

up:
	$(COMPOSE) pull
	$(COMPOSE) up -d

down:
	$(COMPOSE) down

clean:
	$(COMPOSE) kill
	$(COMPOSE) rm --force

shell:
	docker exec -it $(COMPOSE_PROJECT_NAME)_$(COMPOSE_PROJECT_NAME)_1 /bin/sh

init: build up shell

logs:
	docker logs -f $(COMPOSE_PROJECT_NAME)_$(COMPOSE_PROJECT_NAME)_1

test:
	docker exec $(COMPOSE_PROJECT_NAME)_$(COMPOSE_PROJECT_NAME)_1 mix test --trace