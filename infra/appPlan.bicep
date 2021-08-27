param environment string
param planName string
param sku string = 'S1'

resource appPlan 'Microsoft.Web/serverfarms@2021-01-15' = {
  name: planName
  location: resourceGroup().location
  kind: 'app'
  sku: {
    name: sku
  }
  properties: {
    reserved: true
  }
}

output planId string = appPlan.id
output output1 string = environment
