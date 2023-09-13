# Skpr MySQL Images

Images for building and running applications with a database.

## Streams

This image suite provides 3 streams for images:

* `latest` - A stable upstream.
* `edge` - Recently merged changes which will be merged into `latest` as part of a release.

## Images

### Latest

```
skpr/mysql:8.x-v3-latest
skpr/mysql-empty:8.x-v3-latest
skpr/mysql-dump:8.x-v3-latest
skpr/mysql-import:8.x-v3-latest
```

### Edge

```
skpr/mysql:8.x-v3-edge
skpr/mysql-empty:8.x-v3-edge
skpr/mysql-dump:8.x-v3-edge
skpr/mysql-import:8.x-v3-edge
```

## Building

```
VERSION_TAG=v3-latest make build
```
