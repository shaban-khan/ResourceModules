@description('Required. The name of the Insights Component proactiveDetectionConfig.')
param name string

@description('Conditional. The name of the parent app insight. Required if the template is used in a standalone deployment.')
param appInsightName string

@description('Optional. The rule name.')
param ruleName string

@description('Optional. The rule name as it is displayed in UI.')
param displayName string

@description('Optional. The rule description.')
param ruleDescription string

@description('Optional. URL which displays additional info about the proactive detection rule.')
param helpUrl string

@description('Optional. A flag indicating whether the rule is hidden (from the UI).')
param isHidden bool

@description('Optional. A flag indicating whether the rule is enabled by default.')
param IsEnabledByDefault bool = true

@description('Optional. 	A flag indicating whether email notifications are supported for detections for this rule.')
param supportsEmailNotifications bool = true

@description('Optional. 	A flag indicating whether the rule is in preview.')
param isInPreview bool = false

@description('Optional. A flag that indicates whether this rule is enabled by the user.')
param ruleEnabled bool = true

@description('Optional. 	A flag that indicated whether notifications on this rule should be sent to subscription owners.')
param sendEmailsToSubscriptionOwners bool = true

@description('Optional. Location for all Resources.')
param location string = resourceGroup().location

@description('Optional. Enable telemetry via a Globally Unique Identifier (GUID).')
param enableDefaultTelemetry bool = true

param customEmails array = []

resource defaultTelemetry 'Microsoft.Resources/deployments@2021-04-01' = if (enableDefaultTelemetry) {
  name: 'pid-47ed15a6-730a-4827-bcb4-0fd963ffbd82-${uniqueString(deployment().name, location)}'
  properties: {
    mode: 'Incremental'
    template: {
      '$schema': 'https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#'
      contentVersion: '1.0.0.0'
      resources: []
    }
  }
}

resource appInsight 'Microsoft.Insights/components@2020-02-02' existing = {
  name: appInsightName
}

resource proactiveDetectionConfig 'Microsoft.Insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  name: name
  parent: appInsight
  location: location
  properties: {
    RuleDefinitions: {
      Name: ruleName
      DisplayName: displayName
      Description: ruleDescription
      HelpUrl: helpUrl
      IsHidden: isHidden
      IsEnabledByDefault: IsEnabledByDefault
      IsInPreview: isInPreview
      SupportsEmailNotifications: supportsEmailNotifications
    }
    Enabled: ruleEnabled
    SendEmailsToSubscriptionOwners: sendEmailsToSubscriptionOwners
    CustomEmails: customEmails
  }
}

@description('The name of the Insights Component proactiveDetectionConfig.')
output name string = proactiveDetectionConfig.name

@description('The resource ID of the Insights Component proactiveDetectionConfig.')
output resourceId string = proactiveDetectionConfig.id

@description('The name of the resource group the event grid topic was deployed into.')
output resourceGroupName string = resourceGroup().name
