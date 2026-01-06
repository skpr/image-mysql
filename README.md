# Skpr MySQL Images

Images for building and running applications with a database.

## Streams

This image suite provides 2 streams for images:

* `stable` - Our production/stable upstream for projects. Use this by default.
* `latest` - Recently merged changes which will be merged into `stable` as part of a release.

## Images

Images are available in the following registries:

* `ghcr.io`
* `docker.io`

## Image List

Below is the list of PHP images we provide.

By default we recommend the following registry and stream:

```
REGISTRY=docker.io
STREAM=stable
```

**Stable**

```
REGISTRY/skpr/mysql:8.x-v3-STREAM
REGISTRY/skpr/mysql-empty:8.x-v3-STREAM
REGISTRY/skpr/mysql-dump:8.x-v3-STREAM
REGISTRY/skpr/mysql-import:8.x-v3-STREAM
```

## Building

Run the following command to build the images:

```
make
```

