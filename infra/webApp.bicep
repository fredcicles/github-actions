param planId string
param webAppName string

resource webApp 'Microsoft.Web/sites@2021-01-15' = {
  name: webAppName
  location: resourceGroup().location
  kind: 'app'
  properties: {
    enabled: true
    hostNameSslStates:[
      {
        name: '${webAppName}.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: '${webAppName}.scm.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: planId
    siteConfig: {
      alwaysOn: true
    }
  }
}
