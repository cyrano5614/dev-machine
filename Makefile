# NAME := $(shell grep '"name":' package.json | cut -d\" -f4 | sed -e 's/-/_/g')
# VERSION := $(shell grep '"version":' package.json | cut -d\" -f4)
BRANCH := $(shell git for-each-ref --format='%(objectname) %(refname:short)' refs/heads | awk "/^$$(git rev-parse HEAD)/ {print \$$2}")
HASH := $(shell git rev-parse HEAD)
DATETIME := $(shell date | sed 's/ /./g')
DEFAULT_TAG := $(shell git rev-parse --short HEAD)

DEFAULT_HOST := 0.0.0.0
DEFAULT_PORT := 9002
DEFAULT_ENV := dev
DEFAULT_WORKER := 1
DEFAULT_IMAGE := dev-machine
DEFAULT_PINO_ADDRESS := 127.0.0.1

HOST := $(or ${HOST},${DEFAULT_HOST})
PORT := $(or ${PORT},${DEFAULT_PORT})
ENV := $(or ${ENV},${DEFAULT_ENV})
WORKER := $(or ${WORKER},${DEFAULT_WORKER})
IMAGE := $(or ${IMAGE},${DEFAULT_IMAGE})
TAG := $(or ${TAG},${DEFAULT_TAG})
PINO_ADDRESS := $(or ${PINO_ADDRESS},${DEFAULT_PINO_ADDRESS})

SERVICE_MODULE := server
SERVICE_HANDLER := api

VENDOR_DIR := vendor

.PHONY: container-clean
container-clean:
	docker-compose -f docker/run-app.yaml stop && \
	docker-compose -f docker/run-app.yaml rm -f && \
	docker-compose -f docker/run-test.yaml stop && \
	docker-compose -f docker/run-test.yaml rm -f

.PHONY: clean
clean:
	rm -rf node_modules && \
	rm -rf package-lock.json

.PHONY: install
install: clean
	npm install

.PHONY: test
test:
	npm run test-unit && npm run test-integration

.PHONY: test-stack
test-stack: container-clean
	TAG=$(TAG) VERSION=$(VERSION) IMAGE=$(IMAGE) ENV=$(ENV) docker-compose -f docker/run-test.yaml run --service-ports analytics && \
	TAG=$(TAG) VERSION=$(VERSION) IMAGE=$(IMAGE) ENV=$(ENV) docker-compose -f docker/run-test.yaml stop && \
	TAG=$(TAG) VERSION=$(VERSION) IMAGE=$(IMAGE) ENV=$(ENV) docker-compose -f docker/run-test.yaml rm -f

.PHONY: build
build:
	TAG=$(TAG) VERSION=$(VERSION) IMAGE=$(IMAGE) ENV=$(ENV) scripts/build.sh

.PHONY: push
push:
	TAG=$(TAG) VERSION=$(VERSION) IMAGE=$(IMAGE) ENV=$(ENV) scripts/push.sh

.PHONY: tag
tag:
	TAG=$(TAG) VERSION=$(VERSION) IMAGE=$(IMAGE) ENV=$(ENV) scripts/tag.sh

.PHONY: start
start:
	TAG=$(TAG) scripts/run.sh

.PHONY: start-stack
start-stack: container-clean
	TAG=$(TAG) VERSION=$(VERSION) IMAGE=$(IMAGE) ENV=$(ENV) docker-compose -f docker/run-app.yaml up
	TAG=$(TAG) VERSION=$(VERSION) IMAGE=$(IMAGE) ENV=$(ENV) docker-compose -f docker/run-app.yaml stop && \
	TAG=$(TAG) VERSION=$(VERSION) IMAGE=$(IMAGE) ENV=$(ENV) docker-compose -f docker/run-app.yaml rm -f
