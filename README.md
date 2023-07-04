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
skpr/mysql:5.6-v1-latest-amd64
skpr/mysql:5.6-v1-dev-latest-amd64
skpr/mysql-empty:5.6-v1-latest-amd64
skpr/mysql-empty:5.6-dev-v1-latest-amd64
skpr/mysql:8.0-v1-latest-amd64
skpr/mysql:8.0-dev-v1-latest-amd64
skpr/mysql-empty:8.0-dev-v1-latest-amd64
skpr/mysql-empty:8.0-v1-latest-amd64
```

### Edge

```
skpr/mysql:5.6-v1-edge
skpr/mysql-empty:5.6-v1-edge
skpr/mysql:8.0-v1-edge
skpr/mysql-empty:8.0-v1-edge
```

## Building

```
make build
```
