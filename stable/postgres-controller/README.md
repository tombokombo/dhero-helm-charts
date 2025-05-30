# postgres-controller

![Version: 1.4](https://img.shields.io/badge/Version-1.4-informational?style=flat-square) ![AppVersion: 0.5](https://img.shields.io/badge/AppVersion-0.5-informational?style=flat-square)

A controller for managing PostgreSQL databases, roles and more

**Homepage:** <https://github.com/max-rocket-internet/postgres-controller>

## How to install this chart

A simple install with default values, latest chart version and generated name:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/postgres-controller
```

To install a specific version of this chart:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/postgres-controller --version 1.4
```

To install the chart with the release name `my-release`:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/postgres-controller
```

To install with some set values:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/postgres-controller --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/postgres-controller -f values.yaml
```

## Source Code

* <https://github.com/max-rocket-internet/postgres-controller>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| config.postgres_instances.default.host | string | `"hostname"` |  |
| config.postgres_instances.default.password | string | `"postgres"` |  |
| config.postgres_instances.default.port | int | `5432` |  |
| config.postgres_instances.default.user | string | `"postgres"` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"maxrocketinternet/postgres-controller"` |  |
| image.tag | float | `0.5` |  |
| log_level | string | `"info"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| rbac.create | bool | `true` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `nil` |  |
| tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| max-rocket-internet |  | <https://github.com/max-rocket-internet> |

## Chart source and versions

Chart source: [github.com/deliveryhero/helm-charts/postgres-controller](https://github.com/deliveryhero/helm-charts/tree/master/stable/postgres-controller)

Older chart versions: [github.com/deliveryhero/helm-charts/pkgs/container/helm-charts/postgres-controller](https://github.com/deliveryhero/helm-charts/pkgs/container/helm-charts%2Fpostgres-controller)
