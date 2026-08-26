# Changelog

## [0.7.10-rc.3](https://github.com/pacorreia/neolink/compare/neolink-v0.7.9-rc.3...neolink-v0.7.10-rc.3) (2026-08-26)


### Bug Fixes

* keep GStreamer log handler alive by using std::mem::forget on LogHandlerId ([bdcf24f](https://github.com/pacorreia/neolink/commit/bdcf24fcc468a1902d3203567b72dc096bcf5696))
* prevent immediate unregistration of GStreamer CRITICAL log handler ([d04d99e](https://github.com/pacorreia/neolink/commit/d04d99e3a29f1535343aa8f3273945df6b5a8397))

## [0.7.9-rc.3](https://github.com/pacorreia/neolink/compare/neolink-v0.7.8-rc.3...neolink-v0.7.9-rc.3) (2026-08-26)


### Bug Fixes

* disable push notifications by default; suppress benign GStreamer gst_poll assertion ([d6d0ec0](https://github.com/pacorreia/neolink/commit/d6d0ec0156c29dc059e28165b6661cd5b35bc4f3))
* disable push notifications by default; suppress benign GStreamer gst_poll assertion ([364bc4d](https://github.com/pacorreia/neolink/commit/364bc4def25562dd8f84a0e138c4b45e4710b9ea))

## [0.7.8-rc.3](https://github.com/pacorreia/neolink/compare/neolink-v0.7.7-rc.3...neolink-v0.7.8-rc.3) (2026-08-26)


### Bug Fixes

* reformat long log::debug! line in factory.rs to pass rustfmt check ([baa3654](https://github.com/pacorreia/neolink/commit/baa36548fd6b57f396a2438d8eea261d6dcb14b2))

## [0.7.7-rc.3](https://github.com/pacorreia/neolink/compare/neolink-v0.7.6-rc.3...neolink-v0.7.7-rc.3) (2026-08-26)


### Bug Fixes

* Address review feedback on buffer pool error logging, Flushing log message, and push_notifications default ([6b7cad3](https://github.com/pacorreia/neolink/commit/6b7cad35bfc1749be3a8f32aa408c1d78302a829))
* Change push_notifications default to false; handle buffer pool exhaustion and WrongState ([7b5cb65](https://github.com/pacorreia/neolink/commit/7b5cb65beb460d9b9031e8288822e6c7a6965047))
* clamp RTSP video timestamp fps divisor ([6b77410](https://github.com/pacorreia/neolink/commit/6b77410735a30532fdeaef8a0e8e629851fb9186))
* Restore RTSP stream playback for Home Assistant ([b922399](https://github.com/pacorreia/neolink/commit/b92239939df303783376a3586291847a59084ea5))
* Restore RTSP stream playback for Home Assistant ([aab4c2c](https://github.com/pacorreia/neolink/commit/aab4c2ced4dfd9dbc725bdb8690602d81bfdc7bc))

## [0.7.6-rc.3](https://github.com/pacorreia/neolink/compare/neolink-v0.7.5-rc.3...neolink-v0.7.6-rc.3) (2026-08-26)


### Bug Fixes

* Update Dockerfile ([b3b373b](https://github.com/pacorreia/neolink/commit/b3b373bfc67adc59c8add5a57b0ae2561f372d86))

## [0.7.5-rc.3](https://github.com/pacorreia/neolink/compare/neolink-v0.7.4-rc.3...neolink-v0.7.5-rc.3) (2026-08-26)


### Bug Fixes

* Update Dockerfile ([70370f8](https://github.com/pacorreia/neolink/commit/70370f82cd5ab8a50de55a5d4344e95aec0c98d9))

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
