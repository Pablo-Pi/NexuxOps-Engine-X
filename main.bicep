// NexusOps Engine-X™ Master Orchestrator
// Excellence Level: Tier 1
// Deployment Scope: Sovereign Vault

targetScope = 'subscription'

@description('The name of the London/Home Counties Client')
param clientName string

@description('Deployment region - Standardised to UK South for Sovereignty')
param location string = 'uksouth'

var defaultTags = {
  Environment: 'Production'
  ManagedBy: 'NexusOps'
  Framework: 'Sovereign-Vault-v1'
  DeploymentEngine: 'Engine-X'
}

// --- CALL PILLAR 1: IDENTITY & GOVERNANCE ---
module identity './modules/identity.bicep' = {
  name: 'deploy-identity-${clientName}'
  params: {
    clientName: clientName
    location: location
    tags: defaultTags
  }
}

// FUTURE MODULES WILL BE CALLED HERE:
// module networking './modules/networking.bicep' = { ... }
// module storage './modules/storage.bicep' = { ... }

output vaultResourceGroup string = identity.outputs.resourceGroupName
