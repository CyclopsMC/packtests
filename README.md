## Cyclps Pack Tests

[![CI](https://github.com/CyclopsMC/packtests/actions/workflows/gametests.yml/badge.svg)](https://github.com/CyclopsMC/packtests/actions/workflows/gametests.yml)

Repo for testing all Cyclops mods in a production client and server environment.


### Motivation

While mods are always tested in isolation within their own development environment,
development environments can always differ a bit compared to production environments,
especially when combined with other mods.

As such, this repo aims to test real-world environments to ensure everything works as intended.

### Modpacks

This defines several modpacks (see `modpacks/`) for different mod loaders at different minecraft versions.
These packs are defined in their own `pom.xml` file, which defines their precise version.
Not all packs may be defined for all loaders and minecraft versions.

- `cyclops-all`: All mods developed under the Cyclops organization.
- `cyclops-all-deps`: All mods developed under the Cyclops organization, including their optional dependencies.
- `cyclops-id`: All Integrated Dynamics-related mods developed under the Cyclops organization.

### Testing

All packs are started in both a client and server environment, using the [mc-runtime-test](https://github.com/headlesshq/mc-runtime-test) and [mc-server-test](https://github.com/headlesshq/mc-server-test) GitHub actions.
Additionally, [game tests](https://minecraft.wiki/w/GameTest) are executed.

### Automatic dependency updates

Using [Renovate](https://www.mend.io/renovate/), versions of all mods are always automatically updated to their latest version.
This allows us to detect breaking changes immediately.

### Modpack downloads

The mod jars of all modpacks are made available as downloads.
To access these, you open [the latest workflow run](https://github.com/CyclopsMC/packtests/actions/workflows/gametests.yml?query=branch%3Amaster),
and download the artifact you are interested in (e.g. `cyclops-all-1.21.1-neoforge-mods`).

### License
All code is licenced under the [MIT License](https://github.com/CyclopsMC/packtests/blob/master/LICENSE.txt)