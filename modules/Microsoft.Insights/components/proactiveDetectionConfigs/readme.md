# Insights Components ProactiveDetectionConfigs `[Microsoft.Insights/components/proactiveDetectionConfigs]`

This module deploys Insights Components ProactiveDetectionConfigs.
// TODO: Replace Resource and fill in description

## Navigation

- [Resource Types](#Resource-Types)
- [Parameters](#Parameters)
- [Outputs](#Outputs)
- [Cross-referenced modules](#Cross-referenced-modules)

## Resource Types

| Resource Type | API Version |
| :-- | :-- |
| `Microsoft.Insights/components/ProactiveDetectionConfigs` | [2018-05-01-preview](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Insights/2018-05-01-preview/components/ProactiveDetectionConfigs) |

## Parameters

**Required parameters**

| Parameter Name | Type | Description |
| :-- | :-- | :-- |
| `name` | string | The name of the Insights Component proactiveDetectionConfig. |

**Conditional parameters**

| Parameter Name | Type | Description |
| :-- | :-- | :-- |
| `appInsightName` | string | The name of the parent app insight. Required if the template is used in a standalone deployment. |

**Optional parameters**

| Parameter Name | Type | Default Value | Description |
| :-- | :-- | :-- | :-- |
| `displayName` | string |  | The rule name as it is displayed in UI. |
| `enableDefaultTelemetry` | bool | `True` | Enable telemetry via a Globally Unique Identifier (GUID). |
| `helpUrl` | string |  | URL which displays additional info about the proactive detection rule. |
| `IsEnabledByDefault` | bool | `True` | A flag indicating whether the rule is enabled by default. |
| `isHidden` | bool |  | A flag indicating whether the rule is hidden (from the UI). |
| `isInPreview` | bool | `False` | 	A flag indicating whether the rule is in preview. |
| `location` | string | `[resourceGroup().location]` | Location for all Resources. |
| `ruleDescription` | string |  | The rule description. |
| `ruleEnabled` | bool | `True` | A flag that indicates whether this rule is enabled by the user. |
| `ruleName` | string |  | The rule name. |
| `sendEmailsToSubscriptionOwners` | bool | `True` | 	A flag that indicated whether notifications on this rule should be sent to subscription owners. |
| `supportsEmailNotifications` | bool | `True` | 	A flag indicating whether email notifications are supported for detections for this rule. |


### Parameter Usage: `<ParameterPlaceholder>`

// TODO: Fill in Parameter usage

## Outputs

| Output Name | Type | Description |
| :-- | :-- | :-- |
| `name` | string | The name of the Insights Component proactiveDetectionConfig. |
| `resourceGroupName` | string | The name of the resource group the event grid topic was deployed into. |
| `resourceId` | string | The resource ID of the Insights Component proactiveDetectionConfig. |

## Cross-referenced modules

_None_
