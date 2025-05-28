[![CI](https://github.com/DiamondLightSource/account-sync-sidecar/actions/workflows/ci.yml/badge.svg)](https://github.com/DiamondLightSource/account-sync-sidecar/actions/workflows/ci.yml)
[![Coverage](https://codecov.io/gh/DiamondLightSource/account-sync-sidecar/branch/main/graph/badge.svg)](https://codecov.io/gh/DiamondLightSource/account-sync-sidecar)

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0)

# account_sync_sidecar

A side-car container providing LDAP access to containers based on the DLS [python-copier-tempate](https://github.com/DiamondLightSource/python-copier-template)

Source          | <https://github.com/DiamondLightSource/account-sync-sidecar>
:---:           | :---:
Docker          | `docker run ghcr.io/diamondlightsource/account-sync-sidecar:latest`
Releases        | <https://github.com/DiamondLightSource/account-sync-sidecar/releases>

This side-car shares the `nslcd` socket with the main container, using [libnss-ldapd ](https://wiki.debian.org/LDAP/NSS) to load users and groups from remote LDAP directories.

This allows containerised programs running as non-root users in the DLS clusters to know the username of the user they are running as. This is necessary to e.g. deploy VSCode server in the cluster.

A how-to can be found [here](https://github.com/DiamondLightSource/python-copier-template/tree/main/docs/how-to/debug-in-cluster.md). 

If the main container is templated from a release of python-copier-template, this release's version should be equal to the version of the account-sync-sidecar, as these are coordinated. To find python-copier-template version, check `/.copier-answers.yml` for a `_commit` field.
