#!/usr/bin/make -f

IMAGE_REPO_BASE=skpr/mysql
IMAGE_REPO_EMPTY=skpr/mysql-empty
VERSION_TAG=v1-latest
ARCH=amd64

build:
		$(eval IMAGE=${IMAGE_REPO_BASE}:${MYSQL_VERSION}-${VERSION_TAG}-${ARCH})
		docker build -t ${IMAGE} ${MYSQL_VERSION}

		$(eval IMAGE=${IMAGE_REPO_EMPTY}:${MYSQL_VERSION}-${VERSION_TAG}-${ARCH})
		docker build --build-arg FROM_IMAGE=${REGISTRY_BASE}:${MYSQL_VERSION}-${VERSION_TAG}-${ARCH} -t ${IMAGE} ${MYSQL_VERSION}-empty

push:
		docker push ${IMAGE_REPO_BASE}:${MYSQL_VERSION}-${VERSION_TAG}-${ARCH}
		docker push ${IMAGE_REPO_EMPTY}:${MYSQL_VERSION}-empty-${VERSION_TAG}-${ARCH}

manifest:
		$(eval IMAGE=${IMAGE_REPO_BASE}:${MYSQL_VERSION}-${VERSION_TAG})
		docker manifest create ${IMAGE} --amend ${IMAGE}-arm64 --amend ${IMAGE}-amd64
		docker manifest push ${IMAGE}
		$(eval IMAGE=${IMAGE_REPO_EMPTY}:${MYSQL_VERSION}-empty-${VERSION_TAG})
		docker manifest create ${IMAGE} --amend ${IMAGE}-arm64 --amend ${IMAGE}-amd64
		docker manifest push ${IMAGE}

.PHONY: *
