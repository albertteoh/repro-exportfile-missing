.PHONY: build
build:
	DOCKER_BUILDKIT=1 docker build -t main .

.PHONY: run
run: build
	docker run main
