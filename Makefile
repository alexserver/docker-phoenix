# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

up: ## Install the container stack
	docker-compose up

db: ## Start the DB container
	docker-compose up -d db

phoenix: ## Start the Phoenix container
	docker-compose up -d phoenix

shell: ## Enter the container Terminal
	docker exec -it phoenix bash