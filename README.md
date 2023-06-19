# Skpr MySQL Images

Images for building and running applications with a database.

## Streams

This image suite provides 2 streams for images:

* `latest` - A stable upstream.
* `edge` - Recently merged changes which will be merged into `latest` as part of a release.

## Images

### Latest

```
docker.io/skpr/mysql:5.6-v1-latest
docker.io/skpr/mysql:5.6-dev-v1-latest
docker.io/skpr/mysql:8.0-v1-latest
docker.io/skpr/mysql:8.0-dev-v1-latest
```

### Edge

```
docker.io/skpr/mysql:5.6-v1-edge
docker.io/skpr/mysql:5.6-dev-v1-edge
docker.io/skpr/mysql:8.0-v1-edge
docker.io/skpr/mysql:8.0-dev-v1-edge
```

## Building

```
make build
```
