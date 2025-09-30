variable "STREAM" {
  default = "latest"
}

variable "VERSION" {
  default = "v3"
}

variable "PLATFORMS" {
  default = ["linux/amd64", "linux/arm64"]
}

variable "REGISTRIES" {
  default = ["docker.io", "ghcr.io"]
}

# Common target: Everything inherits from this
target "_common" {
  platforms = PLATFORMS
}

group "default" {
  targets = [
    "mysql",
    "empty",
    "dump",
    "import",
    "test",
  ]
}

target "mysql" {
  inherits = ["_common"]
  context  = "mysql"

  contexts = {
    from_image = "docker-image://ubuntu:22.04"
  }

  tags = [
    for r in REGISTRIES :
    "${r}/skpr/mysql:${VERSION}-${STREAM}"
  ]
}

target "empty" {
  inherits = ["_common"]
  context  = "empty"

  contexts = {
    from_image = "target:mysql"
  }

  tags = [
    for r in REGISTRIES :
    "${r}/skpr/mysql-empty:${VERSION}-${STREAM}"
  ]
}

target "dump" {
  inherits = ["_common"]
  context  = "dump"

  contexts = {
    from_image = "target:mysql"
  }

  tags = [
    for r in REGISTRIES :
    "${r}/skpr/mysql-dump:${VERSION}-${STREAM}"
  ]
}

target "import" {
  inherits = ["_common"]
  context  = "import"

  contexts = {
    from_image = "target:mysql"
  }

  tags = [
    for r in REGISTRIES :
    "${r}/skpr/mysql-import:${VERSION}-${STREAM}"
  ]
}

target "test" {
  matrix = {
    variant = ["mysql"]
  }

  name = "${variant}-test"

  inherits = [variant]

  # Run this stage from the Dockerfile.
  target = "test"

  # Only build the test target locally.
  output = ["type=cacheonly"]
}
