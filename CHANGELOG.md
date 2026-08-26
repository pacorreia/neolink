# Changelog

## [0.7.4-rc.3](https://github.com/pacorreia/neolink/compare/neolink-v0.7.3-rc.3...neolink-v0.7.4-rc.3) (2026-08-26)


### Bug Fixes

* Update Dockerfile ([42787f5](https://github.com/pacorreia/neolink/commit/42787f579cca72d4c17c60392b2b06be78673db5))

## [0.7.3-rc.3](https://github.com/pacorreia/neolink/compare/neolink-v0.7.2-rc.3...neolink-v0.7.3-rc.3) (2026-08-26)


### Bug Fixes

* use semantic version from Cargo.toml as Docker image tag instead of branch name ([f39c846](https://github.com/pacorreia/neolink/commit/f39c846d5818a44a594f87a54b7be8d4c12a5919))
* use semantic version from Cargo.toml as Docker image tag instead of branch name ([d384822](https://github.com/pacorreia/neolink/commit/d384822366a492c7e8b6e7cf244b4af596dd9054))

## [0.7.2-rc.3](https://github.com/pacorreia/neolink/compare/neolink-v0.7.1-rc.3...neolink-v0.7.2-rc.3) (2026-08-25)


### Bug Fixes

* quote secret variable and guard docker push when tags are empty ([5fccc21](https://github.com/pacorreia/neolink/commit/5fccc21a4d558beb8bf043fa14c2ef2f60d3cbe7))
* quote secret variable and guard docker push when tags are empty ([0dc7d91](https://github.com/pacorreia/neolink/commit/0dc7d91b60ff337d9a0af38c9f96815e3982f161))

## [0.7.1-rc.3](https://github.com/pacorreia/neolink/compare/neolink-v0.7.0-rc.3...neolink-v0.7.1-rc.3) (2026-08-25)


### Bug Fixes

* use github.ref to detect version tags for docker image tagging ([b9bac5c](https://github.com/pacorreia/neolink/commit/b9bac5cb2f38964d3d2b61f73cdcfd49063bd844))
* use github.ref to detect version tags for docker image tagging ([a03bb47](https://github.com/pacorreia/neolink/commit/a03bb47f18cc154c0927f03a82bdc715d68534a8))

## [0.7.0-rc.3](https://github.com/pacorreia/neolink/compare/neolink-v0.6.3-rc.3...neolink-v0.7.0-rc.3) (2026-08-25)


### Features

* add support for running neolink in k8s. add related documentation. ([b13db12](https://github.com/pacorreia/neolink/commit/b13db1227d9754a81bb9fca196e5f638b8ee81cf))


### Bug Fixes

* downgrade frame-drop log to debug, fix buffer_size formula for ~125ms ([ce23596](https://github.com/pacorreia/neolink/commit/ce235961c9ce212e50e3a21cf99f5f820d042225))
* **rtsp:** eliminate buffering latency and restore UDP transport ([ea29e81](https://github.com/pacorreia/neolink/commit/ea29e81094db25dc9fc455e35c9b91e408fe29f6))
* **rtsp:** reduce stream latency and improve UDP transport support ([5073aa6](https://github.com/pacorreia/neolink/commit/5073aa6809658ffd88e0f7e82b6a93a497778b69))
