# Web Sites BasicPublishingCredentialsPolicies `[Microsoft.Web/sites/basicPublishingCredentialsPolicies]`

This module deploys Web Sites BasicPublishingCredentialsPolicies.
// TODO: Replace Resource and fill in description

## Navigation

- [Resource Types](#Resource-Types)
- [Parameters](#Parameters)
- [Outputs](#Outputs)
- [Cross-referenced modules](#Cross-referenced-modules)

## Resource Types

| Resource Type | API Version |
| :-- | :-- |
| `Microsoft.Web/sites/basicPublishingCredentialsPolicies` | [2022-03-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Web/sites) |

## Parameters

**Required parameters**

| Parameter Name | Type | Allowed Values | Description |
| :-- | :-- | :-- | :-- |
| `name` | string | `[ftp, scm]` | The name of the resource. |

**Conditional parameters**

| Parameter Name | Type | Description |
| :-- | :-- | :-- |
| `webAppName` | string | The name of the parent Event Grid Domain. Required if the template is used in a standalone deployment. |

**Optional parameters**

| Parameter Name | Type | Default Value | Description |
| :-- | :-- | :-- | :-- |
| `enableDefaultTelemetry` | bool | `True` | Enable telemetry via a Globally Unique Identifier (GUID). |
| `location` | string | `[resourceGroup().location]` | Location for all Resources. |


### Parameter Usage: `<ParameterPlaceholder>`

// TODO: Fill in Parameter usage

## Outputs

| Output Name | Type | Description |
| :-- | :-- | :-- |
| `name` | string | The name of the event grid topic. |
| `resourceGroupName` | string | The name of the resource group the event grid topic was deployed into. |
| `resourceId` | string | The resource ID of the event grid topic. |

## Cross-referenced modules

_None_
