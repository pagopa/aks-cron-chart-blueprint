# cron-chart

![Version: 2.7.0](https://img.shields.io/badge/Version-2.7.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.0](https://img.shields.io/badge/AppVersion-0.0.0-informational?style=flat-square)

A Helm chart for pagoPA cron

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Pod labels affinity |
| args | list | `[]` | args |
| azure.workloadIdentityClientId | string | `""` | Azure Workload Identity Client ID (e.g. qwerty123-a1aa-1234-xyza-qwerty123) |
| azure.workloadIdentityEnabled | bool | `true` | Enable workload identity |
| command | list | `[]` |  |
| concurrencyPolicy | string | `"Allow"` | cronjob.concurrencyPolicy |
| configMapFileMode | int | `420` | configMapFileMode |
| configMapFromFile | object | `{}` | Configure files to mount as config maps |
| cronjob | object | - | Configure deployment |
| cronjob.create | bool | `true` | create the deployment manifest |
| envConfig | object | `{}` | Environment config to use for the canary container |
| envConfigMapExternals | object | {} | Configure values from config maps external to chart. E.g already present into cluster, see documentation |
| envFieldRef | object | `{}` | Environment config from k8s metadata |
| envSecrets | object | `{}` | Configure secret provider with secrets to mount as environment variables |
| externalConfigMap | object | `{"configMaps":[],"create":false}` | externalConfigMap |
| failedJobsHistoryLimit | int | `1` | cronjob.failedJobsHistoryLimit (number) |
| fullnameOverride | string | `""` | Helm chart fullname override |
| image.pullPolicy | string | `"Always"` | Pull policy to use |
| image.repository | string | `""` | Docker reposity for the container |
| image.tag | string | `"v0.0.0"` | Container TAG |
| keyvault | object | `{"name":"","tenantId":""}` | Configure keyvault to use inside secret prover to load secret directly |
| keyvault.name | string | `""` | Key vault name |
| keyvault.tenantId | string | `""` | Tenant ID |
| nameOverride | string | `""` | Helm chart name override |
| namespace | string | `""` | Namespace in which deploy the cron |
| nodeSelector | object | `{}` | K8s node selectors |
| parallelism | int | `1` | cronjob.parallelism (number) |
| pod | object | `{"ports":[]}` | pod |
| pod.ports | list | `[]` | Which ports use (! this port is used even inside the deployment) |
| podAnnotations | object | `{}` | podAnnotations |
| podMonitor | object | `{"create":false,"podMetricsEndpoints":[]}` | podMonitor |
| podMonitor.create | bool | `false` | Create or not the ingress manifest |
| podMonitor.podMetricsEndpoints | list | `[]` | Which fileshare use (! this name is used even inside the deployment) |
| podSecurityContext | object | `{"seccompProfile":{"type":"RuntimeDefault"}}` | podSecurityContext |
| providedVolumeMount | object | {} | Configure mounted volumes with secrets needed to mount them |
| resources | object | - | POD resources section |
| resources.limits | object | `{"cpu":"150m","memory":"128Mi"}` | limits is mandatory |
| resources.requests | object | `{"cpu":"40m","memory":"96Mi"}` | request is mandatory |
| schedule | string | `""` | schedule "0 0 * * *" |
| secretProviderClass | object | `{"create":true}` | Configure secret provider with secrets to mount as environment variables |
| secretProviderClass.create | bool | `true` | create |
| securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["all"]},"readOnlyRootFilesystem":true}` | securityContext |
| serviceAccount | object | - | Service account configuration |
| serviceAccount.create | bool | `false` | Create the service account object. If true use this object, otherwise use only the name reference |
| serviceAccount.name | string | `""` | Service account name, this service account already exists |
| sidecars | list | `[]` | Sidecars, each object has exactly the same schema as a Pod, except it does not have an apiVersion or kind |
| successfulJobsHistoryLimit | int | `3` | cronjob.successfulJobsHistoryLimit (number) |
| suspend | bool | `false` |  |
| terminationGracePeriodSeconds | int | `30` | cronjob.terminationGracePeriodSeconds (number) |
| timeZone | string | `""` | "Europe/Rome" |
| tmpVolumeMount | object | `{"create":false,"mountPath":"/tmp","name":"tmp"}` | Configure optional tmp volume to mount |
| tolerations | list | `[]` | Pod taints toleration |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
