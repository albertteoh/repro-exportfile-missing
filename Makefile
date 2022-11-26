.PHONY: build
build:
	docker build -t main .

.PHONY: run
run: build
	docker run main
