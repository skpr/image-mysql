#!/usr/bin/make -f

IMAGE_REPO_BASE=skpr/mysql
IMAGE_REPO_EMPTY=skpr/mysql-empty
IMAGE_REPO_DUMP=skpr/mysql-dump
IMAGE_REPO_IMPORT=skpr/mysql-import
VERSION_TAG=v3-latest
ARCH=amd64

build:
		$(eval IMAGE=${IMAGE_REPO_BASE}:8.x-${VERSION_TAG})
		docker build --pull -t ${IMAGE}-${ARCH} mysql/
		container-structure-test test --image ${IMAGE}-${ARCH} --config mysql/tests.yml
		$(eval IMAGE=${IMAGE_REPO_EMPTY}:8.x-${VERSION_TAG})
		docker build -t ${IMAGE}-${ARCH} --build-arg FROM_IMAGE=${IMAGE_REPO_BASE}:8.x-${VERSION_TAG}-${ARCH} empty/
		$(eval IMAGE=${IMAGE_REPO_DUMP}:8.x-${VERSION_TAG})
		docker build -t ${IMAGE}-${ARCH} --build-arg FROM_IMAGE=${IMAGE_REPO_BASE}:8.x-${VERSION_TAG}-${ARCH} dump/
		$(eval IMAGE=${IMAGE_REPO_IMPORT}:8.x-${VERSION_TAG})
		docker build -t ${IMAGE}-${ARCH} --build-arg FROM_IMAGE=${IMAGE_REPO_BASE}:8.x-${VERSION_TAG}-${ARCH} import/

push:
		docker push ${IMAGE_REPO_BASE}:8.x-${VERSION_TAG}-${ARCH}
		docker push ${IMAGE_REPO_EMPTY}:8.x-${VERSION_TAG}-${ARCH}
		docker push ${IMAGE_REPO_DUMP}:8.x-${VERSION_TAG}-${ARCH}
		docker push ${IMAGE_REPO_IMPORT}:8.x-${VERSION_TAG}-${ARCH}

manifest:
		$(eval IMAGE=${IMAGE_REPO_BASE}:8.x-${VERSION_TAG})
		docker manifest create ${IMAGE} --amend ${IMAGE}-arm64 --amend ${IMAGE}-amd64
		docker manifest push ${IMAGE}
		$(eval IMAGE=${IMAGE_REPO_EMPTY}:8.x-${VERSION_TAG})
		docker manifest create ${IMAGE} --amend ${IMAGE}-arm64 --amend ${IMAGE}-amd64
		docker manifest push ${IMAGE}
		$(eval IMAGE=${IMAGE_REPO_DUMP}:8.x-${VERSION_TAG})
		docker manifest create ${IMAGE} --amend ${IMAGE}-arm64 --amend ${IMAGE}-amd64
		docker manifest push ${IMAGE}
		$(eval IMAGE=${IMAGE_REPO_IMPORT}:8.x-${VERSION_TAG})
		docker manifest create ${IMAGE} --amend ${IMAGE}-arm64 --amend ${IMAGE}-amd64
		docker manifest push ${IMAGE}

.PHONY: *
