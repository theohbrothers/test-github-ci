# test-dockerimagevariants

[![github-actions](https://github.com/theohbrothers/test-dockerimagevariants/workflows/ci-master-pr/badge.svg)](https://github.com/theohbrothers/test-dockerimagevariants/actions)
[![github-release](https://img.shields.io/github/v/release/theohbrothers/test-dockerimagevariants?style=flat-square)](https://github.com/theohbrothers/test-dockerimagevariants/releases/)
[![docker-image-size](https://img.shields.io/docker/image-size/theohbrothers/test-dockerimagevariants/latest)](https://hub.docker.com/r/theohbrothers/test-dockerimagevariants)

## Tags

| Tag | Dockerfile Build Context |
|:-------:|:---------:|
| `:v0.4.12-alpine-3.15`, `:latest` | [View](variants/v0.4.12-alpine-3.15) |
| `:v0.3.11-alpine-3.15` | [View](variants/v0.3.11-alpine-3.15) |
| `:v0.2.13-alpine-3.15` | [View](variants/v0.2.13-alpine-3.15) |
| `:v0.1.0-alpine-3.15` | [View](variants/v0.1.0-alpine-3.15) |

## Development

Requires Windows `powershell` or [`pwsh`](https://github.com/PowerShell/PowerShell).

```powershell
# Install Generate-DockerImageVariants module: https://github.com/theohbrothers/Generate-DockerImageVariants
Install-Module -Name Generate-DockerImageVariants -Repository PSGallery -Scope CurrentUser -Force -Verbose

# Edit ./generate templates

# Generate the variants
Generate-DockerImageVariants .
```

### Variant versions

[versions.json](generate/definitions/versions.json) contains a list of [Semver](https://semver.org/) versions, one per line.

To update versions in `versions.json`:

```powershell
./Update-Versions.ps1
```

To update versions in `versions.json`, and open a PR for each changed version, and merge successful PRs one after another (to prevent merge conflicts), and finally create a tagged release and close milestone:

```powershell
$env:GITHUB_TOKEN = 'xxx'
./Update-Versions.ps1 -PR -AutoMergeQueue -AutoRelease
```

To perform a dry run, use `-WhatIf`.

