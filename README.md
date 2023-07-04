# Skpr MySQL Images

Images for building and running applications with a database.

## Streams

This image suite provides 3 streams for images:

* `latest` - A stable upstream.
* `edge` - Recently merged changes which will be merged into `latest` as part of a release.
* `empty` - Images ready for database importing which contain no data.

## Images

### Latest

```
skpr/mysql:8.x-v3-latest-amd64
skpr/mysql:8.x-v3-latest-arm64
```

### Edge

```
skpr/mysql-empty:8.x-edge-amd64
skpr/mysql-empty:8.x-edge-arm64
```

### Empty

```
skpr/mysql-empty:8.x-v3-latest-amd64
```

## Building

```
VERSION_TAG=v3-latest make build
```
