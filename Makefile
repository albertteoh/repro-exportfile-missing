.PHONY: build
build:
	DOCKER_BUILDKIT=1 docker build -t main .

.PHONY: run
run: build
	docker run main

.PHONY: lint-v1.43
lint-v1.43:
	@docker run --rm -it \
	-v $$(pwd):/app \
	-w /app \
	golangci/golangci-lint:v1.43-alpine \
	sh -c "golangci-lint run" || echo "Linter failed"

.PHONY: lint-v1.44
lint-v1.44:
	@docker run --rm -it \
	-v $$(pwd):/app \
	-w /app \
	golangci/golangci-lint:v1.44-alpine \
	sh -c "golangci-lint run" || echo "Linter failed"
