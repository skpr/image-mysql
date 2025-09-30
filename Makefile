#!/usr/bin/make -f

# Example build command for local development.
# See Github Action for multi-arch and multi-stream building.
nbake:
	docker buildx bake

.PHONY: *
