# SQL2X Generated code based on a SQL Server Schema
# SQL2X Version: 0.d
# http://sql2x.azurewebsites.net/
# Generated Date: 11/4/2018 6:35:32 AM
# Template: sql2x.PowerShellGenerator.CifudeScriptModule
##################################################################################################################
$script:taskName = 'data class'
#region
##################################################################################################################
class TineScriptRunIntelligenceData {
    [System.Guid]$tineScriptRunIntelligenceId = '00000000-0000-0000-0000-000000000000'
    [System.String]$tineScriptRunIntelligencePartitionKey = $env:ComputerName
    [System.String]$tineScriptRunIntelligenceRowKey = [System.DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ss.fffZ')
    [System.Guid]$tineMachineId = '00000000-0000-0000-0000-000000000000'
    [System.Guid]$tineCreationId = '00000000-0000-0000-0000-000000000000'
    [System.String]$tineTaskScriptName = ''
    [System.String]$tineTaskScriptMachineOutcomeRcd = ''
    [System.Int32]$tineTaskScriptOutcomePositiveCount = 0
    [System.Int32]$tineTaskScriptOutcomeNegativeCount = 0
    [System.Guid]$userId = '00000000-0000-0000-0000-000000000000'
    [System.DateTime]$dateTime = '1601.01.01T00:00:00Z'
}
#endregion
##################################################################################################################
$script:taskName = 'refs'
#region
##################################################################################################################
if (-not ([System.Management.Automation.PSTypeName]'TineCacheRef').Type) {
   Add-Type -TypeDefinition @"
   public enum TineCacheRef
   {
    HitThreshold,
    None,
    TineHalt
   }
"@
}

if (-not ([System.Management.Automation.PSTypeName]'TineScriptReadinessStateRef').Type) {
   Add-Type -TypeDefinition @"
   public enum TineScriptReadinessStateRef
   {
    None,
    Tiney
   }
"@
}

if (-not ([System.Management.Automation.PSTypeName]'TineScriptRunLogStatusRef').Type) {
   Add-Type -TypeDefinition @"
   public enum TineScriptRunLogStatusRef
   {
    Cleaned,
    Executed,
    None,
    Planned,
    Searched
   }
"@
}

if (-not ([System.Management.Automation.PSTypeName]'TineTaskRef').Type) {
   Add-Type -TypeDefinition @"
   public enum TineTaskRef
   {
    None,
    Script,
    Task
   }
"@
}

if (-not ([System.Management.Automation.PSTypeName]'TineTaskScriptMachineOutcomeRef').Type) {
   Add-Type -TypeDefinition @"
   public enum TineTaskScriptMachineOutcomeRef
   {
    Failure,
    None,
    ScriptFileMissing,
    Success
   }
"@
}

if (-not ([System.Management.Automation.PSTypeName]'TineTaskScriptOutcomeRef').Type) {
   Add-Type -TypeDefinition @"
   public enum TineTaskScriptOutcomeRef
   {
    Failure,
    None,
    ScriptFileMissing,
    Success
   }
"@
}

if (-not ([System.Management.Automation.PSTypeName]'TineTaskStatusRef').Type) {
   Add-Type -TypeDefinition @"
   public enum TineTaskStatusRef
   {
    Cleaned,
    Executed,
    None,
    Planned,
    ReTasked,
    Searched
   }
"@
}

if (-not ([System.Management.Automation.PSTypeName]'TineTestOutcomeRef').Type) {
   Add-Type -TypeDefinition @"
   public enum TineTestOutcomeRef
   {
    Failure,
    None,
    Success
   }
"@
}

#endregion
