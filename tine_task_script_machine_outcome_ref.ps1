# SQL2X Generated code based on a SQL Server Schema
# SQL2X Version: 0.d
# http://sql2x.azurewebsites.net/
# Generated Date: 10/18/2018 5:34:04 AM
# Template: sql2x.PowerShellGenerator.CifudeScript
<#
.\tine_task_script_machine_outcome_ref.ps1 -doEcho       -doSql2x -comment test -create
.\tine_task_script_machine_outcome_ref.ps1 -doEcho       -doSql2x -comment test -insert
.\tine_task_script_machine_outcome_ref.ps1 -doEcho       -doSql2x -comment test -fetch                -tineTaskScriptMachineOutcomeRcd:([string]'')
.\tine_task_script_machine_outcome_ref.ps1 -returnValue  -doSql2x -comment test -fetchValue:column    -tineTaskScriptMachineOutcomeRcd:([string]'')
.\tine_task_script_machine_outcome_ref.ps1 -doEcho       -doSql2x -comment test -updateByPrimaryKey   -show -tineTaskScriptMachineOutcomeRcd:([string]'')
.\tine_task_script_machine_outcome_ref.ps1 -doEcho       -doSql2x -comment test -updateByForeignKeys  -show
.\tine_task_script_machine_outcome_ref.ps1 -doEcho       -doSql2x -comment test -deleteAll
.\tine_task_script_machine_outcome_ref.ps1 -doEcho       -doSql2x -comment test -delete               -tineTaskScriptMachineOutcomeRcd:([string]'')
.\tine_task_script_machine_outcome_ref.ps1 -doEcho       -doSql2x -comment test -drop
.\tine_task_script_machine_outcome_ref.ps1 -doEcho       -doSql2x -comment test -show
.\tine_task_script_machine_outcome_ref.ps1 -doEcho       -doSql2x -comment test -help
.\tine_task_script_machine_outcome_ref.ps1 -doEcho       -doSql2x -comment test -create -insert -fetch -fetchValue:column -updateByPrimaryKey -delete -drop -show -help -tineTaskScriptMachineOutcomeRcd:([string]'')
#>
[Diagnostics.CodeAnalysis.SuppressMessageAttribute `
    ('PSPossibleIncorrectComparisonWithNull','')]
param(
    [string]$scriptName = 'CIFUDE ( Create Insert Fetch Update Delete Extras ) for tine_task_script_machine_outcome_ref',
    [string]$scriptStyle = 'original', # original / task
    [string]$scriptStatus = 'status ( todos, learn, learned )',
    [string]$scriptDocumentation = 'links urls, books, people, inspiration',

    [DateTime]$dateTimeStart = [System.DateTime]::UtcNow,
    [DateTime]$dateTimeStop = [System.DateTime]::UtcNow,
    [DateTime]$createdDateTime = '2018.10.18',
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
    [System.String]$tineTaskScriptMachineOutcomeRcd = '',
    [System.String]$tineTaskScriptMachineOutcomeRefPartitionKey = $env:ComputerName,
    [System.String]$tineTaskScriptMachineOutcomeRefRowKey = [System.DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ss.fffZ'),
    [System.String]$tineTaskScriptMachineOutcomeName = '',
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
    ReTasked,
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
# Generated Date: 10/18/2018 5:34:04 AM
# Template: sql2x.PowerShellGenerator.CifudeScript
<#
.\tine_task_script_machine_outcome_ref.ps1 -doEcho       -doSql2x -comment test -create
.\tine_task_script_machine_outcome_ref.ps1 -doEcho       -doSql2x -comment test -insert
.\tine_task_script_machine_outcome_ref.ps1 -doEcho       -doSql2x -comment test -fetch                -tineTaskScriptMachineOutcomeRcd:([string]'')
.\tine_task_script_machine_outcome_ref.ps1 -returnValue  -doSql2x -comment test -fetchValue:column    -tineTaskScriptMachineOutcomeRcd:([string]'')
.\tine_task_script_machine_outcome_ref.ps1 -doEcho       -doSql2x -comment test -updateByPrimaryKey   -show -tineTaskScriptMachineOutcomeRcd:([string]'')
.\tine_task_script_machine_outcome_ref.ps1 -doEcho       -doSql2x -comment test -updateByForeignKeys  -show
.\tine_task_script_machine_outcome_ref.ps1 -doEcho       -doSql2x -comment test -deleteAll
.\tine_task_script_machine_outcome_ref.ps1 -doEcho       -doSql2x -comment test -delete               -tineTaskScriptMachineOutcomeRcd:([string]'')
.\tine_task_script_machine_outcome_ref.ps1 -doEcho       -doSql2x -comment test -drop
.\tine_task_script_machine_outcome_ref.ps1 -doEcho       -doSql2x -comment test -show
.\tine_task_script_machine_outcome_ref.ps1 -doEcho       -doSql2x -comment test -help
.\tine_task_script_machine_outcome_ref.ps1 -doEcho       -doSql2x -comment test -create -insert -fetch -fetchValue:column -updateByPrimaryKey -delete -drop -show -help -tineTaskScriptMachineOutcomeRcd:([string]'')
#>"
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ('storageConnectionString' + ' ' + '=' + ' ' + '[' + $script:storageConnectionString + ']')
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.String] tineTaskScriptMachineOutcomeRcd = ''")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.String] tineTaskScriptMachineOutcomeRefPartitionKey = $env:ComputerName")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.String] tineTaskScriptMachineOutcomeRefRowKey = [System.DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ss.fffZ')")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.String] tineTaskScriptMachineOutcomeName = ''")
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
class TineTaskScriptMachineOutcomeRefData {
    [System.String]$tineTaskScriptMachineOutcomeRcd = ''
    [System.String]$tineTaskScriptMachineOutcomeRefPartitionKey = $env:ComputerName
    [System.String]$tineTaskScriptMachineOutcomeRefRowKey = [System.DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ss.fffZ')
    [System.String]$tineTaskScriptMachineOutcomeName = ''
    [System.Guid]$userId = '00000000-0000-0000-0000-000000000000'
    [System.DateTime]$dateTime = '1601.01.01T00:00:00Z'
}
#endregion
##################################################################################################################
$script:taskName = 'create tine_task_script_machine_outcome_ref'
#region
##################################################################################################################
try {
    if ($create) {
        # log
        $script:answer = 'yes'
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $script:taskName
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doStep) { $script:answer = Read-Host -Prompt ( $script:taskLine ) }
        elseif ($doEcho) { Write-Host ( $script:taskLine ) -ForegroundColor Gray }

        if ($script:answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {
            $script:storageContext = New-AzureStorageContext -ConnectionString $script:storageConnectionString

            $script:tableTineTaskScriptMachineOutcomeRef = Get-AzureStorageTable -Context $script:storageContext -Name 'tineTaskScriptMachineOutcomeRef' -ErrorAction SilentlyContinue

            if ( $script:tableTineTaskScriptMachineOutcomeRef -ne $null ) {
                Remove-AzureStorageTable -Context $script:storageContext -Name 'tineTaskScriptMachineOutcomeRef' -Force
            }

            [int] $script:trials = 0

            # create new table
            $script:tableTineTaskScriptMachineOutcomeRef = $null
            while ($script:tableTineTaskScriptMachineOutcomeRef -eq $null) {
                # wait for an escalating number of seconds 
                $script:trials++
                if ($script:trials -gt 10) {
                    throw [Exception] ('Failed to create table')
                }

                Start-Sleep $script:trials

                # create new table
                $script:tableTineTaskScriptMachineOutcomeRef = `
                    New-AzureStorageTable `
                        -Context $script:storageContext `
                        -Name 'tineTaskScriptMachineOutcomeRef'

                if ( $script:tableTineTaskScriptMachineOutcomeRef -ne $null ) {
                    # insert row
                    $tineTaskScriptMachineOutcomeRef = 
                        New-Object `
                            -TypeName Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity `
                            -ArgumentList $tineTaskScriptMachineOutcomeRefPartitionKey, $tineTaskScriptMachineOutcomeRefRowKey

                    $tineTaskScriptMachineOutcomeRef.Properties.Add( 'tine_task_script_machine_outcome_rcd', [System.String]$tineTaskScriptMachineOutcomeRcd)
                    $tineTaskScriptMachineOutcomeRef.Properties.Add( 'tine_task_script_machine_outcome_ref_partition_key', [System.String]$tineTaskScriptMachineOutcomeRefPartitionKey)
                    $tineTaskScriptMachineOutcomeRef.Properties.Add( 'tine_task_script_machine_outcome_ref_row_key', [System.String]$tineTaskScriptMachineOutcomeRefRowKey)
                    $tineTaskScriptMachineOutcomeRef.Properties.Add( 'tine_task_script_machine_outcome_name', [System.String]$tineTaskScriptMachineOutcomeName)
                    $tineTaskScriptMachineOutcomeRef.Properties.Add( 'user_id', [System.Guid]$userId)
                    $tineTaskScriptMachineOutcomeRef.Properties.Add( 'date_time', [System.DateTime]$dateTime)

                    $script:tableTineTaskScriptMachineOutcomeRef.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Insert($tineTaskScriptMachineOutcomeRef)) | Out-Null
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
    if ($script:tableTineTaskScriptMachineOutcomeRef) { try { Remove-Variable -Scope:Script -Name tableTineTaskScriptMachineOutcomeRef } catch {}}
    if ($script:storageContext) { try { Remove-Variable -Scope:Script -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'insert to tine_task_script_machine_outcome_ref'
#region
##################################################################################################################
try {
    if ($insert) {
        # log
        $script:answer = 'yes'
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $script:taskName
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doStep) { $script:answer = Read-Host -Prompt ( $script:taskLine ) }
        elseif ($doEcho) { Write-Host ( $script:taskLine ) -ForegroundColor Gray }

        # validate tineTaskScriptMachineOutcomeRcd ( primary key )
        if ($tineTaskScriptMachineOutcomeRcd -eq '') {
            # get a decent primary key, todo; check datatype
            [System.Guid] $tineTaskScriptMachineOutcomeRcd = [System.Guid]::NewGuid()

            # return primary key to caller
            $script:tineTaskScriptMachineOutcomeRefData = [TineTaskScriptMachineOutcomeRefData]::new()
            $script:tineTaskScriptMachineOutcomeRefData.tineTaskScriptMachineOutcomeRcd = $tineTaskScriptMachineOutcomeRcd
            $script:tineTaskScriptMachineOutcomeRefDataList += $script:tineTaskScriptMachineOutcomeRefData
        }

        if ($script:answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {

            # connect and validate table
            $script:storageContext = New-AzureStorageContext -ConnectionString $script:storageConnectionString

            $script:tableTineTaskScriptMachineOutcomeRef = Get-AzureStorageTable -Context $script:storageContext -Name 'tineTaskScriptMachineOutcomeRef' -ErrorAction SilentlyContinue

            if ( $script:tableTineTaskScriptMachineOutcomeRef -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task_script_machine_outcome_ref table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # insert row
                $tineTaskScriptMachineOutcomeRef =
                    New-Object `
                        -TypeName Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity `
                        -ArgumentList $tineTaskScriptMachineOutcomeRefPartitionKey, $tineTaskScriptMachineOutcomeRefRowKey

                $tineTaskScriptMachineOutcomeRef.Properties.Add( 'tine_task_script_machine_outcome_rcd', [System.String]$tineTaskScriptMachineOutcomeRcd)
                $tineTaskScriptMachineOutcomeRef.Properties.Add( 'tine_task_script_machine_outcome_ref_partition_key', [System.String]$tineTaskScriptMachineOutcomeRefPartitionKey)
                $tineTaskScriptMachineOutcomeRef.Properties.Add( 'tine_task_script_machine_outcome_ref_row_key', [System.String]$tineTaskScriptMachineOutcomeRefRowKey)
                $tineTaskScriptMachineOutcomeRef.Properties.Add( 'tine_task_script_machine_outcome_name', [System.String]$tineTaskScriptMachineOutcomeName)
                $tineTaskScriptMachineOutcomeRef.Properties.Add( 'user_id', [System.Guid]$userId)
                $tineTaskScriptMachineOutcomeRef.Properties.Add( 'date_time', [System.DateTime]$dateTime)

                $script:tableTineTaskScriptMachineOutcomeRef.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Insert($tineTaskScriptMachineOutcomeRef)) | Out-Null
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
    if ($tineTaskScriptMachineOutcomeRef) { try { Remove-Variable -Scope:Script -Name tineTaskScriptMachineOutcomeRef } catch {}}
    if ($script:tableTineTaskScriptMachineOutcomeRef) { try { Remove-Variable -Scope:Script -Name tableTineTaskScriptMachineOutcomeRef } catch {}}
    if ($script:storageContext) { try { Remove-Variable -Scope:Script -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'fetch from tine_task_script_machine_outcome_ref'
#region
##################################################################################################################
try {
    if ($fetch) {
        # log
        $script:answer = 'yes'
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $script:taskName
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doStep) { $script:answer = Read-Host -Prompt ( $script:taskLine ) }
        elseif ($doEcho) { Write-Host ( $script:taskLine ) -ForegroundColor Gray }

        if ($script:answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {
            # connect and validate table
            $script:storageContext = New-AzureStorageContext -ConnectionString $script:storageConnectionString

            if ( !$whatIf ) {
                $script:tableTineTaskScriptMachineOutcomeRef = Get-AzureStorageTable -Context $script:storageContext -Name 'tineTaskScriptMachineOutcomeRef' -ErrorAction SilentlyContinue
            }

            if ( $script:tableTineTaskScriptMachineOutcomeRef -eq $null -and !$whatIf ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task_script_machine_outcome_ref table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_task_script_machine_outcome_rcd' )
                $script:list.Add( 'tine_task_script_machine_outcome_ref_partition_key' )
                $script:list.Add( 'tine_task_script_machine_outcome_ref_row_key' )
                $script:list.Add( 'tine_task_script_machine_outcome_name' )
                $script:list.Add( 'user_id' )
                $script:list.Add( 'date_time' )

                # filter tineTaskScriptMachineOutcomeRcd ( primary key )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptMachineOutcomeRcd')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_script_machine_outcome_rcd eq '''+ $tineTaskScriptMachineOutcomeRcd + ''''
                }

                # filter tineTaskScriptMachineOutcomeRefPartitionKey ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptMachineOutcomeRefPartitionKey')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_task_script_machine_outcome_ref_partition_key eq '''+ $tineTaskScriptMachineOutcomeRefPartitionKey + ''''
                }

                # filter tineTaskScriptMachineOutcomeRefRowKey ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptMachineOutcomeRefRowKey')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_task_script_machine_outcome_ref_row_key eq '''+ $tineTaskScriptMachineOutcomeRefRowKey + ''''
                }

                # filter tineTaskScriptMachineOutcomeName ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptMachineOutcomeName')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_task_script_machine_outcome_name eq '''+ $tineTaskScriptMachineOutcomeName + ''''
                }

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTaskScriptMachineOutcomeRef = $script:tableTineTaskScriptMachineOutcomeRef.CloudTable.ExecuteQuery($script:query)
                }

                # log count
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'Query Results' + ';' + ' ' + '[' + ($tineTaskScriptMachineOutcomeRef | Measure-Object).Count + ']'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }

                # transfer values from query to internal objects
                if ($script:tineTaskScriptMachineOutcomeRefData) { try { Remove-Variable -Scope:Script -Name tineTaskScriptMachineOutcomeRefData } catch {}}
                if ($script:tineTaskScriptMachineOutcomeRefDataList) { try { Remove-Variable -Scope:Script -Name tineTaskScriptMachineOutcomeRefDataList } catch {}}

                $script:tineTaskScriptMachineOutcomeRefDataList = @()

                if (-not [string]::IsNullOrEmpty($tineTaskScriptMachineOutcomeRef)) {
                    foreach ($entity in $tineTaskScriptMachineOutcomeRef) {
                        $script:tineTaskScriptMachineOutcomeRefData = [TineTaskScriptMachineOutcomeRefData]::new()
                        $script:tineTaskScriptMachineOutcomeRefData.tineTaskScriptMachineOutcomeRefPartitionKey = $env:ComputerName
                        $script:tineTaskScriptMachineOutcomeRefData.tineTaskScriptMachineOutcomeRefRowKey = [System.DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ss.fffZ')

                        $entity.Properties.Keys | 
                            ForEach-Object {
                                switch ($_) {
                                    'tine_task_script_machine_outcome_rcd' { $script:tineTaskScriptMachineOutcomeRefData.tineTaskScriptMachineOutcomeRcd = $entity.Properties[$_].PropertyAsObject }
                                    'tine_task_script_machine_outcome_name' { $script:tineTaskScriptMachineOutcomeRefData.tineTaskScriptMachineOutcomeName = $entity.Properties[$_].PropertyAsObject }
                                    'user_id' { $script:tineTaskScriptMachineOutcomeRefData.userId = $entity.Properties[$_].PropertyAsObject }
                                    'date_time' { $script:tineTaskScriptMachineOutcomeRefData.dateTime = $entity.Properties[$_].PropertyAsObject }
                                }
                            }
                        $script:tineTaskScriptMachineOutcomeRefDataList += $script:tineTaskScriptMachineOutcomeRefData
                    }
                }

                # check if any column parameter is chosen
                [boolean] $includeAll = $true
                foreach ($parameter in $PSBoundParameters.Keys) {
                    $includeAll -= ($parameter -eq 'tineTaskScriptMachineOutcomeRcd')
                    $includeAll -= ($parameter -eq 'tineTaskScriptMachineOutcomeRefPartitionKey')
                    $includeAll -= ($parameter -eq 'tineTaskScriptMachineOutcomeRefRowKey')
                    $includeAll -= ($parameter -eq 'tineTaskScriptMachineOutcomeName')
                    $includeAll -= ($parameter -eq 'userId')
                    $includeAll -= ($parameter -eq 'dateTime')
                }

                # property echo
                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskScriptMachineOutcomeRcd') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskScriptMachineOutcomeRcd' + '; [' + $tineTaskScriptMachineOutcomeRefData.tineTaskScriptMachineOutcomeRcd + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskScriptMachineOutcomeRefPartitionKey') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskScriptMachineOutcomeRefPartitionKey' + '; [' + $tineTaskScriptMachineOutcomeRefData.tineTaskScriptMachineOutcomeRefPartitionKey + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskScriptMachineOutcomeRefRowKey') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskScriptMachineOutcomeRefRowKey' + '; [' + $tineTaskScriptMachineOutcomeRefData.tineTaskScriptMachineOutcomeRefRowKey + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskScriptMachineOutcomeName') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskScriptMachineOutcomeName' + '; [' + $tineTaskScriptMachineOutcomeRefData.tineTaskScriptMachineOutcomeName + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('userId') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'userId' + '; [' + $tineTaskScriptMachineOutcomeRefData.userId + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('dateTime') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'dateTime' + '; [' + $tineTaskScriptMachineOutcomeRefData.dateTime + ']'
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
    if ($tineTaskScriptMachineOutcomeRef) { try { Remove-Variable -Scope:Script -Name tineTaskScriptMachineOutcomeRef } catch {}}
    if ($script:tableTineTaskScriptMachineOutcomeRef) { try { Remove-Variable -Scope:Script -Name tableTineTaskScriptMachineOutcomeRef } catch {}}
    if ($script:storageContext) { try { Remove-Variable -Scope:Script -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'update tine_task_script_machine_outcome_ref'
#region
##################################################################################################################
try {
    if ($updateByPrimaryKey) {
        # log
        $script:answer = 'yes'
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $script:taskName
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doStep) { $script:answer = Read-Host -Prompt ( $script:taskLine ) }
        elseif ($doEcho) { Write-Host ( $script:taskLine ) -ForegroundColor Gray }

        if ($script:answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {
            # connect and validate table
            $script:storageContext = New-AzureStorageContext -ConnectionString $script:storageConnectionString

            if ( !$whatIf ) {
                $script:tableTineTaskScriptMachineOutcomeRef = Get-AzureStorageTable -Context $script:storageContext -Name 'tineTaskScriptMachineOutcomeRef' -ErrorAction SilentlyContinue
            }

            if ( $script:tableTineTaskScriptMachineOutcomeRef -eq $null -and !$whatIf ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task_script_machine_outcome_ref table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]


                $script:query.FilterString = 'tine_task_script_machine_outcome_rcd eq '''+ $tineTaskScriptMachineOutcomeRcd + ''''
                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTaskScriptMachineOutcomeRefForUpdate = $script:tableTineTaskScriptMachineOutcomeRef.CloudTable.ExecuteQuery($script:query)
                }

                foreach ( $item in $tineTaskScriptMachineOutcomeRefForUpdate ) {
                    [string] $partitionKeyLocal = $item.PartitionKey
                    [string] $rowKeyLocal = $item.RowKey

                    # change task value
                    [Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity] $tineTaskScriptMachineOutcomeRef = `
                        New-Object 'Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity' $partitionKeyLocal, $rowKeyLocal

                    $tineTaskScriptMachineOutcomeRef.ETag = '*'
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptMachineOutcomeRcd')) { $tineTaskScriptMachineOutcomeRef.Properties.Add( 'tine_task_script_machine_outcome_rcd', [System.String]$tineTaskScriptMachineOutcomeRcd) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptMachineOutcomeRefPartitionKey')) { $tineTaskScriptMachineOutcomeRef.Properties.Add( 'tine_task_script_machine_outcome_ref_partition_key', [System.String]$tineTaskScriptMachineOutcomeRefPartitionKey) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptMachineOutcomeRefRowKey')) { $tineTaskScriptMachineOutcomeRef.Properties.Add( 'tine_task_script_machine_outcome_ref_row_key', [System.String]$tineTaskScriptMachineOutcomeRefRowKey) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptMachineOutcomeName')) { $tineTaskScriptMachineOutcomeRef.Properties.Add( 'tine_task_script_machine_outcome_name', [System.String]$tineTaskScriptMachineOutcomeName) }
                    if ($PSBoundParameters.ContainsKey('userId')) { $tineTaskScriptMachineOutcomeRef.Properties.Add( 'user_id', [System.Guid]$userId) }
                    if ($PSBoundParameters.ContainsKey('dateTime')) { $tineTaskScriptMachineOutcomeRef.Properties.Add( 'date_time', [System.DateTime]$dateTime) }

                    $script:tableTineTaskScriptMachineOutcomeRef.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Merge($tineTaskScriptMachineOutcomeRef)) | Out-Null
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
    if ($tineTaskScriptMachineOutcomeRefForUpdate) { try { Remove-Variable -Scope:Script -Name tineTaskScriptMachineOutcomeRefForUpdate } catch {}}
    if ($script:tableTineTaskScriptMachineOutcomeRef) { try { Remove-Variable -Scope:Script -Name tableTineTaskScriptMachineOutcomeRef } catch {}}
    if ($partitionKeyLocal) { try { Remove-Variable -Scope:Script -Name partitionKeyLocal } catch {}}
    if ($rowKeyLocal) { try { Remove-Variable -Scope:Script -Name rowKeyLocal } catch {}}
    if ($tineTaskScriptMachineOutcomeRef) { try { Remove-Variable -Scope:Script -Name tineTaskScriptMachineOutcomeRef } catch {}}
    if ($script:list) { try { Remove-Variable -Scope:Script -Name list } catch {}}
    if ($script:query) { try { Remove-Variable -Scope:Script -Name query } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'update tine_task_script_machine_outcome_ref by foreign keys'
#region
##################################################################################################################
try {
    if ($updateByForeignKeys) {
        # log
        $script:answer = 'yes'
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $script:taskName
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doStep) { $script:answer = Read-Host -Prompt ( $script:taskLine ) }
        elseif ($doEcho) { Write-Host ( $script:taskLine ) -ForegroundColor Gray }

        if ($script:answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {
            # connect and validate table
            $script:storageContext = New-AzureStorageContext -ConnectionString $script:storageConnectionString

            if ( !$whatIf ) {
                $script:tableTineTaskScriptMachineOutcomeRef = Get-AzureStorageTable -Context $script:storageContext -Name 'tineTaskScriptMachineOutcomeRef' -ErrorAction SilentlyContinue
            }

            if ( $script:tableTineTaskScriptMachineOutcomeRef -eq $null -and !$whatIf ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task_script_machine_outcome_ref table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_task_script_machine_outcome_rcd' )
                $script:list.Add( 'tine_task_script_machine_outcome_ref_partition_key' )
                $script:list.Add( 'tine_task_script_machine_outcome_ref_row_key' )
                $script:list.Add( 'tine_task_script_machine_outcome_name' )
                $script:list.Add( 'user_id' )
                $script:list.Add( 'date_time' )

                # filter tineTaskScriptMachineOutcomeRcd ( primary key )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptMachineOutcomeRcd')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_script_machine_outcome_rcd eq '''+ $tineTaskScriptMachineOutcomeRcd + ''''
                }

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTaskScriptMachineOutcomeRefForUpdate = $script:tableTineTaskScriptMachineOutcomeRef.CloudTable.ExecuteQuery($script:query)
                }

                foreach ( $item in $tineTaskScriptMachineOutcomeRefForUpdate ) {
                    [string] $partitionKeyLocal = $item.PartitionKey
                    [string] $rowKeyLocal = $item.RowKey

                    # change task value
                    [Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity] $tineTaskScriptMachineOutcomeRef = `
                        New-Object 'Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity' $partitionKeyLocal, $rowKeyLocal

                    $tineTaskScriptMachineOutcomeRef.ETag = '*'
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptMachineOutcomeRcd')) { $tineTaskScriptMachineOutcomeRef.Properties.Add( 'tine_task_script_machine_outcome_rcd', [System.String]$tineTaskScriptMachineOutcomeRcd) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptMachineOutcomeRefPartitionKey')) { $tineTaskScriptMachineOutcomeRef.Properties.Add( 'tine_task_script_machine_outcome_ref_partition_key', [System.String]$tineTaskScriptMachineOutcomeRefPartitionKey) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptMachineOutcomeRefRowKey')) { $tineTaskScriptMachineOutcomeRef.Properties.Add( 'tine_task_script_machine_outcome_ref_row_key', [System.String]$tineTaskScriptMachineOutcomeRefRowKey) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptMachineOutcomeName')) { $tineTaskScriptMachineOutcomeRef.Properties.Add( 'tine_task_script_machine_outcome_name', [System.String]$tineTaskScriptMachineOutcomeName) }
                    if ($PSBoundParameters.ContainsKey('userId')) { $tineTaskScriptMachineOutcomeRef.Properties.Add( 'user_id', [System.Guid]$userId) }
                    if ($PSBoundParameters.ContainsKey('dateTime')) { $tineTaskScriptMachineOutcomeRef.Properties.Add( 'date_time', [System.DateTime]$dateTime) }

                    $script:tableTineTaskScriptMachineOutcomeRef.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Merge($tineTaskScriptMachineOutcomeRef)) | Out-Null
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
    if ($tineTaskScriptMachineOutcomeRefForUpdate) { try { Remove-Variable -Scope:Script -Name tineTaskScriptMachineOutcomeRefForUpdate } catch {}}
    if ($script:tableTineTaskScriptMachineOutcomeRef) { try { Remove-Variable -Scope:Script -Name tableTineTaskScriptMachineOutcomeRef } catch {}}
    if ($partitionKeyLocal) { try { Remove-Variable -Scope:Script -Name partitionKeyLocal } catch {}}
    if ($rowKeyLocal) { try { Remove-Variable -Scope:Script -Name rowKeyLocal } catch {}}
    if ($tineTaskScriptMachineOutcomeRef) { try { Remove-Variable -Scope:Script -Name tineTaskScriptMachineOutcomeRef } catch {}}
    if ($script:list) { try { Remove-Variable -Scope:Script -Name list } catch {}}
    if ($script:query) { try { Remove-Variable -Scope:Script -Name query } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'delete from tine_task_script_machine_outcome_ref'
#region
##################################################################################################################
try {
    if ($delete) {
        # log
        $script:answer = 'yes'
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $script:taskName
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doStep) { $script:answer = Read-Host -Prompt ( $script:taskLine ) }
        elseif ($doEcho) { Write-Host ( $script:taskLine ) -ForegroundColor Gray }

        if ($script:answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {
            # connect and validate table
            $script:storageContext = New-AzureStorageContext -ConnectionString $script:storageConnectionString

            $script:tableTineTaskScriptMachineOutcomeRef = Get-AzureStorageTable -Context $script:storageContext -Name 'tineTaskScriptMachineOutcomeRef' -ErrorAction SilentlyContinue

            if ( $script:tableTineTaskScriptMachineOutcomeRef -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task_script_machine_outcome_ref table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_task_script_machine_outcome_rcd' )

                $script:query.FilterString = 'tine_task_script_machine_outcome_rcd eq '''+ $tineTaskScriptMachineOutcomeRcd + ''''
                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTaskScriptMachineOutcomeRefForDelete = $script:tableTineTaskScriptMachineOutcomeRef.CloudTable.ExecuteQuery($script:query)
                }

                # delete selected rows
                foreach ( $tineTaskScriptMachineOutcomeRefItem in $tineTaskScriptMachineOutcomeRefForDelete ) {
                    $script:tableTineTaskScriptMachineOutcomeRef.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Delete($tineTaskScriptMachineOutcomeRefItem)) | Out-Null
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
    if ($tineTaskScriptMachineOutcomeRefForDelete) { try { Remove-Variable -Scope:Script -Name tineTaskScriptMachineOutcomeRefForDelete } catch {}}
    if ($tineTaskScriptMachineOutcomeRefItem) { try { Remove-Variable -Scope:Script -Name tineTaskScriptMachineOutcomeRefItem } catch {}}
    if ($script:tableTineTaskScriptMachineOutcomeRef) { try { Remove-Variable -Scope:Script -Name tableTineTaskScriptMachineOutcomeRef } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'fetch value from tine_task_script_machine_outcome_ref'
#region
##################################################################################################################
try {
    if ($fetchValue -ne '') {
        # log
        $script:answer = 'yes'
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $script:taskName
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doStep) { $script:answer = Read-Host -Prompt ( $script:taskLine ) }
        elseif ($doEcho) { Write-Host ( $script:taskLine ) -ForegroundColor Gray }

        if ($script:answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {
            # connect and validate table
            $script:storageContext = New-AzureStorageContext -ConnectionString $script:storageConnectionString

            if ( !$whatIf ) {
                $script:tableTineTaskScriptMachineOutcomeRef = Get-AzureStorageTable -Context $script:storageContext -Name 'tineTaskScriptMachineOutcomeRef' -ErrorAction SilentlyContinue
            }

            if ( $script:tableTineTaskScriptMachineOutcomeRef -eq $null -and !$whatIf ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task_script_machine_outcome_ref table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( $fetchValue )

                # filter tineTaskScriptMachineOutcomeRcd ( primary key )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptMachineOutcomeRcd')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_script_machine_outcome_rcd eq '''+ $tineTaskScriptMachineOutcomeRcd + ''''
                }

                # filter tineTaskScriptMachineOutcomeRefPartitionKey ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptMachineOutcomeRefPartitionKey')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_task_script_machine_outcome_ref_partition_key eq '''+ $tineTaskScriptMachineOutcomeRefPartitionKey + ''''
                }

                # filter tineTaskScriptMachineOutcomeRefRowKey ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptMachineOutcomeRefRowKey')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_task_script_machine_outcome_ref_row_key eq '''+ $tineTaskScriptMachineOutcomeRefRowKey + ''''
                }

                # filter tineTaskScriptMachineOutcomeName ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptMachineOutcomeName')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_task_script_machine_outcome_name eq '''+ $tineTaskScriptMachineOutcomeName + ''''
                }

                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + $script:query.FilterString
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTaskScriptMachineOutcomeRef = $script:tableTineTaskScriptMachineOutcomeRef.CloudTable.ExecuteQuery($script:query)
                }

                # get value
                [string] $outValue = ''
                if (($tineTaskScriptMachineOutcomeRef | Measure-Object).Count -gt 0) {
                    $outValue = $tineTaskScriptMachineOutcomeRef[0].Properties[$fetchValue].PropertyAsObject

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
    if ($tineTaskScriptMachineOutcomeRef) { try { Remove-Variable -Scope:Script -Name tineTaskScriptMachineOutcomeRef } catch {}}
    if ($script:tableTineTaskScriptMachineOutcomeRef) { try { Remove-Variable -Scope:Script -Name tableTineTaskScriptMachineOutcomeRef } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'delete all from tine_task_script_machine_outcome_ref'
#region
##################################################################################################################
try {
    if ($deleteAll) {
        # log
        $script:answer = 'yes'
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $script:taskName
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doStep) { $script:answer = Read-Host -Prompt ( $script:taskLine ) }
        elseif ($doEcho) { Write-Host ( $script:taskLine ) -ForegroundColor Gray }

        if ($script:answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {
            # connect and validate table
            $script:storageContext = New-AzureStorageContext -ConnectionString $script:storageConnectionString

            $script:tableTineTaskScriptMachineOutcomeRef = Get-AzureStorageTable -Context $script:storageContext -Name 'tineTaskScriptMachineOutcomeRef' -ErrorAction SilentlyContinue

            if ( $script:tableTineTaskScriptMachineOutcomeRef -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task_script_machine_outcome_ref table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_task_script_machine_outcome_rcd' )

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTaskScriptMachineOutcomeRefForDelete = $script:tableTineTaskScriptMachineOutcomeRef.CloudTable.ExecuteQuery($script:query)
                }

                # delete selected rows
                foreach ( $tineTaskScriptMachineOutcomeRefItem in $tineTaskScriptMachineOutcomeRefForDelete ) {
                    $script:tableTineTaskScriptMachineOutcomeRef.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Delete($tineTaskScriptMachineOutcomeRefItem)) | Out-Null
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
    if ($tineTaskScriptMachineOutcomeRefForDelete) { try { Remove-Variable -Scope:Script -Name tineTaskScriptMachineOutcomeRefForDelete } catch {}}
    if ($tineTaskScriptMachineOutcomeRefItem) { try { Remove-Variable -Scope:Script -Name tineTaskScriptMachineOutcomeRefItem } catch {}}
    if ($script:tableTineTaskScriptMachineOutcomeRef) { try { Remove-Variable -Scope:Script -Name tableTineTaskScriptMachineOutcomeRef } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'show tine_task_script_machine_outcome_ref'
#region
##################################################################################################################
try {
    if ($show) {
        # log
        $script:answer = 'yes'
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $script:taskName
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doStep) { $script:answer = Read-Host -Prompt ( $script:taskLine ) }
        elseif ($doEcho) { Write-Host ( $script:taskLine ) -ForegroundColor Gray }

        if ($script:answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {
            # connect and validate table
            $script:storageContext = New-AzureStorageContext -ConnectionString $script:storageConnectionString

            $script:tableTineTaskScriptMachineOutcomeRef = Get-AzureStorageTable -Context $script:storageContext -Name 'tineTaskScriptMachineOutcomeRef' -ErrorAction SilentlyContinue

            if ( $script:tableTineTaskScriptMachineOutcomeRef -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task_script_machine_outcome_ref table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_task_script_machine_outcome_rcd' )
                $script:list.Add( 'tine_task_script_machine_outcome_ref_partition_key' )
                $script:list.Add( 'tine_task_script_machine_outcome_ref_row_key' )
                $script:list.Add( 'tine_task_script_machine_outcome_name' )
                $script:list.Add( 'user_id' )
                $script:list.Add( 'date_time' )

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTaskScriptMachineOutcomeRef = $script:tableTineTaskScriptMachineOutcomeRef.CloudTable.ExecuteQuery($script:query)
                }

                # echo
                [string] $script:output = ''
                $script:output = $tineTaskScriptMachineOutcomeRef `
                    | Format-Table PartitionKey, RowKey, `
                    @{ Label = 'Tine Task Script Machine Outcome'; Expression={$_.Properties['tine_task_script_machine_outcome_rcd'].StringValue} },`
                    @{ Label = 'Tine Task Script Machine Outcome Ref Partition Key'; Expression={$_.Properties['tine_task_script_machine_outcome_ref_partition_key'].StringValue} },`
                    @{ Label = 'Tine Task Script Machine Outcome Ref Row Key'; Expression={$_.Properties['tine_task_script_machine_outcome_ref_row_key'].StringValue} },`
                    @{ Label = 'Tine Task Script Machine Outcome Name'; Expression={$_.Properties['tine_task_script_machine_outcome_name'].StringValue} },`
                    @{ Label = 'User Id'; Expression={$_.Properties['user_id'].GuidValue} },`
                    @{ Label = 'Date Time'; Expression={$_.Properties['date_time'].StringValue} } `
                    -AutoSize `
                    | Out-String;

                # log
                if ($script:output -ne '') {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + $script:output
                } else {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'no result for ' + 'tine_task_script_machine_outcome_ref' #+ ': ' + $script:query.FilterString
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
    if ($tineTaskScriptMachineOutcomeRef) { try { Remove-Variable -Scope:Script -Name tineTaskScriptMachineOutcomeRef } catch {}}
    if ($script:tableTineTaskScriptMachineOutcomeRef) { try { Remove-Variable -Scope:Script -Name tableTineTaskScriptMachineOutcomeRef } catch {}}
    if ($script:storageContext) { try { Remove-Variable -Scope:Script -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'drop tine_task_script_machine_outcome_ref'
#region
##################################################################################################################
try {
    if ($drop) {
        # log
        $script:answer = 'yes'
        $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $script:taskName
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if ($doStep) { $script:answer = Read-Host -Prompt ( $script:taskLine ) }
        elseif ($doEcho) { Write-Host ( $script:taskLine ) -ForegroundColor Gray }

        if ($script:answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {
            $script:storageContext = New-AzureStorageContext -ConnectionString $script:storageConnectionString

            $script:tableTineTaskScriptMachineOutcomeRef = Get-AzureStorageTable -Context $script:storageContext -Name 'tineTaskScriptMachineOutcomeRef' -ErrorAction SilentlyContinue

            if ( $script:tableTineTaskScriptMachineOutcomeRef -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task_script_machine_outcome_ref table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                Remove-AzureStorageTable -Context $script:storageContext -Name 'tineTaskScriptMachineOutcomeRef' -Force
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
    if ($script:tableTineTaskScriptMachineOutcomeRef) { try { Remove-Variable -Scope:Script -Name tableTineTaskScriptMachineOutcomeRef } catch {}}
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
if ($script:tineTaskScriptMachineOutcomeRefData) { try { Remove-Variable -Scope:Script -Name tineTaskScriptMachineOutcomeRefData } catch {} }

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
    ConvertTo-Json -InputObject $script:tineTaskScriptMachineOutcomeRefDataList
}

if ($returnObject) {
    $script:tineTaskScriptMachineOutcomeRefDataList
}

if ($returnGridView) {
    $script:tineTaskScriptMachineOutcomeRefDataList | Out-GridView
}
