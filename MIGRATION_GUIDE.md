<!-- markdownlint-disable MD029  -->
# Migration guide

## (Breaking) from v2.x to v3.x

> This version drop the support for the POD IDENTITY

To use the workload identity and be able to load secrets directly from kv, you need to setup this two things.

### Service account name linked to workload identity

Add this yaml tag with the service account info

```yaml
  cron-chart:
    serviceAccount:
      name: testit-workload-identity
```

> this service account was setuped before (infra), and linked to the workload identity

### Workload Identity ClientID (aka: User managed identity clientID)

To be able to use the workload identity is mandatory to setup the client id associated to this one.
To do so, you will have to pass as a parameter as shown below

```yaml
cron-chart:
  azure:
    # -- Azure Workload Identity Client ID (e.g. qwerty123-a1aa-1234-xyza-qwerty123)
    workloadIdentityClientId: qwerty123-a1aa-1234-xyza-qwerty123
```

or you can override with an helm parameter in this way bellow, if you don't want to commit this value

```yaml
--set microservice-chart.azure.workloadIdentityClientId="$CLIENT_ID"
```

> the client id is not secret, this is why we can put into git
