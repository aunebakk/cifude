# SQL2X Generated code based on a SQL Server Schema
# SQL2X Version: 0.d
# http://sql2x.azurewebsites.net/
# Generated Date: 10/10/2018 2:46:41 AM
# Template: sql2x.PowerShellGenerator.CifudeScript
<#
.\tine_script_run_intelligence.ps1 -doEcho       -doSql2x -comment test -create
.\tine_script_run_intelligence.ps1 -doEcho       -doSql2x -comment test -insert
.\tine_script_run_intelligence.ps1 -doEcho       -doSql2x -comment test -fetch                -tineScriptRunIntelligenceId:([guid]'')
.\tine_script_run_intelligence.ps1 -returnValue  -doSql2x -comment test -fetchValue:column    -tineScriptRunIntelligenceId:([guid]'')
.\tine_script_run_intelligence.ps1 -doEcho       -doSql2x -comment test -updateByPrimaryKey   -show -tineScriptRunIntelligenceId:([guid]'')
.\tine_script_run_intelligence.ps1 -doEcho       -doSql2x -comment test -updateByForeignKeys  -show
.\tine_script_run_intelligence.ps1 -doEcho       -doSql2x -comment test -deleteAll
.\tine_script_run_intelligence.ps1 -doEcho       -doSql2x -comment test -delete               -tineScriptRunIntelligenceId:([guid]'')
.\tine_script_run_intelligence.ps1 -doEcho       -doSql2x -comment test -drop
.\tine_script_run_intelligence.ps1 -doEcho       -doSql2x -comment test -show
.\tine_script_run_intelligence.ps1 -doEcho       -doSql2x -comment test -help
.\tine_script_run_intelligence.ps1 -doEcho       -doSql2x -comment test -create -insert -fetch -fetchValue:column -updateByPrimaryKey -delete -drop -show -help -tineScriptRunIntelligenceId:([guid]'')
#>
[Diagnostics.CodeAnalysis.SuppressMessageAttribute `
    ('PSPossibleIncorrectComparisonWithNull','')]
param(
    [string]$scriptName = 'CIFUDE ( Create Insert Fetch Update Delete Extras ) for tine_script_run_intelligence',
    [string]$scriptStyle = 'original', # original / task
    [string]$scriptStatus = 'status ( todos, learn, learned )',
    [string]$scriptDocumentation = 'links urls, books, people, inspiration',

    [DateTime]$dateTimeStart = [System.DateTime]::UtcNow,
    [DateTime]$dateTimeStop = [System.DateTime]::UtcNow,
    [DateTime]$createdDateTime = '2018.10.10',
    [DateTime]$updateDateTime = '0001.01.01',

    [switch]$doDevelopment = $false,
    [switch]$doTest = $false,
    [switch]$doSql2x = $false,
    [switch]$doStep = $false,
    [switch]$doEcho = $false,

    [switch]$create = $false,
    [switch]$insert = $false,
    [switch]$fetch = $false,
    [switch]$updateByPrimaryKey = $false,
    [switch]$updateByForeignKeys = $false,
    [switch]$delete = $false,
    [switch]$deleteAll = $false,
    [switch]$drop = $false,

    [switch]$show = $false,
    [switch]$help = $false,
    [string]$fetchValue = '',
    [int]$takeCount = 20,

    [switch]$returnHtml = $false,
    [switch]$returnJson = $false,
    [switch]$returnValue = $false,
    [switch]$returnObject = $false,
    [switch]$returnGridView = $false,

    [switch]$whatIf = $false,
    [switch]$rethrow = $false,
    [string]$comment = 'no comment',
    [switch]$sendMail = $false,

    # schema with foreign keys and default values
    [System.Guid]$tineScriptRunIntelligenceId = '00000000-0000-0000-0000-000000000000',
    [System.String]$tineScriptRunIntelligencePartitionKey = $env:ComputerName,
    [System.String]$tineScriptRunIntelligenceRowKey = [System.DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ss.fffZ'),
    [System.Guid]$tineMachineId = '00000000-0000-0000-0000-000000000000',
    [System.Guid]$tineCreationId = '00000000-0000-0000-0000-000000000000',
    [System.String]$tineTaskScriptName = '',
    [System.String]$tineTaskScriptMachineOutcomeRcd = '',
    [System.Int32]$tineTaskScriptOutcomePositiveCount = 0,
    [System.Int32]$tineTaskScriptOutcomeNegativeCount = 0,
    [System.Guid]$userId = '00000000-0000-0000-0000-000000000000',
    [System.DateTime]$dateTime = '1601.01.01T00:00:00Z'

)
##################################################################################################################
$script:taskName = 'locals'
#region
##################################################################################################################
[string] $script:taskLine = ''
[string] $script:answer = ''
[bool] $script:mailAnyway = $false
[string] $script:htmlLog = ''

[string] $script:storageConnectionString = 'DefaultEndpointsProtocol=https;AccountName=xxx;AccountKey=xxx/xxx+xxx/xxx;EndpointSuffix=core.windows.net'
#endregion
##################################################################################################################
$script:taskName = 'injection'
#region
##################################################################################################################
if (!$PSBoundParameters.ContainsKey('doDevelopment') -and !$PSBoundParameters.ContainsKey('doTest') -and !$PSBoundParameters.ContainsKey('doSql2x'))  {
    [switch]$doSql2x = $true
    [switch]$doEcho = $true

    [string]$comment = 'dev'
    'neither -doDevelopment or -doTest, assuming doSql2x and doEcho'
}
#endregion
##################################################################################################################
$script:taskName = 'set startup location'
#region
##################################################################################################################
try {
    [string] $script:startupDirectory = $pwd
    if ($doDevelopment) {
        [string] $script:startupDirectory = 'C:\SQL2XProjects' + '\' + 'sql2x' + '\' + 'Scripts'
    } elseif ($doTest) {
        [string] $script:startupDirectory = $home + '\' + 'sql2x' + '\' + 'Scripts'
    } elseif ($doSql2x) {
        [string] $script:startupDirectory = $pwd
    }
    if ($script:startupDirectory -ne '') {
        Set-Location $script:startupDirectory -ErrorAction:Stop
    }
} catch [Exception] {
    if ($rethrow) {
        Write-Host ($script:taskName + ' ' + 'Exception; ' + $_.Exception.Message)
        try { Set-Location $script:startupDirectory } catch { }; throw [Exception] ('Failed to; ' + $script:taskName)
    } else {
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + ('Exception:' + ' ' + $script:taskName + ' ' + '[' +  $_.Exception.Message + ']' + ' ' + 'Line:[' + $_.InvocationInfo.ScriptLineNumber + ']')
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doEcho) { Write-Host ( $script:taskLine ) -ForegroundColor Red }
        $doDevelopment = $false; $doTest = $true
    }
}
#endregion
##################################################################################################################
$script:taskName = 'start script:'
#region
##################################################################################################################
$script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + $script:taskName `
        + ' ' + $MyInvocation.MyCommand.Name `
        + ' ' + $MyInvocation.MyCommand.Arguments
$script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
if ($doEcho) { Write-Host $script:taskLine }

if (-not (([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).
        IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))) {
    $script:taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + 'pwd:' + ' ' + $pwd + ' ' + 'Not Admin')
    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
    if ($doEcho) { Write-Host $script:taskLine }
} else {
    $script:taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + 'pwd:' + ' ' + $pwd + ' ' + 'Admin')
    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
    if ($doEcho) { Write-Host $script:taskLine }
}

$script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'doDevelopment;' + '[' + $doDevelopment + ']' + ' ' + 'doTest;' + '[' + $doTest + ']' + ' ' + 'doStep;' + '[' + $doStep + ']' + ' ' + 'doEcho;' + '[' + $doEcho + ']' + ' ' + 'rethrow;' + '[' + $rethrow + ']'
$script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
if ($doEcho) { Write-Host $script:taskLine }

# check comment
if ([string]::IsNullOrWhiteSpace($comment)) {
    [string] $comment = Read-Host -Prompt ([System.DateTime]::UtcNow.ToString() + ' ' + 'Comment')
    if ([string]::IsNullOrWhiteSpace($comment)) { throw [Exception] 'Need a comment' }
}
$script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'comment:' + ' ' + $comment
$script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
if ($doEcho) { Write-Host $script:taskLine }
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
    Searched
   }
"@
}

#endregion
##################################################################################################################
$script:taskName = 'help'
#region
##################################################################################################################
try {
    if ($help) {
        $script:taskLine = ('Datetime Stamp' + ':' + '[' + [System.DateTime]::UtcNow.ToString() + ']')
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = "# SQL2X Generated code based on a SQL Server Schema
# SQL2X Version: 0.d
# http://sql2x.azurewebsites.net/
# Generated Date: 10/10/2018 2:46:41 AM
# Template: sql2x.PowerShellGenerator.CifudeScript
<#
.\tine_script_run_intelligence.ps1 -doEcho       -doSql2x -comment test -create
.\tine_script_run_intelligence.ps1 -doEcho       -doSql2x -comment test -insert
.\tine_script_run_intelligence.ps1 -doEcho       -doSql2x -comment test -fetch                -tineScriptRunIntelligenceId:([guid]'')
.\tine_script_run_intelligence.ps1 -returnValue  -doSql2x -comment test -fetchValue:column    -tineScriptRunIntelligenceId:([guid]'')
.\tine_script_run_intelligence.ps1 -doEcho       -doSql2x -comment test -updateByPrimaryKey   -show -tineScriptRunIntelligenceId:([guid]'')
.\tine_script_run_intelligence.ps1 -doEcho       -doSql2x -comment test -updateByForeignKeys  -show
.\tine_script_run_intelligence.ps1 -doEcho       -doSql2x -comment test -deleteAll
.\tine_script_run_intelligence.ps1 -doEcho       -doSql2x -comment test -delete               -tineScriptRunIntelligenceId:([guid]'')
.\tine_script_run_intelligence.ps1 -doEcho       -doSql2x -comment test -drop
.\tine_script_run_intelligence.ps1 -doEcho       -doSql2x -comment test -show
.\tine_script_run_intelligence.ps1 -doEcho       -doSql2x -comment test -help
.\tine_script_run_intelligence.ps1 -doEcho       -doSql2x -comment test -create -insert -fetch -fetchValue:column -updateByPrimaryKey -delete -drop -show -help -tineScriptRunIntelligenceId:([guid]'')
#>"
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ('storageConnectionString' + ' ' + '=' + ' ' + '[' + $script:storageConnectionString + ']')
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.Guid] tineScriptRunIntelligenceId = '00000000-0000-0000-0000-000000000000'")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.String] tineScriptRunIntelligencePartitionKey = $env:ComputerName")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.String] tineScriptRunIntelligenceRowKey = [System.DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ss.fffZ')")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.Guid] tineMachineId = '00000000-0000-0000-0000-000000000000'")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.Guid] tineCreationId = '00000000-0000-0000-0000-000000000000'")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.String] tineTaskScriptName = ''")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.String] tineTaskScriptMachineOutcomeRcd = ''")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.Int32] tineTaskScriptOutcomePositiveCount = 0")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.Int32] tineTaskScriptOutcomeNegativeCount = 0")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.Guid] userId = '00000000-0000-0000-0000-000000000000'")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.DateTime] dateTime = '1601.01.01T00:00:00Z'")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

    }
} catch [Exception] {
    if ($rethrow) {
        Write-Host ($script:taskName + ' ' + 'Exception; ' + $_.Exception.Message)
        try { Set-Location $script:startupDirectory } catch { }; throw [Exception] ('Failed to; ' + $script:taskName)
    } else {
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + ('Exception:' + ' ' + $script:taskName + ' ' + '[' +  $_.Exception.Message + ']' + ' ' + 'Line:[' + $_.InvocationInfo.ScriptLineNumber + ']')
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doEcho) { Write-Host ( $script:taskLine ) -ForegroundColor Red }
    }
}
#endregion
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
$script:taskName = 'create tine_script_run_intelligence'
#region
##################################################################################################################
try {
    if ($create) {
        # log
        $script:answer = 'yes'
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $script:taskName
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doStep) { $script:answer = Read-Host -Prompt ( $script:taskLine ) }
        elseif ($doEcho) { Write-Host ( $script:taskLine ) }

        if ($script:answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {
            $script:storageContext = New-AzureStorageContext -ConnectionString $script:storageConnectionString

            $script:tableTineScriptRunIntelligence = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunIntelligence' -ErrorAction SilentlyContinue

            if ( $script:tableTineScriptRunIntelligence -ne $null ) {
                Remove-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunIntelligence' -Force
            }

            [int] $script:trials = 0

            # create new table
            $script:tableTineScriptRunIntelligence = $null
            while ($script:tableTineScriptRunIntelligence -eq $null) {
                # wait for an escalating number of seconds 
                $script:trials++
                if ($script:trials -gt 10) {
                    throw [Exception] ('Failed to create table')
                }

                Start-Sleep $script:trials

                # create new table
                $script:tableTineScriptRunIntelligence = `
                    New-AzureStorageTable `
                        -Context $script:storageContext `
                        -Name 'tineScriptRunIntelligence'

                if ( $script:tableTineScriptRunIntelligence -ne $null ) {
                    # insert row
                    $tineScriptRunIntelligence = 
                        New-Object `
                            -TypeName Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity `
                            -ArgumentList $tineScriptRunIntelligencePartitionKey, $tineScriptRunIntelligenceRowKey

                    $tineScriptRunIntelligence.Properties.Add( 'tine_script_run_intelligence_id', [System.Guid]$tineScriptRunIntelligenceId)
                    $tineScriptRunIntelligence.Properties.Add( 'tine_script_run_intelligence_partition_key', [System.String]$tineScriptRunIntelligencePartitionKey)
                    $tineScriptRunIntelligence.Properties.Add( 'tine_script_run_intelligence_row_key', [System.String]$tineScriptRunIntelligenceRowKey)
                    $tineScriptRunIntelligence.Properties.Add( 'tine_machine_id', [System.Guid]$tineMachineId)
                    $tineScriptRunIntelligence.Properties.Add( 'tine_creation_id', [System.Guid]$tineCreationId)
                    $tineScriptRunIntelligence.Properties.Add( 'tine_task_script_name', [System.String]$tineTaskScriptName)
                    $tineScriptRunIntelligence.Properties.Add( 'tine_task_script_machine_outcome_rcd', [System.String]$tineTaskScriptMachineOutcomeRcd)
                    $tineScriptRunIntelligence.Properties.Add( 'tine_task_script_outcome_positive_count', [System.Int32]$tineTaskScriptOutcomePositiveCount)
                    $tineScriptRunIntelligence.Properties.Add( 'tine_task_script_outcome_negative_count', [System.Int32]$tineTaskScriptOutcomeNegativeCount)
                    $tineScriptRunIntelligence.Properties.Add( 'user_id', [System.Guid]$userId)
                    $tineScriptRunIntelligence.Properties.Add( 'date_time', [System.DateTime]$dateTime)

                    $script:tableTineScriptRunIntelligence.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Insert($tineScriptRunIntelligence)) | Out-Null
                }
            }
        }
        # log
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'end:' + ' ' + $script:taskName
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doEcho) { Write-Host ( $script:taskLine ) }
    }
} catch [Exception] {
    if ($rethrow) {
        Write-Host ($script:taskName + ' ' + 'Exception; ' + $_.Exception.Message)
        try { Set-Location $script:startupDirectory } catch { }; throw [Exception] ('Failed to; ' + $script:taskName)
    } else {
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + ('Exception:' + ' ' + $script:taskName + ' ' + '[' +  $_.Exception.Message + ']' + ' ' + 'Line:[' + $_.InvocationInfo.ScriptLineNumber + ']')
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doEcho) { Write-Host ( $script:taskLine ) -ForegroundColor Red }
    }
} finally {
    if ($script:trials) { try { Remove-Variable -Scope:Script -Name trials } catch {}}
    if ($script:tableTineScriptRunIntelligence) { try { Remove-Variable -Scope:Script -Name tableTineScriptRunIntelligence } catch {}}
    if ($script:storageContext) { try { Remove-Variable -Scope:Script -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'insert to tine_script_run_intelligence'
#region
##################################################################################################################
try {
    if ($insert) {
        # log
        $script:answer = 'yes'
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $script:taskName
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doStep) { $script:answer = Read-Host -Prompt ( $script:taskLine ) }
        elseif ($doEcho) { Write-Host ( $script:taskLine ) }

        # validate tineScriptRunIntelligenceId ( primary key )
        if ($tineScriptRunIntelligenceId -eq '00000000-0000-0000-0000-000000000000') {
            # get a decent primary key, todo; check datatype
            [System.Guid] $tineScriptRunIntelligenceId = [System.Guid]::NewGuid()

            # return primary key to caller
            $script:tineScriptRunIntelligenceData = [TineScriptRunIntelligenceData]::new()
            $script:tineScriptRunIntelligenceData.tineScriptRunIntelligenceId = $tineScriptRunIntelligenceId
            $script:tineScriptRunIntelligenceDataList += $script:tineScriptRunIntelligenceData
        }

        if ($script:answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {

            # connect and validate table
            $script:storageContext = New-AzureStorageContext -ConnectionString $script:storageConnectionString

            $script:tableTineScriptRunIntelligence = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunIntelligence' -ErrorAction SilentlyContinue

            if ( $script:tableTineScriptRunIntelligence -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_intelligence table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # insert row
                $tineScriptRunIntelligence =
                    New-Object `
                        -TypeName Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity `
                        -ArgumentList $tineScriptRunIntelligencePartitionKey, $tineScriptRunIntelligenceRowKey

                $tineScriptRunIntelligence.Properties.Add( 'tine_script_run_intelligence_id', [System.Guid]$tineScriptRunIntelligenceId)
                $tineScriptRunIntelligence.Properties.Add( 'tine_script_run_intelligence_partition_key', [System.String]$tineScriptRunIntelligencePartitionKey)
                $tineScriptRunIntelligence.Properties.Add( 'tine_script_run_intelligence_row_key', [System.String]$tineScriptRunIntelligenceRowKey)
                $tineScriptRunIntelligence.Properties.Add( 'tine_machine_id', [System.Guid]$tineMachineId)
                $tineScriptRunIntelligence.Properties.Add( 'tine_creation_id', [System.Guid]$tineCreationId)
                $tineScriptRunIntelligence.Properties.Add( 'tine_task_script_name', [System.String]$tineTaskScriptName)
                $tineScriptRunIntelligence.Properties.Add( 'tine_task_script_machine_outcome_rcd', [System.String]$tineTaskScriptMachineOutcomeRcd)
                $tineScriptRunIntelligence.Properties.Add( 'tine_task_script_outcome_positive_count', [System.Int32]$tineTaskScriptOutcomePositiveCount)
                $tineScriptRunIntelligence.Properties.Add( 'tine_task_script_outcome_negative_count', [System.Int32]$tineTaskScriptOutcomeNegativeCount)
                $tineScriptRunIntelligence.Properties.Add( 'user_id', [System.Guid]$userId)
                $tineScriptRunIntelligence.Properties.Add( 'date_time', [System.DateTime]$dateTime)

                $script:tableTineScriptRunIntelligence.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Insert($tineScriptRunIntelligence)) | Out-Null
            }
        }
        # log
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'end:' + ' ' + $script:taskName
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doEcho) { Write-Host ( $script:taskLine ) }
    }
} catch [Exception] {
    if ($rethrow) {
        Write-Host ($script:taskName + ' ' + 'Exception; ' + $_.Exception.Message)
        try { Set-Location $script:startupDirectory } catch { }; throw [Exception] ('Failed to; ' + $script:taskName)
    } else {
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + ('Exception:' + ' ' + $script:taskName + ' ' + '[' +  $_.Exception.Message + ']' + ' ' + 'Line:[' + $_.InvocationInfo.ScriptLineNumber + ']')
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doEcho) { Write-Host ( $script:taskLine ) -ForegroundColor Red }
    }
} finally {
    if ($tineScriptRunIntelligence) { try { Remove-Variable -Scope:Script -Name tineScriptRunIntelligence } catch {}}
    if ($script:tableTineScriptRunIntelligence) { try { Remove-Variable -Scope:Script -Name tableTineScriptRunIntelligence } catch {}}
    if ($script:storageContext) { try { Remove-Variable -Scope:Script -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'fetch from tine_script_run_intelligence'
#region
##################################################################################################################
try {
    if ($fetch) {
        # log
        $script:answer = 'yes'
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $script:taskName
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doStep) { $script:answer = Read-Host -Prompt ( $script:taskLine ) }
        elseif ($doEcho) { Write-Host ( $script:taskLine ) }

        if ($script:answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {
            # connect and validate table
            $script:storageContext = New-AzureStorageContext -ConnectionString $script:storageConnectionString

            if ( !$whatIf ) {
                $script:tableTineScriptRunIntelligence = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunIntelligence' -ErrorAction SilentlyContinue
            }

            if ( $script:tableTineScriptRunIntelligence -eq $null -and !$whatIf ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_intelligence table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_script_run_intelligence_id' )
                $script:list.Add( 'tine_script_run_intelligence_partition_key' )
                $script:list.Add( 'tine_script_run_intelligence_row_key' )
                $script:list.Add( 'tine_machine_id' )
                $script:list.Add( 'tine_creation_id' )
                $script:list.Add( 'tine_task_script_name' )
                $script:list.Add( 'tine_task_script_machine_outcome_rcd' )
                $script:list.Add( 'tine_task_script_outcome_positive_count' )
                $script:list.Add( 'tine_task_script_outcome_negative_count' )
                $script:list.Add( 'user_id' )
                $script:list.Add( 'date_time' )

                # filter tineScriptRunIntelligenceId ( primary key )
                if ($PSBoundParameters.ContainsKey('tineScriptRunIntelligenceId')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_script_run_intelligence_id eq guid'''+ $tineScriptRunIntelligenceId + ''''
                }

                # filter tineMachineId ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineMachineId')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_machine_id eq guid'''+ $tineMachineId + ''''
                }

                # filter tineCreationId ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineCreationId')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_creation_id eq guid'''+ $tineCreationId + ''''
                }

                # filter tineTaskScriptMachineOutcomeRcd ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptMachineOutcomeRcd')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_task_script_machine_outcome_rcd eq '''+ $tineTaskScriptMachineOutcomeRcd + ''''
                }

                # filter tineScriptRunIntelligencePartitionKey ( string column )
                if ($PSBoundParameters.ContainsKey('tineScriptRunIntelligencePartitionKey')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_script_run_intelligence_partition_key eq '''+ $tineScriptRunIntelligencePartitionKey + ''''
                }

                # filter tineScriptRunIntelligenceRowKey ( string column )
                if ($PSBoundParameters.ContainsKey('tineScriptRunIntelligenceRowKey')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_script_run_intelligence_row_key eq '''+ $tineScriptRunIntelligenceRowKey + ''''
                }

                # filter tineTaskScriptName ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptName')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_task_script_name eq '''+ $tineTaskScriptName + ''''
                }

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptRunIntelligence = $script:tableTineScriptRunIntelligence.CloudTable.ExecuteQuery($script:query)
                }

                # log count
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'Query Results' + ';' + ' ' + '[' + ($tineScriptRunIntelligence | Measure-Object).Count + ']'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }

                # transfer values from query to internal objects
                if ($script:tineScriptRunIntelligenceData) { try { Remove-Variable -Scope:Script -Name tineScriptRunIntelligenceData } catch {}}
                if ($script:tineScriptRunIntelligenceDataList) { try { Remove-Variable -Scope:Script -Name tineScriptRunIntelligenceDataList } catch {}}

                $script:tineScriptRunIntelligenceDataList = @()

                if (-not [string]::IsNullOrEmpty($tineScriptRunIntelligence)) {
                    foreach ($entity in $tineScriptRunIntelligence) {
                        $script:tineScriptRunIntelligenceData = [TineScriptRunIntelligenceData]::new()
                        $script:tineScriptRunIntelligenceData.tineScriptRunIntelligencePartitionKey = $env:ComputerName
                        $script:tineScriptRunIntelligenceData.tineScriptRunIntelligenceRowKey = [System.DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ss.fffZ')

                        $entity.Properties.Keys | 
                            ForEach-Object {
                                switch ($_) {
                                    'tine_script_run_intelligence_id' { $script:tineScriptRunIntelligenceData.tineScriptRunIntelligenceId = $entity.Properties[$_].PropertyAsObject }
                                    'tine_machine_id' { $script:tineScriptRunIntelligenceData.tineMachineId = $entity.Properties[$_].PropertyAsObject }
                                    'tine_creation_id' { $script:tineScriptRunIntelligenceData.tineCreationId = $entity.Properties[$_].PropertyAsObject }
                                    'tine_task_script_name' { $script:tineScriptRunIntelligenceData.tineTaskScriptName = $entity.Properties[$_].PropertyAsObject }
                                    'tine_task_script_machine_outcome_rcd' { $script:tineScriptRunIntelligenceData.tineTaskScriptMachineOutcomeRcd = $entity.Properties[$_].PropertyAsObject }
                                    'tine_task_script_outcome_positive_count' { $script:tineScriptRunIntelligenceData.tineTaskScriptOutcomePositiveCount = $entity.Properties[$_].PropertyAsObject }
                                    'tine_task_script_outcome_negative_count' { $script:tineScriptRunIntelligenceData.tineTaskScriptOutcomeNegativeCount = $entity.Properties[$_].PropertyAsObject }
                                    'user_id' { $script:tineScriptRunIntelligenceData.userId = $entity.Properties[$_].PropertyAsObject }
                                    'date_time' { $script:tineScriptRunIntelligenceData.dateTime = $entity.Properties[$_].PropertyAsObject }
                                }
                            }
                        $script:tineScriptRunIntelligenceDataList += $script:tineScriptRunIntelligenceData
                    }
                }

                # check if any column parameter is chosen
                [boolean] $includeAll = $true
                foreach ($parameter in $PSBoundParameters.Keys) {
                    $includeAll -= ($parameter -eq 'tineScriptRunIntelligenceId')
                    $includeAll -= ($parameter -eq 'tineScriptRunIntelligencePartitionKey')
                    $includeAll -= ($parameter -eq 'tineScriptRunIntelligenceRowKey')
                    $includeAll -= ($parameter -eq 'tineMachineId')
                    $includeAll -= ($parameter -eq 'tineCreationId')
                    $includeAll -= ($parameter -eq 'tineTaskScriptName')
                    $includeAll -= ($parameter -eq 'tineTaskScriptMachineOutcomeRcd')
                    $includeAll -= ($parameter -eq 'tineTaskScriptOutcomePositiveCount')
                    $includeAll -= ($parameter -eq 'tineTaskScriptOutcomeNegativeCount')
                    $includeAll -= ($parameter -eq 'userId')
                    $includeAll -= ($parameter -eq 'dateTime')
                }

                # property echo
                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineScriptRunIntelligenceId') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineScriptRunIntelligenceId' + '; [' + $tineScriptRunIntelligenceData.tineScriptRunIntelligenceId + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineScriptRunIntelligencePartitionKey') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineScriptRunIntelligencePartitionKey' + '; [' + $tineScriptRunIntelligenceData.tineScriptRunIntelligencePartitionKey + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineScriptRunIntelligenceRowKey') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineScriptRunIntelligenceRowKey' + '; [' + $tineScriptRunIntelligenceData.tineScriptRunIntelligenceRowKey + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineMachineId') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineMachineId' + '; [' + $tineScriptRunIntelligenceData.tineMachineId + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineCreationId') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineCreationId' + '; [' + $tineScriptRunIntelligenceData.tineCreationId + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskScriptName') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskScriptName' + '; [' + $tineScriptRunIntelligenceData.tineTaskScriptName + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskScriptMachineOutcomeRcd') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskScriptMachineOutcomeRcd' + '; [' + $tineScriptRunIntelligenceData.tineTaskScriptMachineOutcomeRcd + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskScriptOutcomePositiveCount') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskScriptOutcomePositiveCount' + '; [' + $tineScriptRunIntelligenceData.tineTaskScriptOutcomePositiveCount + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskScriptOutcomeNegativeCount') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskScriptOutcomeNegativeCount' + '; [' + $tineScriptRunIntelligenceData.tineTaskScriptOutcomeNegativeCount + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('userId') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'userId' + '; [' + $tineScriptRunIntelligenceData.userId + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('dateTime') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'dateTime' + '; [' + $tineScriptRunIntelligenceData.dateTime + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }
            }
        }
        # log
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'end:' + ' ' + $script:taskName
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doEcho) { Write-Host ( $script:taskLine ) }
    }
} catch [Exception] {
    if ($rethrow) {
        Write-Host ($script:taskName + ' ' + 'Exception; ' + $_.Exception.Message)
        try { Set-Location $script:startupDirectory } catch { }; throw [Exception] ('Failed to; ' + $script:taskName)
    } else {
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + ('Exception:' + ' ' + $script:taskName + ' ' + '[' +  $_.Exception.Message + ']' + ' ' + 'Line:[' + $_.InvocationInfo.ScriptLineNumber + ']')
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doEcho) { Write-Host ( $script:taskLine ) -ForegroundColor Red }
    }
} finally {
    if ($script:output) { try { Remove-Variable -Scope:Script -Name output } catch {}}
    if ($script:list) { try { Remove-Variable -Scope:Script -Name list } catch {}}
    if ($script:query) { try { Remove-Variable -Scope:Script -Name query } catch {}}
    if ($tineScriptRunIntelligence) { try { Remove-Variable -Scope:Script -Name tineScriptRunIntelligence } catch {}}
    if ($script:tableTineScriptRunIntelligence) { try { Remove-Variable -Scope:Script -Name tableTineScriptRunIntelligence } catch {}}
    if ($script:storageContext) { try { Remove-Variable -Scope:Script -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'update tine_script_run_intelligence'
#region
##################################################################################################################
try {
    if ($updateByPrimaryKey) {
        # log
        $script:answer = 'yes'
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $script:taskName
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doStep) { $script:answer = Read-Host -Prompt ( $script:taskLine ) }
        elseif ($doEcho) { Write-Host ( $script:taskLine ) }

        if ($script:answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {
            # connect and validate table
            $script:storageContext = New-AzureStorageContext -ConnectionString $script:storageConnectionString

            if ( !$whatIf ) {
                $script:tableTineScriptRunIntelligence = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunIntelligence' -ErrorAction SilentlyContinue
            }

            if ( $script:tableTineScriptRunIntelligence -eq $null -and !$whatIf ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_intelligence table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]


                $script:query.FilterString = 'tine_script_run_intelligence_id eq guid'''+ $tineScriptRunIntelligenceId + ''''
                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptRunIntelligenceForUpdate = $script:tableTineScriptRunIntelligence.CloudTable.ExecuteQuery($script:query)
                }

                foreach ( $item in $tineScriptRunIntelligenceForUpdate ) {
                    [string] $partitionKeyLocal = $item.PartitionKey
                    [string] $rowKeyLocal = $item.RowKey

                    # change task value
                    [Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity] $tineScriptRunIntelligence = `
                        New-Object 'Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity' $partitionKeyLocal, $rowKeyLocal

                    $tineScriptRunIntelligence.ETag = '*'
                    if ($PSBoundParameters.ContainsKey('tineScriptRunIntelligenceId')) { $tineScriptRunIntelligence.Properties.Add( 'tine_script_run_intelligence_id', [System.Guid]$tineScriptRunIntelligenceId) }
                    if ($PSBoundParameters.ContainsKey('tineScriptRunIntelligencePartitionKey')) { $tineScriptRunIntelligence.Properties.Add( 'tine_script_run_intelligence_partition_key', [System.String]$tineScriptRunIntelligencePartitionKey) }
                    if ($PSBoundParameters.ContainsKey('tineScriptRunIntelligenceRowKey')) { $tineScriptRunIntelligence.Properties.Add( 'tine_script_run_intelligence_row_key', [System.String]$tineScriptRunIntelligenceRowKey) }
                    if ($PSBoundParameters.ContainsKey('tineMachineId')) { $tineScriptRunIntelligence.Properties.Add( 'tine_machine_id', [System.Guid]$tineMachineId) }
                    if ($PSBoundParameters.ContainsKey('tineCreationId')) { $tineScriptRunIntelligence.Properties.Add( 'tine_creation_id', [System.Guid]$tineCreationId) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptName')) { $tineScriptRunIntelligence.Properties.Add( 'tine_task_script_name', [System.String]$tineTaskScriptName) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptMachineOutcomeRcd')) { $tineScriptRunIntelligence.Properties.Add( 'tine_task_script_machine_outcome_rcd', [System.String]$tineTaskScriptMachineOutcomeRcd) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomePositiveCount')) { $tineScriptRunIntelligence.Properties.Add( 'tine_task_script_outcome_positive_count', [System.Int32]$tineTaskScriptOutcomePositiveCount) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeNegativeCount')) { $tineScriptRunIntelligence.Properties.Add( 'tine_task_script_outcome_negative_count', [System.Int32]$tineTaskScriptOutcomeNegativeCount) }
                    if ($PSBoundParameters.ContainsKey('userId')) { $tineScriptRunIntelligence.Properties.Add( 'user_id', [System.Guid]$userId) }
                    if ($PSBoundParameters.ContainsKey('dateTime')) { $tineScriptRunIntelligence.Properties.Add( 'date_time', [System.DateTime]$dateTime) }

                    $script:tableTineScriptRunIntelligence.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Merge($tineScriptRunIntelligence)) | Out-Null
                }

                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'updated' + ':' + ' ' + $script:query.FilterString
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
            }
        }
        # log
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'end:' + ' ' + $script:taskName
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doEcho) { Write-Host ( $script:taskLine ) }
    }
} catch [Exception] {
    if ($rethrow) {
        Write-Host ($script:taskName + ' ' + 'Exception; ' + $_.Exception.Message)
        try { Set-Location $script:startupDirectory } catch { }; throw [Exception] ('Failed to; ' + $script:taskName)
    } else {
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + ('Exception:' + ' ' + $script:taskName + ' ' + '[' +  $_.Exception.Message + ']' + ' ' + 'Line:[' + $_.InvocationInfo.ScriptLineNumber + ']')
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doEcho) { Write-Host ( $script:taskLine ) -ForegroundColor Red }
    }
} finally {
    if ($tineScriptRunIntelligenceForUpdate) { try { Remove-Variable -Scope:Script -Name tineScriptRunIntelligenceForUpdate } catch {}}
    if ($script:tableTineScriptRunIntelligence) { try { Remove-Variable -Scope:Script -Name tableTineScriptRunIntelligence } catch {}}
    if ($partitionKeyLocal) { try { Remove-Variable -Scope:Script -Name partitionKeyLocal } catch {}}
    if ($rowKeyLocal) { try { Remove-Variable -Scope:Script -Name rowKeyLocal } catch {}}
    if ($tineScriptRunIntelligence) { try { Remove-Variable -Scope:Script -Name tineScriptRunIntelligence } catch {}}
    if ($script:list) { try { Remove-Variable -Scope:Script -Name list } catch {}}
    if ($script:query) { try { Remove-Variable -Scope:Script -Name query } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'update tine_script_run_intelligence by foreign keys'
#region
##################################################################################################################
try {
    if ($updateByForeignKeys) {
        # log
        $script:answer = 'yes'
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $script:taskName
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doStep) { $script:answer = Read-Host -Prompt ( $script:taskLine ) }
        elseif ($doEcho) { Write-Host ( $script:taskLine ) }

        if ($script:answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {
            # connect and validate table
            $script:storageContext = New-AzureStorageContext -ConnectionString $script:storageConnectionString

            if ( !$whatIf ) {
                $script:tableTineScriptRunIntelligence = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunIntelligence' -ErrorAction SilentlyContinue
            }

            if ( $script:tableTineScriptRunIntelligence -eq $null -and !$whatIf ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_intelligence table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_script_run_intelligence_id' )
                $script:list.Add( 'tine_script_run_intelligence_partition_key' )
                $script:list.Add( 'tine_script_run_intelligence_row_key' )
                $script:list.Add( 'tine_machine_id' )
                $script:list.Add( 'tine_creation_id' )
                $script:list.Add( 'tine_task_script_name' )
                $script:list.Add( 'tine_task_script_machine_outcome_rcd' )
                $script:list.Add( 'tine_task_script_outcome_positive_count' )
                $script:list.Add( 'tine_task_script_outcome_negative_count' )
                $script:list.Add( 'user_id' )
                $script:list.Add( 'date_time' )

                # filter tineScriptRunIntelligenceId ( primary key )
                if ($PSBoundParameters.ContainsKey('tineScriptRunIntelligenceId')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_script_run_intelligence_id eq guid'''+ $tineScriptRunIntelligenceId + ''''
                }

                # filter tineMachineId ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineMachineId')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_machine_id eq guid'''+ $tineMachineId + ''''
                }

                # filter tineCreationId ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineCreationId')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_creation_id eq guid'''+ $tineCreationId + ''''
                }

                # filter tineTaskScriptMachineOutcomeRcd ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptMachineOutcomeRcd')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_task_script_machine_outcome_rcd eq '''+ $tineTaskScriptMachineOutcomeRcd + ''''
                }

                # filter tineScriptRunIntelligencePartitionKey ( string column )
                if ($PSBoundParameters.ContainsKey('tineScriptRunIntelligencePartitionKey')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_script_run_intelligence_partition_key eq '''+ $tineScriptRunIntelligencePartitionKey + ''''
                }

                # filter tineScriptRunIntelligenceRowKey ( string column )
                if ($PSBoundParameters.ContainsKey('tineScriptRunIntelligenceRowKey')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_script_run_intelligence_row_key eq '''+ $tineScriptRunIntelligenceRowKey + ''''
                }

                # filter tineTaskScriptName ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptName')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_task_script_name eq '''+ $tineTaskScriptName + ''''
                }

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptRunIntelligenceForUpdate = $script:tableTineScriptRunIntelligence.CloudTable.ExecuteQuery($script:query)
                }

                foreach ( $item in $tineScriptRunIntelligenceForUpdate ) {
                    [string] $partitionKeyLocal = $item.PartitionKey
                    [string] $rowKeyLocal = $item.RowKey

                    # change task value
                    [Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity] $tineScriptRunIntelligence = `
                        New-Object 'Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity' $partitionKeyLocal, $rowKeyLocal

                    $tineScriptRunIntelligence.ETag = '*'
                    if ($PSBoundParameters.ContainsKey('tineScriptRunIntelligenceId')) { $tineScriptRunIntelligence.Properties.Add( 'tine_script_run_intelligence_id', [System.Guid]$tineScriptRunIntelligenceId) }
                    if ($PSBoundParameters.ContainsKey('tineScriptRunIntelligencePartitionKey')) { $tineScriptRunIntelligence.Properties.Add( 'tine_script_run_intelligence_partition_key', [System.String]$tineScriptRunIntelligencePartitionKey) }
                    if ($PSBoundParameters.ContainsKey('tineScriptRunIntelligenceRowKey')) { $tineScriptRunIntelligence.Properties.Add( 'tine_script_run_intelligence_row_key', [System.String]$tineScriptRunIntelligenceRowKey) }
                    if ($PSBoundParameters.ContainsKey('tineMachineId')) { $tineScriptRunIntelligence.Properties.Add( 'tine_machine_id', [System.Guid]$tineMachineId) }
                    if ($PSBoundParameters.ContainsKey('tineCreationId')) { $tineScriptRunIntelligence.Properties.Add( 'tine_creation_id', [System.Guid]$tineCreationId) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptName')) { $tineScriptRunIntelligence.Properties.Add( 'tine_task_script_name', [System.String]$tineTaskScriptName) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptMachineOutcomeRcd')) { $tineScriptRunIntelligence.Properties.Add( 'tine_task_script_machine_outcome_rcd', [System.String]$tineTaskScriptMachineOutcomeRcd) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomePositiveCount')) { $tineScriptRunIntelligence.Properties.Add( 'tine_task_script_outcome_positive_count', [System.Int32]$tineTaskScriptOutcomePositiveCount) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeNegativeCount')) { $tineScriptRunIntelligence.Properties.Add( 'tine_task_script_outcome_negative_count', [System.Int32]$tineTaskScriptOutcomeNegativeCount) }
                    if ($PSBoundParameters.ContainsKey('userId')) { $tineScriptRunIntelligence.Properties.Add( 'user_id', [System.Guid]$userId) }
                    if ($PSBoundParameters.ContainsKey('dateTime')) { $tineScriptRunIntelligence.Properties.Add( 'date_time', [System.DateTime]$dateTime) }

                    $script:tableTineScriptRunIntelligence.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Merge($tineScriptRunIntelligence)) | Out-Null
                }

                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'updated' + ':' + ' ' + $script:query.FilterString
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
            }
        }
        # log
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'end:' + ' ' + $script:taskName
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doEcho) { Write-Host ( $script:taskLine ) }
    }
} catch [Exception] {
    if ($rethrow) {
        Write-Host ($script:taskName + ' ' + 'Exception; ' + $_.Exception.Message)
        try { Set-Location $script:startupDirectory } catch { }; throw [Exception] ('Failed to; ' + $script:taskName)
    } else {
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + ('Exception:' + ' ' + $script:taskName + ' ' + '[' +  $_.Exception.Message + ']' + ' ' + 'Line:[' + $_.InvocationInfo.ScriptLineNumber + ']')
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doEcho) { Write-Host ( $script:taskLine ) -ForegroundColor Red }
    }
} finally {
    if ($tineScriptRunIntelligenceForUpdate) { try { Remove-Variable -Scope:Script -Name tineScriptRunIntelligenceForUpdate } catch {}}
    if ($script:tableTineScriptRunIntelligence) { try { Remove-Variable -Scope:Script -Name tableTineScriptRunIntelligence } catch {}}
    if ($partitionKeyLocal) { try { Remove-Variable -Scope:Script -Name partitionKeyLocal } catch {}}
    if ($rowKeyLocal) { try { Remove-Variable -Scope:Script -Name rowKeyLocal } catch {}}
    if ($tineScriptRunIntelligence) { try { Remove-Variable -Scope:Script -Name tineScriptRunIntelligence } catch {}}
    if ($script:list) { try { Remove-Variable -Scope:Script -Name list } catch {}}
    if ($script:query) { try { Remove-Variable -Scope:Script -Name query } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'delete from tine_script_run_intelligence'
#region
##################################################################################################################
try {
    if ($delete) {
        # log
        $script:answer = 'yes'
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $script:taskName
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doStep) { $script:answer = Read-Host -Prompt ( $script:taskLine ) }
        elseif ($doEcho) { Write-Host ( $script:taskLine ) }

        if ($script:answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {
            # connect and validate table
            $script:storageContext = New-AzureStorageContext -ConnectionString $script:storageConnectionString

            $script:tableTineScriptRunIntelligence = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunIntelligence' -ErrorAction SilentlyContinue

            if ( $script:tableTineScriptRunIntelligence -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_intelligence table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_script_run_intelligence_id' )

                $script:query.FilterString = 'tine_script_run_intelligence_id eq guid'''+ $tineScriptRunIntelligenceId + ''''
                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptRunIntelligenceForDelete = $script:tableTineScriptRunIntelligence.CloudTable.ExecuteQuery($script:query)
                }

                # delete selected rows
                foreach ( $tineScriptRunIntelligenceItem in $tineScriptRunIntelligenceForDelete ) {
                    $script:tableTineScriptRunIntelligence.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Delete($tineScriptRunIntelligenceItem)) | Out-Null
                }
            }
        }
        # log
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'end:' + ' ' + $script:taskName
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doEcho) { Write-Host ( $script:taskLine ) }
    }
} catch [Exception] {
    if ($rethrow) {
        Write-Host ($script:taskName + ' ' + 'Exception; ' + $_.Exception.Message)
        try { Set-Location $script:startupDirectory } catch { }; throw [Exception] ('Failed to; ' + $script:taskName)
    } else {
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + ('Exception:' + ' ' + $script:taskName + ' ' + '[' +  $_.Exception.Message + ']' + ' ' + 'Line:[' + $_.InvocationInfo.ScriptLineNumber + ']')
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doEcho) { Write-Host ( $script:taskLine ) -ForegroundColor Red }
    }
} finally {
    if ($script:list) { try { Remove-Variable -Scope:Script -Name list } catch {}}
    if ($script:query) { try { Remove-Variable -Scope:Script -Name query } catch {}}
    if ($tineScriptRunIntelligenceForDelete) { try { Remove-Variable -Scope:Script -Name tineScriptRunIntelligenceForDelete } catch {}}
    if ($tineScriptRunIntelligenceItem) { try { Remove-Variable -Scope:Script -Name tineScriptRunIntelligenceItem } catch {}}
    if ($script:tableTineScriptRunIntelligence) { try { Remove-Variable -Scope:Script -Name tableTineScriptRunIntelligence } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'fetch value from tine_script_run_intelligence'
#region
##################################################################################################################
try {
    if ($fetchValue -ne '') {
        # log
        $script:answer = 'yes'
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $script:taskName
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doStep) { $script:answer = Read-Host -Prompt ( $script:taskLine ) }
        elseif ($doEcho) { Write-Host ( $script:taskLine ) }

        if ($script:answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {
            # connect and validate table
            $script:storageContext = New-AzureStorageContext -ConnectionString $script:storageConnectionString

            if ( !$whatIf ) {
                $script:tableTineScriptRunIntelligence = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunIntelligence' -ErrorAction SilentlyContinue
            }

            if ( $script:tableTineScriptRunIntelligence -eq $null -and !$whatIf ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_intelligence table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( $fetchValue )

                # filter tineScriptRunIntelligenceId ( primary key )
                if ($PSBoundParameters.ContainsKey('tineScriptRunIntelligenceId')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_script_run_intelligence_id eq guid'''+ $tineScriptRunIntelligenceId + ''''
                }

                # filter tineMachineId ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineMachineId')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_machine_id eq guid'''+ $tineMachineId + ''''
                }

                # filter tineCreationId ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineCreationId')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_creation_id eq guid'''+ $tineCreationId + ''''
                }

                # filter tineTaskScriptMachineOutcomeRcd ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptMachineOutcomeRcd')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_task_script_machine_outcome_rcd eq '''+ $tineTaskScriptMachineOutcomeRcd + ''''
                }

                # filter tineScriptRunIntelligencePartitionKey ( string column )
                if ($PSBoundParameters.ContainsKey('tineScriptRunIntelligencePartitionKey')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_script_run_intelligence_partition_key eq '''+ $tineScriptRunIntelligencePartitionKey + ''''
                }

                # filter tineScriptRunIntelligenceRowKey ( string column )
                if ($PSBoundParameters.ContainsKey('tineScriptRunIntelligenceRowKey')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_script_run_intelligence_row_key eq '''+ $tineScriptRunIntelligenceRowKey + ''''
                }

                # filter tineTaskScriptName ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptName')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_task_script_name eq '''+ $tineTaskScriptName + ''''
                }

                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + $script:query.FilterString
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptRunIntelligence = $script:tableTineScriptRunIntelligence.CloudTable.ExecuteQuery($script:query)
                }

                # get value
                [string] $outValue = ''
                if (($tineScriptRunIntelligence | Measure-Object).Count -gt 0) {
                    $outValue = $tineScriptRunIntelligence[0].Properties[$fetchValue].PropertyAsObject

                    # log
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + $fetchValue + '=' + '[' + $outValue + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }
            }
        }
        # log
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'end:' + ' ' + $script:taskName
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doEcho) { Write-Host ( $script:taskLine ) }
    }
} catch [Exception] {
    if ($rethrow) {
        Write-Host ($script:taskName + ' ' + 'Exception; ' + $_.Exception.Message)
        try { Set-Location $script:startupDirectory } catch { }; throw [Exception] ('Failed to; ' + $script:taskName)
    } else {
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + ('Exception:' + ' ' + $script:taskName + ' ' + '[' +  $_.Exception.Message + ']' + ' ' + 'Line:[' + $_.InvocationInfo.ScriptLineNumber + ']')
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doEcho) { Write-Host ( $script:taskLine ) -ForegroundColor Red }
    }
} finally {
    if ($script:list) { try { Remove-Variable -Scope:Script -Name list } catch {}}
    if ($script:query) { try { Remove-Variable -Scope:Script -Name query } catch {}}
    if ($tineScriptRunIntelligence) { try { Remove-Variable -Scope:Script -Name tineScriptRunIntelligence } catch {}}
    if ($script:tableTineScriptRunIntelligence) { try { Remove-Variable -Scope:Script -Name tableTineScriptRunIntelligence } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'delete all from tine_script_run_intelligence'
#region
##################################################################################################################
try {
    if ($deleteAll) {
        # log
        $script:answer = 'yes'
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $script:taskName
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doStep) { $script:answer = Read-Host -Prompt ( $script:taskLine ) }
        elseif ($doEcho) { Write-Host ( $script:taskLine ) }

        if ($script:answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {
            # connect and validate table
            $script:storageContext = New-AzureStorageContext -ConnectionString $script:storageConnectionString

            $script:tableTineScriptRunIntelligence = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunIntelligence' -ErrorAction SilentlyContinue

            if ( $script:tableTineScriptRunIntelligence -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_intelligence table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_script_run_intelligence_id' )

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptRunIntelligenceForDelete = $script:tableTineScriptRunIntelligence.CloudTable.ExecuteQuery($script:query)
                }

                # delete selected rows
                foreach ( $tineScriptRunIntelligenceItem in $tineScriptRunIntelligenceForDelete ) {
                    $script:tableTineScriptRunIntelligence.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Delete($tineScriptRunIntelligenceItem)) | Out-Null
                }
            }
        }
        # log
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'end:' + ' ' + $script:taskName
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doEcho) { Write-Host ( $script:taskLine ) }
    }
} catch [Exception] {
    if ($rethrow) {
        Write-Host ($script:taskName + ' ' + 'Exception; ' + $_.Exception.Message)
        try { Set-Location $script:startupDirectory } catch { }; throw [Exception] ('Failed to; ' + $script:taskName)
    } else {
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + ('Exception:' + ' ' + $script:taskName + ' ' + '[' +  $_.Exception.Message + ']' + ' ' + 'Line:[' + $_.InvocationInfo.ScriptLineNumber + ']')
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doEcho) { Write-Host ( $script:taskLine ) -ForegroundColor Red }
    }
} finally {
    if ($script:list) { try { Remove-Variable -Scope:Script -Name list } catch {}}
    if ($script:query) { try { Remove-Variable -Scope:Script -Name query } catch {}}
    if ($tineScriptRunIntelligenceForDelete) { try { Remove-Variable -Scope:Script -Name tineScriptRunIntelligenceForDelete } catch {}}
    if ($tineScriptRunIntelligenceItem) { try { Remove-Variable -Scope:Script -Name tineScriptRunIntelligenceItem } catch {}}
    if ($script:tableTineScriptRunIntelligence) { try { Remove-Variable -Scope:Script -Name tableTineScriptRunIntelligence } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'show tine_script_run_intelligence'
#region
##################################################################################################################
try {
    if ($show) {
        # log
        $script:answer = 'yes'
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $script:taskName
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doStep) { $script:answer = Read-Host -Prompt ( $script:taskLine ) }
        elseif ($doEcho) { Write-Host ( $script:taskLine ) }

        if ($script:answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {
            # connect and validate table
            $script:storageContext = New-AzureStorageContext -ConnectionString $script:storageConnectionString

            $script:tableTineScriptRunIntelligence = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunIntelligence' -ErrorAction SilentlyContinue

            if ( $script:tableTineScriptRunIntelligence -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_intelligence table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_script_run_intelligence_id' )
                $script:list.Add( 'tine_script_run_intelligence_partition_key' )
                $script:list.Add( 'tine_script_run_intelligence_row_key' )
                $script:list.Add( 'tine_machine_id' )
                $script:list.Add( 'tine_creation_id' )
                $script:list.Add( 'tine_task_script_name' )
                $script:list.Add( 'tine_task_script_machine_outcome_rcd' )
                $script:list.Add( 'tine_task_script_outcome_positive_count' )
                $script:list.Add( 'tine_task_script_outcome_negative_count' )
                $script:list.Add( 'user_id' )
                $script:list.Add( 'date_time' )

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptRunIntelligence = $script:tableTineScriptRunIntelligence.CloudTable.ExecuteQuery($script:query)
                }

                # echo
                [string] $script:output = ''
                $script:output = $tineScriptRunIntelligence `
                    | Format-Table PartitionKey, RowKey, `
                    @{ Label = 'Tine Script Run Intelligence Id'; Expression={$_.Properties['tine_script_run_intelligence_id'].GuidValue} },`
                    @{ Label = 'Tine Script Run Intelligence Partition Key'; Expression={$_.Properties['tine_script_run_intelligence_partition_key'].StringValue} },`
                    @{ Label = 'Tine Script Run Intelligence Row Key'; Expression={$_.Properties['tine_script_run_intelligence_row_key'].StringValue} },`
                    @{ Label = 'Tine Machine Id'; Expression={$_.Properties['tine_machine_id'].GuidValue} },`
                    @{ Label = 'Tine Creation Id'; Expression={$_.Properties['tine_creation_id'].GuidValue} },`
                    @{ Label = 'Tine Task Script Name'; Expression={$_.Properties['tine_task_script_name'].StringValue} },`
                    @{ Label = 'Tine Task Script Machine Outcome'; Expression={$_.Properties['tine_task_script_machine_outcome_rcd'].StringValue} },`
                    @{ Label = 'Tine Task Script Outcome Positive Count'; Expression={$_.Properties['tine_task_script_outcome_positive_count'].StringValue} },`
                    @{ Label = 'Tine Task Script Outcome Negative Count'; Expression={$_.Properties['tine_task_script_outcome_negative_count'].StringValue} },`
                    @{ Label = 'User Id'; Expression={$_.Properties['user_id'].GuidValue} },`
                    @{ Label = 'Date Time'; Expression={$_.Properties['date_time'].StringValue} } `
                    -AutoSize `
                    | Out-String;

                # log
                if ($script:output -ne '') {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + $script:output
                } else {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'no result for ' + 'tine_script_run_intelligence' #+ ': ' + $script:query.FilterString
                }
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
            }
        }
        # log
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'end:' + ' ' + $script:taskName
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doEcho) { Write-Host ( $script:taskLine ) }
    }
} catch [Exception] {
    if ($rethrow) {
        Write-Host ($script:taskName + ' ' + 'Exception; ' + $_.Exception.Message)
        try { Set-Location $script:startupDirectory } catch { }; throw [Exception] ('Failed to; ' + $script:taskName)
    } else {
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + ('Exception:' + ' ' + $script:taskName + ' ' + '[' +  $_.Exception.Message + ']' + ' ' + 'Line:[' + $_.InvocationInfo.ScriptLineNumber + ']')
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doEcho) { Write-Host ( $script:taskLine ) -ForegroundColor Red }
    }
} finally {
    if ($script:output) { try { Remove-Variable -Scope:Script -Name output } catch {}}
    if ($script:list) { try { Remove-Variable -Scope:Script -Name list } catch {}}
    if ($script:query) { try { Remove-Variable -Scope:Script -Name query } catch {}}
    if ($tineScriptRunIntelligence) { try { Remove-Variable -Scope:Script -Name tineScriptRunIntelligence } catch {}}
    if ($script:tableTineScriptRunIntelligence) { try { Remove-Variable -Scope:Script -Name tableTineScriptRunIntelligence } catch {}}
    if ($script:storageContext) { try { Remove-Variable -Scope:Script -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'drop tine_script_run_intelligence'
#region
##################################################################################################################
try {
    if ($drop) {
        # log
        $script:answer = 'yes'
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $script:taskName
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doStep) { $script:answer = Read-Host -Prompt ( $script:taskLine ) }
        elseif ($doEcho) { Write-Host ( $script:taskLine ) }

        if ($script:answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {
            $script:storageContext = New-AzureStorageContext -ConnectionString $script:storageConnectionString

            $script:tableTineScriptRunIntelligence = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunIntelligence' -ErrorAction SilentlyContinue

            if ( $script:tableTineScriptRunIntelligence -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_intelligence table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                Remove-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunIntelligence' -Force
            }
        }
        # log
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'end:' + ' ' + $script:taskName
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doEcho) { Write-Host ( $script:taskLine ) }
    }
} catch [Exception] {
    if ($rethrow) {
        Write-Host ($script:taskName + ' ' + 'Exception; ' + $_.Exception.Message)
        try { Set-Location $script:startupDirectory } catch { }; throw [Exception] ('Failed to; ' + $script:taskName)
    } else {
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + ('Exception:' + ' ' + $script:taskName + ' ' + '[' +  $_.Exception.Message + ']' + ' ' + 'Line:[' + $_.InvocationInfo.ScriptLineNumber + ']')
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doEcho) { Write-Host ( $script:taskLine ) -ForegroundColor Red }
    }
} finally {
    if ($script:tableTineScriptRunIntelligence) { try { Remove-Variable -Scope:Script -Name tableTineScriptRunIntelligence } catch {}}
    if ($script:storageContext) { try { Remove-Variable -Scope:Script -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'mail status'
#region
##################################################################################################################
try {
    $script:answer = 'yes'

    # log
    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $script:taskName
    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
    if ($doStep) { $script:answer = Read-Host -Prompt ( $script:taskLine ) }
    elseif ($doEcho) { Write-Host ( $script:taskLine ) }

    if ($sendMail -and $script:answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x -or $script:mailAnyway)) {
        $script:SMTPClient = New-Object System.Net.Mail.SmtpClient
        $script:SMTPClient.Port = 25 # 587
        $script:SMTPClient.Host = 'smtp.live.com'
        $script:SMTPClient.EnableSsl = $true
        $script:SMTPClient.Timeout = 10000;
        $script:SMTPClient.DeliveryMethod = ([System.Net.Mail.SmtpDeliveryMethod]::Network)
        $script:SMTPClient.UseDefaultCredentials = $false

        $script:SMTPClient.Credentials = New-Object System.Net.NetworkCredential( `
            'xxx' , `
            'xxx' `
            );

        $script:emailMessage = New-Object System.Net.Mail.MailMessage
        $script:emailMessage.From = 'xxx'
        $script:emailMessage.To.Add('xxx')
        $script:emailMessage.Subject = ($env:ComputerName + ' : ' + $MyInvocation.MyCommand.Name)
        $script:emailMessage.Body = $script:htmlLog
        $script:emailMessage.IsBodyHtml = $true
        $script:emailMessage.BodyEncoding = ([System.Text.UTF8Encoding]::UTF8)
        $script:emailMessage.DeliveryNotificationOptions = ([System.Net.Mail.DeliveryNotificationOptions]::OnFailure)

        $script:SMTPClient.Send( $script:emailMessage )
        $script:SMTPClient.Dispose()
    }

    # log
    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'end:' + ' ' + $script:taskName
    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
    if ($doEcho) { Write-Host ( $script:taskLine ) }
} catch [Exception] {
    if ($rethrow) {
        Write-Host ($script:taskName + ' ' + 'Exception; ' + $_.Exception.Message)
        try { Set-Location $script:startupDirectory } catch { }; throw [Exception] ('Failed to; ' + $script:taskName)
    } else {
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + ('Exception:' + ' ' + $script:taskName + ' ' + '[' +  $_.Exception.Message + ']' + ' ' + 'Line:[' + $_.InvocationInfo.ScriptLineNumber + ']')
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doEcho) { Write-Host ( $script:taskLine ) -ForegroundColor Red }
    }
} finally {
    if ($script:SMTPClient) { try { Remove-Variable -Scope:Script -Name SMTPClient } catch {} }
    if ($script:emailMessage) { try { Remove-Variable -Scope:Script -Name emailMessage } catch {} }
}
#endregion
##################################################################################################################
$script:taskName = 'end script:'
#region
##################################################################################################################
$dateTimeStop = [System.DateTime]::UtcNow
$script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + $script:taskName `
    + ' ' + '[' + $MyInvocation.MyCommand.Name `
    + ' ' + $MyInvocation.MyCommand.Arguments + ']' `
    + ' ' + 'from' + ' ' + '[' + $dateTimeStart + ']' `
    + ' ' + 'to' + ' ' + '[' + $dateTimeStop  + ']'
$script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
if ($doEcho) { Write-Host ( $script:taskLine ) }
#endregion
##################################################################################################################
$script:taskName = 'cleanup'
#region
##################################################################################################################
if ($script:storageConnectionString) { try { Remove-Variable -Scope:Script -Name storageConnectionString } catch {}}
if ($script:startupDirectory) { try { Remove-Variable -Scope:Script -Name startupDirectory } catch {} }
if ($script:tineScriptRunIntelligenceData) { try { Remove-Variable -Scope:Script -Name tineScriptRunIntelligenceData } catch {} }

if ($script:mailAnyway) { try { Remove-Variable -Scope:Script -Name mailAnyway } catch {} }
if ($script:answer) { try { Remove-Variable -Scope:Script -Name answer } catch {} }
if ($script:taskLine) { try { Remove-Variable -Scope:Script -Name taskLine } catch {} }
if ($script:taskName) { try { Remove-Variable -Scope:Script -Name taskName } catch {} }

if ($returnHtml -and $script:htmlLog) {
    try { $script:htmlLog; Remove-Variable -Scope:Script -Name htmlLog; return } catch {} }
elseif ($script:htmlLog) {
    try { Remove-Variable -Scope:Script -Name htmlLog } catch {} }
#endregion

if ($returnValue) {
    $outValue
}

if ($returnJson) {
    ConvertTo-Json -InputObject $script:tineScriptRunIntelligenceDataList
}

if ($returnObject) {
    $script:tineScriptRunIntelligenceDataList
}

if ($returnGridView) {
    $script:tineScriptRunIntelligenceDataList | Out-GridView
}
