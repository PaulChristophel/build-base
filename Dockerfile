# Create the base build image
FROM --platform=amd64 node:24.9.0-alpine3.22 AS base-node-musl
RUN npm install -g pnpm
FROM --platform=amd64 golang:1.25.2-alpine3.22 AS musl
COPY --from=base-node-musl /usr/local /usr/local
WORKDIR /usr/src/app
RUN apk upgrade --update --no-cache
RUN apk add --update --no-cache make tzdata ca-certificates build-base golangci-lint git
RUN go install github.com/swaggo/swag/cmd/swag@latest

# Create the base build image
FROM --platform=amd64 node:24.9.0-bookworm AS base-node-glibc
RUN npm install -g pnpm
FROM --platform=amd64 golang:1.25.2-bookworm AS glibc
COPY --from=base-node-glibc /usr/local /usr/local
WORKDIR /usr/src/app
ENV DEBIAN_FRONTEND=noninteractive
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1
RUN apt update && apt upgrade -y && apt install -y curl git make tzdata ca-certificates build-essential && curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v2.5.0
RUN go install github.com/swaggo/swag/cmd/swag@latest
