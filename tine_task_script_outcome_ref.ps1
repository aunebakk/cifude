# SQL2X Generated code based on a SQL Server Schema
# SQL2X Version: 0.d
# http://sql2x.azurewebsites.net/
# Generated Date: 10/2/2018 3:34:48 AM
# Template: sql2x.PowerShellGenerator.CifudeScript
<#
.\tine_task_script_outcome_ref.ps1 -doEcho       -doSql2x -comment test -create
.\tine_task_script_outcome_ref.ps1 -doEcho       -doSql2x -comment test -insert
.\tine_task_script_outcome_ref.ps1 -doEcho       -doSql2x -comment test -fetch                -tineTaskScriptOutcomeRcd:([string]'')
.\tine_task_script_outcome_ref.ps1 -returnValue  -doSql2x -comment test -fetchValue:column    -tineTaskScriptOutcomeRcd:([string]'')
.\tine_task_script_outcome_ref.ps1 -doEcho       -doSql2x -comment test -updateByPrimaryKey   -show -tineTaskScriptOutcomeRcd:([string]'')
.\tine_task_script_outcome_ref.ps1 -doEcho       -doSql2x -comment test -updateByForeignKeys  -show
.\tine_task_script_outcome_ref.ps1 -doEcho       -doSql2x -comment test -deleteAll
.\tine_task_script_outcome_ref.ps1 -doEcho       -doSql2x -comment test -delete               -tineTaskScriptOutcomeRcd:([string]'')
.\tine_task_script_outcome_ref.ps1 -doEcho       -doSql2x -comment test -drop
.\tine_task_script_outcome_ref.ps1 -doEcho       -doSql2x -comment test -show
.\tine_task_script_outcome_ref.ps1 -doEcho       -doSql2x -comment test -help
.\tine_task_script_outcome_ref.ps1 -doEcho       -doSql2x -comment test -create -insert -fetch -fetchValue:column -updateByPrimaryKey -delete -drop -show -help -tineTaskScriptOutcomeRcd:([string]'')
#>
[Diagnostics.CodeAnalysis.SuppressMessageAttribute `
    ('PSPossibleIncorrectComparisonWithNull','')]
param(
    [string]$scriptName = 'CIFUDE ( Create Insert Fetch Update Delete Extras ) for tine_task_script_outcome_ref',
    [string]$scriptStyle = 'original', # original / task
    [string]$scriptStatus = 'status ( todos, learn, learned )',
    [string]$scriptDocumentation = 'links urls, books, people, inspiration',

    [DateTime]$dateTimeStart = [System.DateTime]::UtcNow,
    [DateTime]$dateTimeStop = [System.DateTime]::UtcNow,
    [DateTime]$createdDateTime = '2018.10.02',
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
    [System.String]$tineTaskScriptOutcomeRcd = '',
    [System.String]$tineTaskScriptOutcomeRefPartitionKey = $env:ComputerName,
    [System.String]$tineTaskScriptOutcomeRefRowKey = [System.DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ss.fffZ'),
    [System.String]$tineTaskScriptOutcomeName = '',
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
# Generated Date: 10/2/2018 3:34:48 AM
# Template: sql2x.PowerShellGenerator.CifudeScript
<#
.\tine_task_script_outcome_ref.ps1 -doEcho       -doSql2x -comment test -create
.\tine_task_script_outcome_ref.ps1 -doEcho       -doSql2x -comment test -insert
.\tine_task_script_outcome_ref.ps1 -doEcho       -doSql2x -comment test -fetch                -tineTaskScriptOutcomeRcd:([string]'')
.\tine_task_script_outcome_ref.ps1 -returnValue  -doSql2x -comment test -fetchValue:column    -tineTaskScriptOutcomeRcd:([string]'')
.\tine_task_script_outcome_ref.ps1 -doEcho       -doSql2x -comment test -updateByPrimaryKey   -show -tineTaskScriptOutcomeRcd:([string]'')
.\tine_task_script_outcome_ref.ps1 -doEcho       -doSql2x -comment test -updateByForeignKeys  -show
.\tine_task_script_outcome_ref.ps1 -doEcho       -doSql2x -comment test -deleteAll
.\tine_task_script_outcome_ref.ps1 -doEcho       -doSql2x -comment test -delete               -tineTaskScriptOutcomeRcd:([string]'')
.\tine_task_script_outcome_ref.ps1 -doEcho       -doSql2x -comment test -drop
.\tine_task_script_outcome_ref.ps1 -doEcho       -doSql2x -comment test -show
.\tine_task_script_outcome_ref.ps1 -doEcho       -doSql2x -comment test -help
.\tine_task_script_outcome_ref.ps1 -doEcho       -doSql2x -comment test -create -insert -fetch -fetchValue:column -updateByPrimaryKey -delete -drop -show -help -tineTaskScriptOutcomeRcd:([string]'')
#>"
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ('storageConnectionString' + ' ' + '=' + ' ' + '[' + $script:storageConnectionString + ']')
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.String] tineTaskScriptOutcomeRcd = ''")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.String] tineTaskScriptOutcomeRefPartitionKey = $env:ComputerName")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.String] tineTaskScriptOutcomeRefRowKey = [System.DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ss.fffZ')")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.String] tineTaskScriptOutcomeName = ''")
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
class TineTaskScriptOutcomeRefData {
    [System.String]$tineTaskScriptOutcomeRcd = ''
    [System.String]$tineTaskScriptOutcomeRefPartitionKey = $env:ComputerName
    [System.String]$tineTaskScriptOutcomeRefRowKey = [System.DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ss.fffZ')
    [System.String]$tineTaskScriptOutcomeName = ''
    [System.Guid]$userId = '00000000-0000-0000-0000-000000000000'
    [System.DateTime]$dateTime = '1601.01.01T00:00:00Z'
}
#endregion
##################################################################################################################
$script:taskName = 'create tine_task_script_outcome_ref'
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

            $script:tableTineTaskScriptOutcomeRef = Get-AzureStorageTable -Context $script:storageContext -Name 'tineTaskScriptOutcomeRef' -ErrorAction SilentlyContinue

            if ( $script:tableTineTaskScriptOutcomeRef -ne $null ) {
                Remove-AzureStorageTable -Context $script:storageContext -Name 'tineTaskScriptOutcomeRef' -Force
            }

            [int] $script:trials = 0

            # create new table
            $script:tableTineTaskScriptOutcomeRef = $null
            while ($script:tableTineTaskScriptOutcomeRef -eq $null) {
                # wait for an escalating number of seconds 
                $script:trials++
                if ($script:trials -gt 10) {
                    throw [Exception] ('Failed to create table')
                }

                Start-Sleep $script:trials

                # create new table
                $script:tableTineTaskScriptOutcomeRef = `
                    New-AzureStorageTable `
                        -Context $script:storageContext `
                        -Name 'tineTaskScriptOutcomeRef'

                if ( $script:tableTineTaskScriptOutcomeRef -ne $null ) {
                    # insert row
                    $tineTaskScriptOutcomeRef = 
                        New-Object `
                            -TypeName Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity `
                            -ArgumentList $tineTaskScriptOutcomeRefPartitionKey, $tineTaskScriptOutcomeRefRowKey

                    $tineTaskScriptOutcomeRef.Properties.Add( 'tine_task_script_outcome_rcd', [System.String]$tineTaskScriptOutcomeRcd)
                    $tineTaskScriptOutcomeRef.Properties.Add( 'tine_task_script_outcome_ref_partition_key', [System.String]$tineTaskScriptOutcomeRefPartitionKey)
                    $tineTaskScriptOutcomeRef.Properties.Add( 'tine_task_script_outcome_ref_row_key', [System.String]$tineTaskScriptOutcomeRefRowKey)
                    $tineTaskScriptOutcomeRef.Properties.Add( 'tine_task_script_outcome_name', [System.String]$tineTaskScriptOutcomeName)
                    $tineTaskScriptOutcomeRef.Properties.Add( 'user_id', [System.Guid]$userId)
                    $tineTaskScriptOutcomeRef.Properties.Add( 'date_time', [System.DateTime]$dateTime)

                    $script:tableTineTaskScriptOutcomeRef.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Insert($tineTaskScriptOutcomeRef)) | Out-Null
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
    if ($script:tableTineTaskScriptOutcomeRef) { try { Remove-Variable -Scope:Script -Name tableTineTaskScriptOutcomeRef } catch {}}
    if ($script:storageContext) { try { Remove-Variable -Scope:Script -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'insert to tine_task_script_outcome_ref'
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

        # validate tineTaskScriptOutcomeRcd ( primary key )
        if ($tineTaskScriptOutcomeRcd -eq '') {
            # get a decent primary key, todo; check datatype
            [System.Guid] $tineTaskScriptOutcomeRcd = [System.Guid]::NewGuid()

            # return primary key to caller
            $script:tineTaskScriptOutcomeRefData = [TineTaskScriptOutcomeRefData]::new()
            $script:tineTaskScriptOutcomeRefData.tineTaskScriptOutcomeRcd = $tineTaskScriptOutcomeRcd
            $script:tineTaskScriptOutcomeRefDataList += $script:tineTaskScriptOutcomeRefData
        }

        if ($script:answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {

            # connect and validate table
            $script:storageContext = New-AzureStorageContext -ConnectionString $script:storageConnectionString

            $script:tableTineTaskScriptOutcomeRef = Get-AzureStorageTable -Context $script:storageContext -Name 'tineTaskScriptOutcomeRef' -ErrorAction SilentlyContinue

            if ( $script:tableTineTaskScriptOutcomeRef -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task_script_outcome_ref table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # insert row
                $tineTaskScriptOutcomeRef =
                    New-Object `
                        -TypeName Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity `
                        -ArgumentList $tineTaskScriptOutcomeRefPartitionKey, $tineTaskScriptOutcomeRefRowKey

                $tineTaskScriptOutcomeRef.Properties.Add( 'tine_task_script_outcome_rcd', [System.String]$tineTaskScriptOutcomeRcd)
                $tineTaskScriptOutcomeRef.Properties.Add( 'tine_task_script_outcome_ref_partition_key', [System.String]$tineTaskScriptOutcomeRefPartitionKey)
                $tineTaskScriptOutcomeRef.Properties.Add( 'tine_task_script_outcome_ref_row_key', [System.String]$tineTaskScriptOutcomeRefRowKey)
                $tineTaskScriptOutcomeRef.Properties.Add( 'tine_task_script_outcome_name', [System.String]$tineTaskScriptOutcomeName)
                $tineTaskScriptOutcomeRef.Properties.Add( 'user_id', [System.Guid]$userId)
                $tineTaskScriptOutcomeRef.Properties.Add( 'date_time', [System.DateTime]$dateTime)

                $script:tableTineTaskScriptOutcomeRef.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Insert($tineTaskScriptOutcomeRef)) | Out-Null
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
    if ($tineTaskScriptOutcomeRef) { try { Remove-Variable -Scope:Script -Name tineTaskScriptOutcomeRef } catch {}}
    if ($script:tableTineTaskScriptOutcomeRef) { try { Remove-Variable -Scope:Script -Name tableTineTaskScriptOutcomeRef } catch {}}
    if ($script:storageContext) { try { Remove-Variable -Scope:Script -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'fetch from tine_task_script_outcome_ref'
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
                $script:tableTineTaskScriptOutcomeRef = Get-AzureStorageTable -Context $script:storageContext -Name 'tineTaskScriptOutcomeRef' -ErrorAction SilentlyContinue
            }

            if ( $script:tableTineTaskScriptOutcomeRef -eq $null -and !$whatIf ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task_script_outcome_ref table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_task_script_outcome_rcd' )
                $script:list.Add( 'tine_task_script_outcome_ref_partition_key' )
                $script:list.Add( 'tine_task_script_outcome_ref_row_key' )
                $script:list.Add( 'tine_task_script_outcome_name' )
                $script:list.Add( 'user_id' )
                $script:list.Add( 'date_time' )

                # filter tineTaskScriptOutcomeRcd ( primary key )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRcd')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_script_outcome_rcd eq '''+ $tineTaskScriptOutcomeRcd + ''''
                }

                # filter tineTaskScriptOutcomeRcd ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRcd')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_script_outcome_rcd eq '''+ $tineTaskScriptOutcomeRcd + ''''
                }

                # filter tineTaskScriptOutcomeRefPartitionKey ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRefPartitionKey')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_script_outcome_ref_partition_key eq '''+ $tineTaskScriptOutcomeRefPartitionKey + ''''
                }

                # filter tineTaskScriptOutcomeRefRowKey ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRefRowKey')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_script_outcome_ref_row_key eq '''+ $tineTaskScriptOutcomeRefRowKey + ''''
                }

                # filter tineTaskScriptOutcomeName ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeName')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_script_outcome_name eq '''+ $tineTaskScriptOutcomeName + ''''
                }

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTaskScriptOutcomeRef = $script:tableTineTaskScriptOutcomeRef.CloudTable.ExecuteQuery($script:query)
                }

                # log count
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'Query Results' + ';' + ' ' + '[' + ($tineTaskScriptOutcomeRef | Measure-Object).Count + ']'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }

                # transfer values from query to internal objects
                if ($script:tineTaskScriptOutcomeRefData) { try { Remove-Variable -Scope:Script -Name tineTaskScriptOutcomeRefData } catch {}}
                if ($script:tineTaskScriptOutcomeRefDataList) { try { Remove-Variable -Scope:Script -Name tineTaskScriptOutcomeRefDataList } catch {}}

                $script:tineTaskScriptOutcomeRefDataList = @()

                if (-not [string]::IsNullOrEmpty($tineTaskScriptOutcomeRef)) {
                    foreach ($entity in $tineTaskScriptOutcomeRef) {
                        $script:tineTaskScriptOutcomeRefData = [TineTaskScriptOutcomeRefData]::new()
                        $script:tineTaskScriptOutcomeRefData.tineTaskScriptOutcomeRefPartitionKey = $env:ComputerName
                        $script:tineTaskScriptOutcomeRefData.tineTaskScriptOutcomeRefRowKey = [System.DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ss.fffZ')

                        $entity.Properties.Keys | 
                            ForEach-Object {
                                switch ($_) {
                                    'tine_task_script_outcome_rcd' { $script:tineTaskScriptOutcomeRefData.tineTaskScriptOutcomeRcd = $entity.Properties[$_].PropertyAsObject }
                                    'tine_task_script_outcome_name' { $script:tineTaskScriptOutcomeRefData.tineTaskScriptOutcomeName = $entity.Properties[$_].PropertyAsObject }
                                    'user_id' { $script:tineTaskScriptOutcomeRefData.userId = $entity.Properties[$_].PropertyAsObject }
                                    'date_time' { $script:tineTaskScriptOutcomeRefData.dateTime = $entity.Properties[$_].PropertyAsObject }
                                }
                            }
                        $script:tineTaskScriptOutcomeRefDataList += $script:tineTaskScriptOutcomeRefData
                    }
                }

                # check if any column parameter is chosen
                [boolean] $includeAll = $true
                foreach ($parameter in $PSBoundParameters.Keys) {
                    $includeAll -= ($parameter -eq 'tineTaskScriptOutcomeRcd')
                    $includeAll -= ($parameter -eq 'tineTaskScriptOutcomeRefPartitionKey')
                    $includeAll -= ($parameter -eq 'tineTaskScriptOutcomeRefRowKey')
                    $includeAll -= ($parameter -eq 'tineTaskScriptOutcomeName')
                    $includeAll -= ($parameter -eq 'userId')
                    $includeAll -= ($parameter -eq 'dateTime')
                }

                # property echo
                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRcd') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskScriptOutcomeRcd' + '; [' + $tineTaskScriptOutcomeRefData.tineTaskScriptOutcomeRcd + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRefPartitionKey') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskScriptOutcomeRefPartitionKey' + '; [' + $tineTaskScriptOutcomeRefData.tineTaskScriptOutcomeRefPartitionKey + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRefRowKey') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskScriptOutcomeRefRowKey' + '; [' + $tineTaskScriptOutcomeRefData.tineTaskScriptOutcomeRefRowKey + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskScriptOutcomeName') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskScriptOutcomeName' + '; [' + $tineTaskScriptOutcomeRefData.tineTaskScriptOutcomeName + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('userId') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'userId' + '; [' + $tineTaskScriptOutcomeRefData.userId + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('dateTime') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'dateTime' + '; [' + $tineTaskScriptOutcomeRefData.dateTime + ']'
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
    if ($tineTaskScriptOutcomeRef) { try { Remove-Variable -Scope:Script -Name tineTaskScriptOutcomeRef } catch {}}
    if ($script:tableTineTaskScriptOutcomeRef) { try { Remove-Variable -Scope:Script -Name tableTineTaskScriptOutcomeRef } catch {}}
    if ($script:storageContext) { try { Remove-Variable -Scope:Script -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'update tine_task_script_outcome_ref'
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
                $script:tableTineTaskScriptOutcomeRef = Get-AzureStorageTable -Context $script:storageContext -Name 'tineTaskScriptOutcomeRef' -ErrorAction SilentlyContinue
            }

            if ( $script:tableTineTaskScriptOutcomeRef -eq $null -and !$whatIf ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task_script_outcome_ref table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]


                $script:query.FilterString = 'tine_task_script_outcome_rcd eq '''+ $tineTaskScriptOutcomeRcd + ''''
                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTaskScriptOutcomeRefForUpdate = $script:tableTineTaskScriptOutcomeRef.CloudTable.ExecuteQuery($script:query)
                }

                foreach ( $item in $tineTaskScriptOutcomeRefForUpdate ) {
                    [string] $partitionKeyLocal = $item.PartitionKey
                    [string] $rowKeyLocal = $item.RowKey

                    # change task value
                    [Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity] $tineTaskScriptOutcomeRef = `
                        New-Object 'Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity' $partitionKeyLocal, $rowKeyLocal

                    $tineTaskScriptOutcomeRef.ETag = '*'
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRcd')) { $tineTaskScriptOutcomeRef.Properties.Add( 'tine_task_script_outcome_rcd', [System.String]$tineTaskScriptOutcomeRcd) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRefPartitionKey')) { $tineTaskScriptOutcomeRef.Properties.Add( 'tine_task_script_outcome_ref_partition_key', [System.String]$tineTaskScriptOutcomeRefPartitionKey) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRefRowKey')) { $tineTaskScriptOutcomeRef.Properties.Add( 'tine_task_script_outcome_ref_row_key', [System.String]$tineTaskScriptOutcomeRefRowKey) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeName')) { $tineTaskScriptOutcomeRef.Properties.Add( 'tine_task_script_outcome_name', [System.String]$tineTaskScriptOutcomeName) }
                    if ($PSBoundParameters.ContainsKey('userId')) { $tineTaskScriptOutcomeRef.Properties.Add( 'user_id', [System.Guid]$userId) }
                    if ($PSBoundParameters.ContainsKey('dateTime')) { $tineTaskScriptOutcomeRef.Properties.Add( 'date_time', [System.DateTime]$dateTime) }

                    $script:tableTineTaskScriptOutcomeRef.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Merge($tineTaskScriptOutcomeRef)) | Out-Null
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
    if ($tineTaskScriptOutcomeRefForUpdate) { try { Remove-Variable -Scope:Script -Name tineTaskScriptOutcomeRefForUpdate } catch {}}
    if ($script:tableTineTaskScriptOutcomeRef) { try { Remove-Variable -Scope:Script -Name tableTineTaskScriptOutcomeRef } catch {}}
    if ($partitionKeyLocal) { try { Remove-Variable -Scope:Script -Name partitionKeyLocal } catch {}}
    if ($rowKeyLocal) { try { Remove-Variable -Scope:Script -Name rowKeyLocal } catch {}}
    if ($tineTaskScriptOutcomeRef) { try { Remove-Variable -Scope:Script -Name tineTaskScriptOutcomeRef } catch {}}
    if ($script:list) { try { Remove-Variable -Scope:Script -Name list } catch {}}
    if ($script:query) { try { Remove-Variable -Scope:Script -Name query } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'update tine_task_script_outcome_ref by foreign keys'
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
                $script:tableTineTaskScriptOutcomeRef = Get-AzureStorageTable -Context $script:storageContext -Name 'tineTaskScriptOutcomeRef' -ErrorAction SilentlyContinue
            }

            if ( $script:tableTineTaskScriptOutcomeRef -eq $null -and !$whatIf ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task_script_outcome_ref table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_task_script_outcome_rcd' )
                $script:list.Add( 'tine_task_script_outcome_ref_partition_key' )
                $script:list.Add( 'tine_task_script_outcome_ref_row_key' )
                $script:list.Add( 'tine_task_script_outcome_name' )
                $script:list.Add( 'user_id' )
                $script:list.Add( 'date_time' )

                # filter tineTaskScriptOutcomeRcd ( primary key )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRcd')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_script_outcome_rcd eq '''+ $tineTaskScriptOutcomeRcd + ''''
                }

                # filter tineTaskScriptOutcomeRcd ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRcd')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_script_outcome_rcd eq '''+ $tineTaskScriptOutcomeRcd + ''''
                }

                # filter tineTaskScriptOutcomeRefPartitionKey ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRefPartitionKey')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_script_outcome_ref_partition_key eq '''+ $tineTaskScriptOutcomeRefPartitionKey + ''''
                }

                # filter tineTaskScriptOutcomeRefRowKey ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRefRowKey')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_script_outcome_ref_row_key eq '''+ $tineTaskScriptOutcomeRefRowKey + ''''
                }

                # filter tineTaskScriptOutcomeName ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeName')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_script_outcome_name eq '''+ $tineTaskScriptOutcomeName + ''''
                }

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTaskScriptOutcomeRefForUpdate = $script:tableTineTaskScriptOutcomeRef.CloudTable.ExecuteQuery($script:query)
                }

                foreach ( $item in $tineTaskScriptOutcomeRefForUpdate ) {
                    [string] $partitionKeyLocal = $item.PartitionKey
                    [string] $rowKeyLocal = $item.RowKey

                    # change task value
                    [Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity] $tineTaskScriptOutcomeRef = `
                        New-Object 'Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity' $partitionKeyLocal, $rowKeyLocal

                    $tineTaskScriptOutcomeRef.ETag = '*'
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRcd')) { $tineTaskScriptOutcomeRef.Properties.Add( 'tine_task_script_outcome_rcd', [System.String]$tineTaskScriptOutcomeRcd) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRefPartitionKey')) { $tineTaskScriptOutcomeRef.Properties.Add( 'tine_task_script_outcome_ref_partition_key', [System.String]$tineTaskScriptOutcomeRefPartitionKey) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRefRowKey')) { $tineTaskScriptOutcomeRef.Properties.Add( 'tine_task_script_outcome_ref_row_key', [System.String]$tineTaskScriptOutcomeRefRowKey) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeName')) { $tineTaskScriptOutcomeRef.Properties.Add( 'tine_task_script_outcome_name', [System.String]$tineTaskScriptOutcomeName) }
                    if ($PSBoundParameters.ContainsKey('userId')) { $tineTaskScriptOutcomeRef.Properties.Add( 'user_id', [System.Guid]$userId) }
                    if ($PSBoundParameters.ContainsKey('dateTime')) { $tineTaskScriptOutcomeRef.Properties.Add( 'date_time', [System.DateTime]$dateTime) }

                    $script:tableTineTaskScriptOutcomeRef.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Merge($tineTaskScriptOutcomeRef)) | Out-Null
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
    if ($tineTaskScriptOutcomeRefForUpdate) { try { Remove-Variable -Scope:Script -Name tineTaskScriptOutcomeRefForUpdate } catch {}}
    if ($script:tableTineTaskScriptOutcomeRef) { try { Remove-Variable -Scope:Script -Name tableTineTaskScriptOutcomeRef } catch {}}
    if ($partitionKeyLocal) { try { Remove-Variable -Scope:Script -Name partitionKeyLocal } catch {}}
    if ($rowKeyLocal) { try { Remove-Variable -Scope:Script -Name rowKeyLocal } catch {}}
    if ($tineTaskScriptOutcomeRef) { try { Remove-Variable -Scope:Script -Name tineTaskScriptOutcomeRef } catch {}}
    if ($script:list) { try { Remove-Variable -Scope:Script -Name list } catch {}}
    if ($script:query) { try { Remove-Variable -Scope:Script -Name query } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'delete from tine_task_script_outcome_ref'
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

            $script:tableTineTaskScriptOutcomeRef = Get-AzureStorageTable -Context $script:storageContext -Name 'tineTaskScriptOutcomeRef' -ErrorAction SilentlyContinue

            if ( $script:tableTineTaskScriptOutcomeRef -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task_script_outcome_ref table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_task_script_outcome_rcd' )

                $script:query.FilterString = 'tine_task_script_outcome_rcd eq '''+ $tineTaskScriptOutcomeRcd + ''''
                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTaskScriptOutcomeRefForDelete = $script:tableTineTaskScriptOutcomeRef.CloudTable.ExecuteQuery($script:query)
                }

                # delete selected rows
                foreach ( $tineTaskScriptOutcomeRefItem in $tineTaskScriptOutcomeRefForDelete ) {
                    $script:tableTineTaskScriptOutcomeRef.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Delete($tineTaskScriptOutcomeRefItem)) | Out-Null
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
    if ($tineTaskScriptOutcomeRefForDelete) { try { Remove-Variable -Scope:Script -Name tineTaskScriptOutcomeRefForDelete } catch {}}
    if ($tineTaskScriptOutcomeRefItem) { try { Remove-Variable -Scope:Script -Name tineTaskScriptOutcomeRefItem } catch {}}
    if ($script:tableTineTaskScriptOutcomeRef) { try { Remove-Variable -Scope:Script -Name tableTineTaskScriptOutcomeRef } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'fetch value from tine_task_script_outcome_ref'
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
                $script:tableTineTaskScriptOutcomeRef = Get-AzureStorageTable -Context $script:storageContext -Name 'tineTaskScriptOutcomeRef' -ErrorAction SilentlyContinue
            }

            if ( $script:tableTineTaskScriptOutcomeRef -eq $null -and !$whatIf ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task_script_outcome_ref table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( $fetchValue )

                # filter tineTaskScriptOutcomeRcd ( primary key )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRcd')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_script_outcome_rcd eq '''+ $tineTaskScriptOutcomeRcd + ''''
                }

                # filter tineTaskScriptOutcomeRcd ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRcd')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_script_outcome_rcd eq '''+ $tineTaskScriptOutcomeRcd + ''''
                }

                # filter tineTaskScriptOutcomeRefPartitionKey ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRefPartitionKey')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_script_outcome_ref_partition_key eq '''+ $tineTaskScriptOutcomeRefPartitionKey + ''''
                }

                # filter tineTaskScriptOutcomeRefRowKey ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRefRowKey')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_script_outcome_ref_row_key eq '''+ $tineTaskScriptOutcomeRefRowKey + ''''
                }

                # filter tineTaskScriptOutcomeName ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeName')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_script_outcome_name eq '''+ $tineTaskScriptOutcomeName + ''''
                }

                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + $script:query.FilterString
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTaskScriptOutcomeRef = $script:tableTineTaskScriptOutcomeRef.CloudTable.ExecuteQuery($script:query)
                }

                # get value
                [string] $outValue = ''
                if (($tineTaskScriptOutcomeRef | Measure-Object).Count -gt 0) {
                    $outValue = $tineTaskScriptOutcomeRef[0].Properties[$fetchValue].PropertyAsObject

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
    if ($tineTaskScriptOutcomeRef) { try { Remove-Variable -Scope:Script -Name tineTaskScriptOutcomeRef } catch {}}
    if ($script:tableTineTaskScriptOutcomeRef) { try { Remove-Variable -Scope:Script -Name tableTineTaskScriptOutcomeRef } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'delete all from tine_task_script_outcome_ref'
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

            $script:tableTineTaskScriptOutcomeRef = Get-AzureStorageTable -Context $script:storageContext -Name 'tineTaskScriptOutcomeRef' -ErrorAction SilentlyContinue

            if ( $script:tableTineTaskScriptOutcomeRef -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task_script_outcome_ref table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_task_script_outcome_rcd' )

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTaskScriptOutcomeRefForDelete = $script:tableTineTaskScriptOutcomeRef.CloudTable.ExecuteQuery($script:query)
                }

                # delete selected rows
                foreach ( $tineTaskScriptOutcomeRefItem in $tineTaskScriptOutcomeRefForDelete ) {
                    $script:tableTineTaskScriptOutcomeRef.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Delete($tineTaskScriptOutcomeRefItem)) | Out-Null
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
    if ($tineTaskScriptOutcomeRefForDelete) { try { Remove-Variable -Scope:Script -Name tineTaskScriptOutcomeRefForDelete } catch {}}
    if ($tineTaskScriptOutcomeRefItem) { try { Remove-Variable -Scope:Script -Name tineTaskScriptOutcomeRefItem } catch {}}
    if ($script:tableTineTaskScriptOutcomeRef) { try { Remove-Variable -Scope:Script -Name tableTineTaskScriptOutcomeRef } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'show tine_task_script_outcome_ref'
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

            $script:tableTineTaskScriptOutcomeRef = Get-AzureStorageTable -Context $script:storageContext -Name 'tineTaskScriptOutcomeRef' -ErrorAction SilentlyContinue

            if ( $script:tableTineTaskScriptOutcomeRef -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task_script_outcome_ref table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_task_script_outcome_rcd' )
                $script:list.Add( 'tine_task_script_outcome_ref_partition_key' )
                $script:list.Add( 'tine_task_script_outcome_ref_row_key' )
                $script:list.Add( 'tine_task_script_outcome_name' )
                $script:list.Add( 'user_id' )
                $script:list.Add( 'date_time' )

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTaskScriptOutcomeRef = $script:tableTineTaskScriptOutcomeRef.CloudTable.ExecuteQuery($script:query)
                }

                # echo
                [string] $script:output = ''
                $script:output = $tineTaskScriptOutcomeRef `
                    | Format-Table PartitionKey, RowKey, `
                    @{ Label = 'Tine Task Script Outcome'; Expression={$_.Properties['tine_task_script_outcome_rcd'].StringValue} },`
                    @{ Label = 'Tine Task Script Outcome Ref Partition Key'; Expression={$_.Properties['tine_task_script_outcome_ref_partition_key'].StringValue} },`
                    @{ Label = 'Tine Task Script Outcome Ref Row Key'; Expression={$_.Properties['tine_task_script_outcome_ref_row_key'].StringValue} },`
                    @{ Label = 'Tine Task Script Outcome Name'; Expression={$_.Properties['tine_task_script_outcome_name'].StringValue} },`
                    @{ Label = 'User Id'; Expression={$_.Properties['user_id'].GuidValue} },`
                    @{ Label = 'Date Time'; Expression={$_.Properties['date_time'].StringValue} } `
                    -AutoSize `
                    | Out-String;

                # log
                if ($script:output -ne '') {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + $script:output
                } else {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'no result for ' + 'tine_task_script_outcome_ref' #+ ': ' + $script:query.FilterString
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
    if ($tineTaskScriptOutcomeRef) { try { Remove-Variable -Scope:Script -Name tineTaskScriptOutcomeRef } catch {}}
    if ($script:tableTineTaskScriptOutcomeRef) { try { Remove-Variable -Scope:Script -Name tableTineTaskScriptOutcomeRef } catch {}}
    if ($script:storageContext) { try { Remove-Variable -Scope:Script -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'drop tine_task_script_outcome_ref'
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

            $script:tableTineTaskScriptOutcomeRef = Get-AzureStorageTable -Context $script:storageContext -Name 'tineTaskScriptOutcomeRef' -ErrorAction SilentlyContinue

            if ( $script:tableTineTaskScriptOutcomeRef -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task_script_outcome_ref table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                Remove-AzureStorageTable -Context $script:storageContext -Name 'tineTaskScriptOutcomeRef' -Force
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
    if ($script:tableTineTaskScriptOutcomeRef) { try { Remove-Variable -Scope:Script -Name tableTineTaskScriptOutcomeRef } catch {}}
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
if ($script:tineTaskScriptOutcomeRefData) { try { Remove-Variable -Scope:Script -Name tineTaskScriptOutcomeRefData } catch {} }

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
    ConvertTo-Json -InputObject $script:tineTaskScriptOutcomeRefDataList
}

if ($returnObject) {
    $script:tineTaskScriptOutcomeRefDataList
}

if ($returnGridView) {
    $script:tineTaskScriptOutcomeRefDataList | Out-GridView
}
