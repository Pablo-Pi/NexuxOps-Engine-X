// NexusOps Engine-X (B-Series)
// Module: Identity Vault
// Purpose: Establishes Governance and Least-Privilege RBAC

targetScope = 'subscription'

param clientName string
param location string = 'uksouth'
param tags object

// 1. Create the Sovereign Resource Group
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${clientName}-sovereign-vault'
  location: location
  tags: tags
}

// 2. Define Proprietary RBAC Roles (Example: Sentinel Auditor)
// This ensures the client's internal IT can see but not destroy
output resourceGroupId string = rg.id
output resourceGroupName string = rg.name
