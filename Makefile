#!/usr/bin/make -f

IMAGE_REPO_BASE=skpr/image-mysql
ARCH=amd64
VERSION_TAG=v1-latest

define build_image
	docker build --build-arg ARCH=${ARCH} -t ${IMAGE_REPO_BASE}-${1}:${VERSION_TAG}-${ARCH} ${1}
endef

define test_image
	container-structure-test test --image ${IMAGE_REPO_BASE}-${1}:${VERSION_TAG}-${ARCH} --config ${1}/tests.yml
endef

define push_image
	docker push ${IMAGE_REPO_BASE}-${1}:${VERSION_TAG}-${ARCH}
endef

define manifest
	$(eval IMAGE=${IMAGE_REPO_BASE}-${1}:${VERSION_TAG})
	docker manifest create ${IMAGE} --amend ${IMAGE}-arm64 --amend ${IMAGE}-amd64
    docker manifest push ${IMAGE}
endef

build:
	$(call build_image,5.6)
	$(call build_image,8.0)
	$(call build_image,8.0-empty)

test:
	$(call test_image,5.6)
	$(call test_image,8.0)
	$(call test_image,8.0-empty)

push:
	$(call push_image,5.6)
	$(call push_image,8.0)
	$(call push_image,8.0-empty)

manifest:
	$(call manifest,5.6)
	$(call manifest,8.0)
	$(call manifest,8.0-empty)

.PHONY: *
