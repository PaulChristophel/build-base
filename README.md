[![Release](https://github.com/PaulChristophel/build-base/actions/workflows/release.yaml/badge.svg)](https://github.com/PaulChristophel/build-base/actions/workflows/release.yaml)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

# Build-Base

Build-Base is a Docker-based project designed to create base build images for projects that have a Go backend and a JavaScript frontend. This project provides a standardized environment for building and deploying applications using either `musl` or `glibc`.


## Features

- **Musl-based Image**: Lightweight Alpine-based image for minimal footprint.
- **Glibc-based Image**: Debian-based image for compatibility with a wider range of software.
- Includes essential tools and dependencies for Go and JavaScript development.


## Usage

### Pulling the Images

You can pull the pre-built images from Docker Hub:

```sh
docker pull docker.io/pcm0/build-base:musl
docker pull docker.io/pcm0/build-base:glibc
```


### Building Your Application
To build your application using one of the base images, create a Dockerfile in your project directory and specify the desired base image. For example:

```dockerfile
# For musl-based image
FROM docker.io/pcm0/build-base:musl

# For glibc-based image
FROM docker.io/pcm0/build-base:glibc

# Add your build instructions here
```


## Dockerfile Overview

The Dockerfile defines two base images:

1. **Musl-based Image**:
    - Starts from `node:22-alpine` and `golang:alpine`
    - Installs `pnpm` and Go tools.
    - Provides a base image with build tools and dependencies.

2. **Glibc-based Image**:
    - Starts from `node:22-bookworm` and `golang:bookworm`
    - Installs `pnpm` and Go tools.
    - Provides a base image with build tools and dependencies.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any changes or improvements.


## License

This project is licensed under the GNU GPLv3.
