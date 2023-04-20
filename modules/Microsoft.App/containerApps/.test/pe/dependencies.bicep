@description('Optional. The location to deploy resources to.')
param location string = resourceGroup().location

@description('Required. The name of the Managed Environment for Container Apps to create.')
param managedEnvironmentName string

@description('Required. The name of the Log Analytics Workspace to create.')
param logAnalyticsWorkspaceName string

@description('Required. The name of the Virtual Network to create.')
param virtualNetworkName string

@description('Required. The name of the managed identity to create.')
param managedIdentityName string

var addressPrefix = '10.0.0.0/16'
var subnetAddressPrefix = '10.0.0.0/23'

resource managedIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2022-01-31-preview' = {
  name: managedIdentityName
  location: location
}

resource logAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: logAnalyticsWorkspaceName
  location: location
  properties: any({
    retentionInDays: 30
    features: {
      searchVersion: 1
    }
    sku: {
      name: 'PerGB2018'
    }
  })
}

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2022-07-01' = {
  name: virtualNetworkName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    subnets: [
      {
        name: 'defaultSubnet'
        properties: {
          addressPrefix: subnetAddressPrefix
        }
      }
    ]
  }

}

resource managedEnvironment 'Microsoft.App/managedEnvironments@2022-10-01' = {
  name: managedEnvironmentName
  location: location
  sku: {
    name: 'Consumption'
  }
  properties: {
    appLogsConfiguration: {
      destination: 'log-analytics'
      logAnalyticsConfiguration: {
        customerId: logAnalyticsWorkspace.properties.customerId
        sharedKey: logAnalyticsWorkspace.listKeys().primarySharedKey
      }
    }
    vnetConfiguration: {
      infrastructureSubnetId: virtualNetwork.properties.subnets[0].id
      internal: true
    }
  }
}

@description('The resource ID of the created Managed Identity.')
output managedIdentityResourceId string = managedIdentity.id

@description('The resource ID of the created Managed Environment.')
output managedEnvironmentResourceId string = managedEnvironment.id
