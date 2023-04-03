@sys.description('Required. The name of the resource.')
@allowed([
  'scm'
  'ftp'
])
param name string

@sys.description('Conditional. The name of the parent Event Grid Domain. Required if the template is used in a standalone deployment.')
param webAppName string

@description('Optional. Location for all Resources.')
param location string = resourceGroup().location

@description('Optional. Enable telemetry via a Globally Unique Identifier (GUID).')
param enableDefaultTelemetry bool = true

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

resource webApp 'Microsoft.Web/sites@2022-03-01' existing = {
  name: webAppName
}

resource sitePublishingCredPolicies 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2022-03-01' = {
  name: name
  location: location
  parent: webApp
  properties: {
    allow: true
  }
}

@sys.description('The name of the event grid topic.')
output name string = sitePublishingCredPolicies.name

@sys.description('The resource ID of the event grid topic.')
output resourceId string = sitePublishingCredPolicies.id

@sys.description('The name of the resource group the event grid topic was deployed into.')
output resourceGroupName string = resourceGroup().name

@sys.description('The location the resource was deployed into.')
output location string = sitePublishingCredPolicies.location
