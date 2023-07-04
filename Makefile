#!/usr/bin/make -f

IMAGE_REPO_BASE=skpr/mysql
IMAGE_REPO_EMPTY=skpr/mysql-empty
ARCH=amd64

build:
		$(eval IMAGE=${IMAGE_REPO_BASE}:8.x-${VERSION_TAG})
		docker build -t ${IMAGE}-${ARCH} mysql/
		$(eval IMAGE=${IMAGE_REPO_EMPTY}:8.x-${VERSION_TAG})
		docker build -t ${IMAGE}-${ARCH} empty/

push:
		docker push ${IMAGE_REPO_BASE}:8.x-${VERSION_TAG}-${ARCH}
		docker push ${IMAGE_REPO_EMPTY}:8.x-${VERSION_TAG}-${ARCH}

manifest:
		$(eval IMAGE=${IMAGE_REPO_BASE}:8.x-${VERSION_TAG})
		docker manifest create ${IMAGE} --amend ${IMAGE}-arm64 --amend ${IMAGE}-amd64
		docker manifest push ${IMAGE}
		$(eval IMAGE=${IMAGE_REPO_EMPTY}:8.x-${VERSION_TAG})
		docker manifest create ${IMAGE} --amend ${IMAGE}-arm64 --amend ${IMAGE}-amd64
		docker manifest push ${IMAGE}

.PHONY: *
