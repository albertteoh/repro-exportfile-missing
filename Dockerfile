FROM golang:1.19-buster

RUN echo "deb http://deb.debian.org/debian stretch main" >> /etc/apt/sources.list
RUN apt-get update \
  && apt-get install -y -q --no-install-recommends \
    libproj-dev=4.9.3-1 \
  && rm -rf /var/lib/apt/lists/*

ADD . /workdir/
WORKDIR /workdir

RUN go build -o main

RUN go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.50.1
RUN golangci-lint --version

RUN golangci-lint run || echo "Linter failed"

ENTRYPOINT ["/workdir/main"]
