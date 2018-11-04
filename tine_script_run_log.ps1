# SQL2X Generated code based on a SQL Server Schema
# SQL2X Version: 0.d
# http://sql2x.azurewebsites.net/
# Generated Date: 11/4/2018 7:21:29 AM
# Template: sql2x.PowerShellGenerator.CifudeScript
<#
.\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -create
.\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -insert
.\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -fetch                -tineScriptRunLogId:([guid]'')
.\tine_script_run_log.ps1 -returnValue  -doSql2x -comment test -fetchValue:column    -tineScriptRunLogId:([guid]'')
.\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -updateByPrimaryKey   -show -tineScriptRunLogId:([guid]'')
.\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -updateByForeignKeys  -show
.\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -deleteAll
.\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -delete               -tineScriptRunLogId:([guid]'')
.\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -drop
.\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -show
.\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -help
.\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -create -insert -fetch -fetchValue:column -updateByPrimaryKey -delete -drop -show -help -tineScriptRunLogId:([guid]'')
#>
using module '.\tine_script_run_log.psm1'
[Diagnostics.CodeAnalysis.SuppressMessageAttribute `
    ('PSPossibleIncorrectComparisonWithNull','')]
param(
    [string]$scriptName = 'CIFUDE ( Create Insert Fetch Update Delete Extras ) for tine_script_run_log',
    [string]$scriptStyle = 'original', # original / task
    [string]$scriptStatus = 'status ( todos, learn, learned )',
    [string]$scriptDocumentation = 'links urls, books, people, inspiration',

    [DateTime]$dateTimeStart = [System.DateTime]::UtcNow,
    [DateTime]$dateTimeStop = [System.DateTime]::UtcNow,
    [DateTime]$createdDateTime = '2018.11.04',
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
    [System.Guid]$tineScriptRunLogId = '00000000-0000-0000-0000-000000000000',
    [System.String]$tineScriptRunLogPartitionKey = $env:ComputerName,
    [System.String]$tineScriptRunLogRowKey = [System.DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ss.fffZ'),
    [System.Guid]$tineTaskId = '00000000-0000-0000-0000-000000000000',
    [System.Guid]$tineMachineId = '00000000-0000-0000-0000-000000000000',
    [System.Guid]$tineCreationId = '00000000-0000-0000-0000-000000000000',
    [System.String]$tineTaskScriptName = '',
    [System.String]$tineScriptRunLogStatusRcd = '',
    [System.DateTime]$tineTaskScriptStartDateTime = '1601.01.01T00:00:00Z',
    [System.DateTime]$tineTaskScriptEndDateTime = '1601.01.01T00:00:00Z',
    [System.String]$tineTaskScriptOutcomeRcd = '',
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
# Generated Date: 11/4/2018 7:21:29 AM
# Template: sql2x.PowerShellGenerator.CifudeScript
<#
.\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -create
.\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -insert
.\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -fetch                -tineScriptRunLogId:([guid]'')
.\tine_script_run_log.ps1 -returnValue  -doSql2x -comment test -fetchValue:column    -tineScriptRunLogId:([guid]'')
.\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -updateByPrimaryKey   -show -tineScriptRunLogId:([guid]'')
.\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -updateByForeignKeys  -show
.\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -deleteAll
.\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -delete               -tineScriptRunLogId:([guid]'')
.\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -drop
.\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -show
.\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -help
.\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -create -insert -fetch -fetchValue:column -updateByPrimaryKey -delete -drop -show -help -tineScriptRunLogId:([guid]'')
#>"
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ('storageConnectionString' + ' ' + '=' + ' ' + '[' + $script:storageConnectionString + ']')
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.Guid] tineScriptRunLogId = '00000000-0000-0000-0000-000000000000'")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.String] tineScriptRunLogPartitionKey = $env:ComputerName")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.String] tineScriptRunLogRowKey = [System.DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ss.fffZ')")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.Guid] tineTaskId = '00000000-0000-0000-0000-000000000000'")
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

        $script:taskLine = ("[System.String] tineScriptRunLogStatusRcd = ''")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.DateTime] tineTaskScriptStartDateTime = '1601.01.01T00:00:00Z'")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.DateTime] tineTaskScriptEndDateTime = '1601.01.01T00:00:00Z'")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.String] tineTaskScriptOutcomeRcd = ''")
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
$script:taskName = 'create tine_script_run_log'
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

            $script:tableTineScriptRunLog = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunLog' -ErrorAction SilentlyContinue

            if ( $script:tableTineScriptRunLog -ne $null ) {
                Remove-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunLog' -Force
            }

            [int] $script:trials = 0

            # create new table
            $script:tableTineScriptRunLog = $null
            while ($script:tableTineScriptRunLog -eq $null) {
                # wait for an escalating number of seconds 
                $script:trials++
                if ($script:trials -gt 10) {
                    throw [Exception] ('Failed to create table')
                }

                Start-Sleep $script:trials

                # create new table
                $script:tableTineScriptRunLog = `
                    New-AzureStorageTable `
                        -Context $script:storageContext `
                        -Name 'tineScriptRunLog'

                if ( $script:tableTineScriptRunLog -ne $null ) {
                    # insert row
                    $tineScriptRunLog = 
                        New-Object `
                            -TypeName Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity `
                            -ArgumentList $tineScriptRunLogPartitionKey, $tineScriptRunLogRowKey

                    $tineScriptRunLog.Properties.Add( 'tine_script_run_log_id', [System.Guid]$tineScriptRunLogId)
                    $tineScriptRunLog.Properties.Add( 'tine_script_run_log_partition_key', [System.String]$tineScriptRunLogPartitionKey)
                    $tineScriptRunLog.Properties.Add( 'tine_script_run_log_row_key', [System.String]$tineScriptRunLogRowKey)
                    $tineScriptRunLog.Properties.Add( 'tine_task_id', [System.Guid]$tineTaskId)
                    $tineScriptRunLog.Properties.Add( 'tine_machine_id', [System.Guid]$tineMachineId)
                    $tineScriptRunLog.Properties.Add( 'tine_creation_id', [System.Guid]$tineCreationId)
                    $tineScriptRunLog.Properties.Add( 'tine_task_script_name', [System.String]$tineTaskScriptName)
                    $tineScriptRunLog.Properties.Add( 'tine_script_run_log_status_rcd', [System.String]$tineScriptRunLogStatusRcd)
                    $tineScriptRunLog.Properties.Add( 'tine_task_script_start_date_time', [System.DateTime]$tineTaskScriptStartDateTime)
                    $tineScriptRunLog.Properties.Add( 'tine_task_script_end_date_time', [System.DateTime]$tineTaskScriptEndDateTime)
                    $tineScriptRunLog.Properties.Add( 'tine_task_script_outcome_rcd', [System.String]$tineTaskScriptOutcomeRcd)
                    $tineScriptRunLog.Properties.Add( 'user_id', [System.Guid]$userId)
                    $tineScriptRunLog.Properties.Add( 'date_time', [System.DateTime]$dateTime)

                    $script:tableTineScriptRunLog.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Insert($tineScriptRunLog)) | Out-Null
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
    if ($script:tableTineScriptRunLog) { try { Remove-Variable -Scope:Script -Name tableTineScriptRunLog } catch {}}
    if ($script:storageContext) { try { Remove-Variable -Scope:Script -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'insert to tine_script_run_log'
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

        # validate tineScriptRunLogId ( primary key )
        if ($tineScriptRunLogId -eq '00000000-0000-0000-0000-000000000000') {
            # get a decent primary key, todo; check datatype
            [System.Guid] $tineScriptRunLogId = [System.Guid]::NewGuid()

            # return primary key to caller
            $script:tineScriptRunLogData = [TineScriptRunLogData]::new()
            $script:tineScriptRunLogData.tineScriptRunLogId = $tineScriptRunLogId
            $script:tineScriptRunLogDataList += $script:tineScriptRunLogData
        }

        if ($script:answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {

            # connect and validate table
            $script:storageContext = New-AzureStorageContext -ConnectionString $script:storageConnectionString

            $script:tableTineScriptRunLog = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunLog' -ErrorAction SilentlyContinue

            if ( $script:tableTineScriptRunLog -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_log table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # insert row
                $tineScriptRunLog =
                    New-Object `
                        -TypeName Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity `
                        -ArgumentList $tineScriptRunLogPartitionKey, $tineScriptRunLogRowKey

                $tineScriptRunLog.Properties.Add( 'tine_script_run_log_id', [System.Guid]$tineScriptRunLogId)
                $tineScriptRunLog.Properties.Add( 'tine_script_run_log_partition_key', [System.String]$tineScriptRunLogPartitionKey)
                $tineScriptRunLog.Properties.Add( 'tine_script_run_log_row_key', [System.String]$tineScriptRunLogRowKey)
                $tineScriptRunLog.Properties.Add( 'tine_task_id', [System.Guid]$tineTaskId)
                $tineScriptRunLog.Properties.Add( 'tine_machine_id', [System.Guid]$tineMachineId)
                $tineScriptRunLog.Properties.Add( 'tine_creation_id', [System.Guid]$tineCreationId)
                $tineScriptRunLog.Properties.Add( 'tine_task_script_name', [System.String]$tineTaskScriptName)
                $tineScriptRunLog.Properties.Add( 'tine_script_run_log_status_rcd', [System.String]$tineScriptRunLogStatusRcd)
                $tineScriptRunLog.Properties.Add( 'tine_task_script_start_date_time', [System.DateTime]$tineTaskScriptStartDateTime)
                $tineScriptRunLog.Properties.Add( 'tine_task_script_end_date_time', [System.DateTime]$tineTaskScriptEndDateTime)
                $tineScriptRunLog.Properties.Add( 'tine_task_script_outcome_rcd', [System.String]$tineTaskScriptOutcomeRcd)
                $tineScriptRunLog.Properties.Add( 'user_id', [System.Guid]$userId)
                $tineScriptRunLog.Properties.Add( 'date_time', [System.DateTime]$dateTime)

                $script:tableTineScriptRunLog.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Insert($tineScriptRunLog)) | Out-Null
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
    if ($tineScriptRunLog) { try { Remove-Variable -Scope:Script -Name tineScriptRunLog } catch {}}
    if ($script:tableTineScriptRunLog) { try { Remove-Variable -Scope:Script -Name tableTineScriptRunLog } catch {}}
    if ($script:storageContext) { try { Remove-Variable -Scope:Script -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'fetch from tine_script_run_log'
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
                $script:tableTineScriptRunLog = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunLog' -ErrorAction SilentlyContinue
            }

            if ( $script:tableTineScriptRunLog -eq $null -and !$whatIf ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_log table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_script_run_log_id' )
                $script:list.Add( 'tine_script_run_log_partition_key' )
                $script:list.Add( 'tine_script_run_log_row_key' )
                $script:list.Add( 'tine_task_id' )
                $script:list.Add( 'tine_machine_id' )
                $script:list.Add( 'tine_creation_id' )
                $script:list.Add( 'tine_task_script_name' )
                $script:list.Add( 'tine_script_run_log_status_rcd' )
                $script:list.Add( 'tine_task_script_start_date_time' )
                $script:list.Add( 'tine_task_script_end_date_time' )
                $script:list.Add( 'tine_task_script_outcome_rcd' )
                $script:list.Add( 'user_id' )
                $script:list.Add( 'date_time' )

                # filter tineScriptRunLogId ( primary key )
                if ($PSBoundParameters.ContainsKey('tineScriptRunLogId')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_script_run_log_id eq guid'''+ $tineScriptRunLogId + ''''
                }

                # filter tineTaskId ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineTaskId')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_task_id eq guid'''+ $tineTaskId + ''''
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

                # filter tineScriptRunLogStatusRcd ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineScriptRunLogStatusRcd')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_script_run_log_status_rcd eq '''+ $tineScriptRunLogStatusRcd + ''''
                }

                # filter tineTaskScriptOutcomeRcd ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRcd')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_task_script_outcome_rcd eq '''+ $tineTaskScriptOutcomeRcd + ''''
                }

                # filter tineScriptRunLogPartitionKey ( string column )
                if ($PSBoundParameters.ContainsKey('tineScriptRunLogPartitionKey')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_script_run_log_partition_key eq '''+ $tineScriptRunLogPartitionKey + ''''
                }

                # filter tineScriptRunLogRowKey ( string column )
                if ($PSBoundParameters.ContainsKey('tineScriptRunLogRowKey')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_script_run_log_row_key eq '''+ $tineScriptRunLogRowKey + ''''
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
                    $tineScriptRunLog = $script:tableTineScriptRunLog.CloudTable.ExecuteQuery($script:query)
                }

                # log count
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'Query Results' + ';' + ' ' + '[' + ($tineScriptRunLog | Measure-Object).Count + ']'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }

                # transfer values from query to internal objects
                if ($script:tineScriptRunLogData) { try { Remove-Variable -Scope:Script -Name tineScriptRunLogData } catch {}}
                if ($script:tineScriptRunLogDataList) { try { Remove-Variable -Scope:Script -Name tineScriptRunLogDataList } catch {}}

                $script:tineScriptRunLogDataList = @()

                if (-not [string]::IsNullOrEmpty($tineScriptRunLog)) {
                    foreach ($entity in $tineScriptRunLog) {
                        $script:tineScriptRunLogData = [TineScriptRunLogData]::new()
                        $script:tineScriptRunLogData.tineScriptRunLogPartitionKey = $env:ComputerName
                        $script:tineScriptRunLogData.tineScriptRunLogRowKey = [System.DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ss.fffZ')

                        $entity.Properties.Keys | 
                            ForEach-Object {
                                switch ($_) {
                                    'tine_script_run_log_id' { $script:tineScriptRunLogData.tineScriptRunLogId = $entity.Properties[$_].PropertyAsObject }
                                    'tine_task_id' { $script:tineScriptRunLogData.tineTaskId = $entity.Properties[$_].PropertyAsObject }
                                    'tine_machine_id' { $script:tineScriptRunLogData.tineMachineId = $entity.Properties[$_].PropertyAsObject }
                                    'tine_creation_id' { $script:tineScriptRunLogData.tineCreationId = $entity.Properties[$_].PropertyAsObject }
                                    'tine_task_script_name' { $script:tineScriptRunLogData.tineTaskScriptName = $entity.Properties[$_].PropertyAsObject }
                                    'tine_script_run_log_status_rcd' { $script:tineScriptRunLogData.tineScriptRunLogStatusRcd = $entity.Properties[$_].PropertyAsObject }
                                    'tine_task_script_start_date_time' { $script:tineScriptRunLogData.tineTaskScriptStartDateTime = $entity.Properties[$_].PropertyAsObject }
                                    'tine_task_script_end_date_time' { $script:tineScriptRunLogData.tineTaskScriptEndDateTime = $entity.Properties[$_].PropertyAsObject }
                                    'tine_task_script_outcome_rcd' { $script:tineScriptRunLogData.tineTaskScriptOutcomeRcd = $entity.Properties[$_].PropertyAsObject }
                                    'user_id' { $script:tineScriptRunLogData.userId = $entity.Properties[$_].PropertyAsObject }
                                    'date_time' { $script:tineScriptRunLogData.dateTime = $entity.Properties[$_].PropertyAsObject }
                                }
                            }
                        $script:tineScriptRunLogDataList += $script:tineScriptRunLogData
                    }
                }

                # check if any column parameter is chosen
                [boolean] $includeAll = $true
                foreach ($parameter in $PSBoundParameters.Keys) {
                    $includeAll -= ($parameter -eq 'tineScriptRunLogId')
                    $includeAll -= ($parameter -eq 'tineScriptRunLogPartitionKey')
                    $includeAll -= ($parameter -eq 'tineScriptRunLogRowKey')
                    $includeAll -= ($parameter -eq 'tineTaskId')
                    $includeAll -= ($parameter -eq 'tineMachineId')
                    $includeAll -= ($parameter -eq 'tineCreationId')
                    $includeAll -= ($parameter -eq 'tineTaskScriptName')
                    $includeAll -= ($parameter -eq 'tineScriptRunLogStatusRcd')
                    $includeAll -= ($parameter -eq 'tineTaskScriptStartDateTime')
                    $includeAll -= ($parameter -eq 'tineTaskScriptEndDateTime')
                    $includeAll -= ($parameter -eq 'tineTaskScriptOutcomeRcd')
                    $includeAll -= ($parameter -eq 'userId')
                    $includeAll -= ($parameter -eq 'dateTime')
                }

                # property echo
                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineScriptRunLogId') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineScriptRunLogId' + '; [' + $tineScriptRunLogData.tineScriptRunLogId + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineScriptRunLogPartitionKey') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineScriptRunLogPartitionKey' + '; [' + $tineScriptRunLogData.tineScriptRunLogPartitionKey + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineScriptRunLogRowKey') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineScriptRunLogRowKey' + '; [' + $tineScriptRunLogData.tineScriptRunLogRowKey + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskId') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskId' + '; [' + $tineScriptRunLogData.tineTaskId + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineMachineId') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineMachineId' + '; [' + $tineScriptRunLogData.tineMachineId + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineCreationId') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineCreationId' + '; [' + $tineScriptRunLogData.tineCreationId + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskScriptName') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskScriptName' + '; [' + $tineScriptRunLogData.tineTaskScriptName + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineScriptRunLogStatusRcd') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineScriptRunLogStatusRcd' + '; [' + $tineScriptRunLogData.tineScriptRunLogStatusRcd + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskScriptStartDateTime') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskScriptStartDateTime' + '; [' + $tineScriptRunLogData.tineTaskScriptStartDateTime + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskScriptEndDateTime') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskScriptEndDateTime' + '; [' + $tineScriptRunLogData.tineTaskScriptEndDateTime + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRcd') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskScriptOutcomeRcd' + '; [' + $tineScriptRunLogData.tineTaskScriptOutcomeRcd + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('userId') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'userId' + '; [' + $tineScriptRunLogData.userId + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('dateTime') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'dateTime' + '; [' + $tineScriptRunLogData.dateTime + ']'
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
    if ($tineScriptRunLog) { try { Remove-Variable -Scope:Script -Name tineScriptRunLog } catch {}}
    if ($script:tableTineScriptRunLog) { try { Remove-Variable -Scope:Script -Name tableTineScriptRunLog } catch {}}
    if ($script:storageContext) { try { Remove-Variable -Scope:Script -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'update tine_script_run_log'
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
                $script:tableTineScriptRunLog = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunLog' -ErrorAction SilentlyContinue
            }

            if ( $script:tableTineScriptRunLog -eq $null -and !$whatIf ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_log table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]


                $script:query.FilterString = 'tine_script_run_log_id eq guid'''+ $tineScriptRunLogId + ''''
                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptRunLogForUpdate = $script:tableTineScriptRunLog.CloudTable.ExecuteQuery($script:query)
                }

                foreach ( $item in $tineScriptRunLogForUpdate ) {
                    [string] $partitionKeyLocal = $item.PartitionKey
                    [string] $rowKeyLocal = $item.RowKey

                    # change task value
                    [Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity] $tineScriptRunLog = `
                        New-Object 'Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity' $partitionKeyLocal, $rowKeyLocal

                    $tineScriptRunLog.ETag = '*'
                    if ($PSBoundParameters.ContainsKey('tineScriptRunLogId')) { $tineScriptRunLog.Properties.Add( 'tine_script_run_log_id', [System.Guid]$tineScriptRunLogId) }
                    if ($PSBoundParameters.ContainsKey('tineScriptRunLogPartitionKey')) { $tineScriptRunLog.Properties.Add( 'tine_script_run_log_partition_key', [System.String]$tineScriptRunLogPartitionKey) }
                    if ($PSBoundParameters.ContainsKey('tineScriptRunLogRowKey')) { $tineScriptRunLog.Properties.Add( 'tine_script_run_log_row_key', [System.String]$tineScriptRunLogRowKey) }
                    if ($PSBoundParameters.ContainsKey('tineTaskId')) { $tineScriptRunLog.Properties.Add( 'tine_task_id', [System.Guid]$tineTaskId) }
                    if ($PSBoundParameters.ContainsKey('tineMachineId')) { $tineScriptRunLog.Properties.Add( 'tine_machine_id', [System.Guid]$tineMachineId) }
                    if ($PSBoundParameters.ContainsKey('tineCreationId')) { $tineScriptRunLog.Properties.Add( 'tine_creation_id', [System.Guid]$tineCreationId) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptName')) { $tineScriptRunLog.Properties.Add( 'tine_task_script_name', [System.String]$tineTaskScriptName) }
                    if ($PSBoundParameters.ContainsKey('tineScriptRunLogStatusRcd')) { $tineScriptRunLog.Properties.Add( 'tine_script_run_log_status_rcd', [System.String]$tineScriptRunLogStatusRcd) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptStartDateTime')) { $tineScriptRunLog.Properties.Add( 'tine_task_script_start_date_time', [System.DateTime]$tineTaskScriptStartDateTime) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptEndDateTime')) { $tineScriptRunLog.Properties.Add( 'tine_task_script_end_date_time', [System.DateTime]$tineTaskScriptEndDateTime) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRcd')) { $tineScriptRunLog.Properties.Add( 'tine_task_script_outcome_rcd', [System.String]$tineTaskScriptOutcomeRcd) }
                    if ($PSBoundParameters.ContainsKey('userId')) { $tineScriptRunLog.Properties.Add( 'user_id', [System.Guid]$userId) }
                    if ($PSBoundParameters.ContainsKey('dateTime')) { $tineScriptRunLog.Properties.Add( 'date_time', [System.DateTime]$dateTime) }

                    $script:tableTineScriptRunLog.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Merge($tineScriptRunLog)) | Out-Null
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
    if ($tineScriptRunLogForUpdate) { try { Remove-Variable -Scope:Script -Name tineScriptRunLogForUpdate } catch {}}
    if ($script:tableTineScriptRunLog) { try { Remove-Variable -Scope:Script -Name tableTineScriptRunLog } catch {}}
    if ($partitionKeyLocal) { try { Remove-Variable -Scope:Script -Name partitionKeyLocal } catch {}}
    if ($rowKeyLocal) { try { Remove-Variable -Scope:Script -Name rowKeyLocal } catch {}}
    if ($tineScriptRunLog) { try { Remove-Variable -Scope:Script -Name tineScriptRunLog } catch {}}
    if ($script:list) { try { Remove-Variable -Scope:Script -Name list } catch {}}
    if ($script:query) { try { Remove-Variable -Scope:Script -Name query } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'update tine_script_run_log by foreign keys'
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
                $script:tableTineScriptRunLog = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunLog' -ErrorAction SilentlyContinue
            }

            if ( $script:tableTineScriptRunLog -eq $null -and !$whatIf ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_log table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_script_run_log_id' )
                $script:list.Add( 'tine_script_run_log_partition_key' )
                $script:list.Add( 'tine_script_run_log_row_key' )
                $script:list.Add( 'tine_task_id' )
                $script:list.Add( 'tine_machine_id' )
                $script:list.Add( 'tine_creation_id' )
                $script:list.Add( 'tine_task_script_name' )
                $script:list.Add( 'tine_script_run_log_status_rcd' )
                $script:list.Add( 'tine_task_script_start_date_time' )
                $script:list.Add( 'tine_task_script_end_date_time' )
                $script:list.Add( 'tine_task_script_outcome_rcd' )
                $script:list.Add( 'user_id' )
                $script:list.Add( 'date_time' )

                # filter tineScriptRunLogId ( primary key )
                if ($PSBoundParameters.ContainsKey('tineScriptRunLogId')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_script_run_log_id eq guid'''+ $tineScriptRunLogId + ''''
                }

                # filter tineTaskId ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineTaskId')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_task_id eq guid'''+ $tineTaskId + ''''
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

                # filter tineScriptRunLogStatusRcd ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineScriptRunLogStatusRcd')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_script_run_log_status_rcd eq '''+ $tineScriptRunLogStatusRcd + ''''
                }

                # filter tineTaskScriptOutcomeRcd ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRcd')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_task_script_outcome_rcd eq '''+ $tineTaskScriptOutcomeRcd + ''''
                }

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptRunLogForUpdate = $script:tableTineScriptRunLog.CloudTable.ExecuteQuery($script:query)
                }

                foreach ( $item in $tineScriptRunLogForUpdate ) {
                    [string] $partitionKeyLocal = $item.PartitionKey
                    [string] $rowKeyLocal = $item.RowKey

                    # change task value
                    [Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity] $tineScriptRunLog = `
                        New-Object 'Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity' $partitionKeyLocal, $rowKeyLocal

                    $tineScriptRunLog.ETag = '*'
                    if ($PSBoundParameters.ContainsKey('tineScriptRunLogId')) { $tineScriptRunLog.Properties.Add( 'tine_script_run_log_id', [System.Guid]$tineScriptRunLogId) }
                    if ($PSBoundParameters.ContainsKey('tineScriptRunLogPartitionKey')) { $tineScriptRunLog.Properties.Add( 'tine_script_run_log_partition_key', [System.String]$tineScriptRunLogPartitionKey) }
                    if ($PSBoundParameters.ContainsKey('tineScriptRunLogRowKey')) { $tineScriptRunLog.Properties.Add( 'tine_script_run_log_row_key', [System.String]$tineScriptRunLogRowKey) }
                    if ($PSBoundParameters.ContainsKey('tineTaskId')) { $tineScriptRunLog.Properties.Add( 'tine_task_id', [System.Guid]$tineTaskId) }
                    if ($PSBoundParameters.ContainsKey('tineMachineId')) { $tineScriptRunLog.Properties.Add( 'tine_machine_id', [System.Guid]$tineMachineId) }
                    if ($PSBoundParameters.ContainsKey('tineCreationId')) { $tineScriptRunLog.Properties.Add( 'tine_creation_id', [System.Guid]$tineCreationId) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptName')) { $tineScriptRunLog.Properties.Add( 'tine_task_script_name', [System.String]$tineTaskScriptName) }
                    if ($PSBoundParameters.ContainsKey('tineScriptRunLogStatusRcd')) { $tineScriptRunLog.Properties.Add( 'tine_script_run_log_status_rcd', [System.String]$tineScriptRunLogStatusRcd) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptStartDateTime')) { $tineScriptRunLog.Properties.Add( 'tine_task_script_start_date_time', [System.DateTime]$tineTaskScriptStartDateTime) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptEndDateTime')) { $tineScriptRunLog.Properties.Add( 'tine_task_script_end_date_time', [System.DateTime]$tineTaskScriptEndDateTime) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRcd')) { $tineScriptRunLog.Properties.Add( 'tine_task_script_outcome_rcd', [System.String]$tineTaskScriptOutcomeRcd) }
                    if ($PSBoundParameters.ContainsKey('userId')) { $tineScriptRunLog.Properties.Add( 'user_id', [System.Guid]$userId) }
                    if ($PSBoundParameters.ContainsKey('dateTime')) { $tineScriptRunLog.Properties.Add( 'date_time', [System.DateTime]$dateTime) }

                    $script:tableTineScriptRunLog.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Merge($tineScriptRunLog)) | Out-Null
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
    if ($tineScriptRunLogForUpdate) { try { Remove-Variable -Scope:Script -Name tineScriptRunLogForUpdate } catch {}}
    if ($script:tableTineScriptRunLog) { try { Remove-Variable -Scope:Script -Name tableTineScriptRunLog } catch {}}
    if ($partitionKeyLocal) { try { Remove-Variable -Scope:Script -Name partitionKeyLocal } catch {}}
    if ($rowKeyLocal) { try { Remove-Variable -Scope:Script -Name rowKeyLocal } catch {}}
    if ($tineScriptRunLog) { try { Remove-Variable -Scope:Script -Name tineScriptRunLog } catch {}}
    if ($script:list) { try { Remove-Variable -Scope:Script -Name list } catch {}}
    if ($script:query) { try { Remove-Variable -Scope:Script -Name query } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'delete from tine_script_run_log'
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

            $script:tableTineScriptRunLog = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunLog' -ErrorAction SilentlyContinue

            if ( $script:tableTineScriptRunLog -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_log table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_script_run_log_id' )

                $script:query.FilterString = 'tine_script_run_log_id eq guid'''+ $tineScriptRunLogId + ''''
                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptRunLogForDelete = $script:tableTineScriptRunLog.CloudTable.ExecuteQuery($script:query)
                }

                # delete selected rows
                foreach ( $tineScriptRunLogItem in $tineScriptRunLogForDelete ) {
                    $script:tableTineScriptRunLog.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Delete($tineScriptRunLogItem)) | Out-Null
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
    if ($tineScriptRunLogForDelete) { try { Remove-Variable -Scope:Script -Name tineScriptRunLogForDelete } catch {}}
    if ($tineScriptRunLogItem) { try { Remove-Variable -Scope:Script -Name tineScriptRunLogItem } catch {}}
    if ($script:tableTineScriptRunLog) { try { Remove-Variable -Scope:Script -Name tableTineScriptRunLog } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'fetch value from tine_script_run_log'
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
                $script:tableTineScriptRunLog = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunLog' -ErrorAction SilentlyContinue
            }

            if ( $script:tableTineScriptRunLog -eq $null -and !$whatIf ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_log table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( $fetchValue )

                # filter tineScriptRunLogId ( primary key )
                if ($PSBoundParameters.ContainsKey('tineScriptRunLogId')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_script_run_log_id eq guid'''+ $tineScriptRunLogId + ''''
                }

                # filter tineTaskId ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineTaskId')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_task_id eq guid'''+ $tineTaskId + ''''
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

                # filter tineScriptRunLogStatusRcd ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineScriptRunLogStatusRcd')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_script_run_log_status_rcd eq '''+ $tineScriptRunLogStatusRcd + ''''
                }

                # filter tineTaskScriptOutcomeRcd ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRcd')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_task_script_outcome_rcd eq '''+ $tineTaskScriptOutcomeRcd + ''''
                }

                # filter tineScriptRunLogPartitionKey ( string column )
                if ($PSBoundParameters.ContainsKey('tineScriptRunLogPartitionKey')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_script_run_log_partition_key eq '''+ $tineScriptRunLogPartitionKey + ''''
                }

                # filter tineScriptRunLogRowKey ( string column )
                if ($PSBoundParameters.ContainsKey('tineScriptRunLogRowKey')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_script_run_log_row_key eq '''+ $tineScriptRunLogRowKey + ''''
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
                    $tineScriptRunLog = $script:tableTineScriptRunLog.CloudTable.ExecuteQuery($script:query)
                }

                # get value
                [string] $outValue = ''
                if (($tineScriptRunLog | Measure-Object).Count -gt 0) {
                    $outValue = $tineScriptRunLog[0].Properties[$fetchValue].PropertyAsObject

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
    if ($tineScriptRunLog) { try { Remove-Variable -Scope:Script -Name tineScriptRunLog } catch {}}
    if ($script:tableTineScriptRunLog) { try { Remove-Variable -Scope:Script -Name tableTineScriptRunLog } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'delete all from tine_script_run_log'
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

            $script:tableTineScriptRunLog = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunLog' -ErrorAction SilentlyContinue

            if ( $script:tableTineScriptRunLog -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_log table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_script_run_log_id' )

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptRunLogForDelete = $script:tableTineScriptRunLog.CloudTable.ExecuteQuery($script:query)
                }

                # delete selected rows
                foreach ( $tineScriptRunLogItem in $tineScriptRunLogForDelete ) {
                    $script:tableTineScriptRunLog.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Delete($tineScriptRunLogItem)) | Out-Null
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
    if ($tineScriptRunLogForDelete) { try { Remove-Variable -Scope:Script -Name tineScriptRunLogForDelete } catch {}}
    if ($tineScriptRunLogItem) { try { Remove-Variable -Scope:Script -Name tineScriptRunLogItem } catch {}}
    if ($script:tableTineScriptRunLog) { try { Remove-Variable -Scope:Script -Name tableTineScriptRunLog } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'show tine_script_run_log'
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

            $script:tableTineScriptRunLog = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunLog' -ErrorAction SilentlyContinue

            if ( $script:tableTineScriptRunLog -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_log table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_script_run_log_id' )
                $script:list.Add( 'tine_script_run_log_partition_key' )
                $script:list.Add( 'tine_script_run_log_row_key' )
                $script:list.Add( 'tine_task_id' )
                $script:list.Add( 'tine_machine_id' )
                $script:list.Add( 'tine_creation_id' )
                $script:list.Add( 'tine_task_script_name' )
                $script:list.Add( 'tine_script_run_log_status_rcd' )
                $script:list.Add( 'tine_task_script_start_date_time' )
                $script:list.Add( 'tine_task_script_end_date_time' )
                $script:list.Add( 'tine_task_script_outcome_rcd' )
                $script:list.Add( 'user_id' )
                $script:list.Add( 'date_time' )

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptRunLog = $script:tableTineScriptRunLog.CloudTable.ExecuteQuery($script:query)
                }

                # echo
                [string] $script:output = ''
                $script:output = $tineScriptRunLog `
                    | Format-Table PartitionKey, RowKey, `
                    @{ Label = 'Tine Script Run Log Id'; Expression={$_.Properties['tine_script_run_log_id'].GuidValue} },`
                    @{ Label = 'Tine Script Run Log Partition Key'; Expression={$_.Properties['tine_script_run_log_partition_key'].StringValue} },`
                    @{ Label = 'Tine Script Run Log Row Key'; Expression={$_.Properties['tine_script_run_log_row_key'].StringValue} },`
                    @{ Label = 'Tine Task Id'; Expression={$_.Properties['tine_task_id'].GuidValue} },`
                    @{ Label = 'Tine Machine Id'; Expression={$_.Properties['tine_machine_id'].GuidValue} },`
                    @{ Label = 'Tine Creation Id'; Expression={$_.Properties['tine_creation_id'].GuidValue} },`
                    @{ Label = 'Tine Task Script Name'; Expression={$_.Properties['tine_task_script_name'].StringValue} },`
                    @{ Label = 'Tine Script Run Log Status'; Expression={$_.Properties['tine_script_run_log_status_rcd'].StringValue} },`
                    @{ Label = 'Tine Task Script Start Date Time'; Expression={$_.Properties['tine_task_script_start_date_time'].StringValue} },`
                    @{ Label = 'Tine Task Script End Date Time'; Expression={$_.Properties['tine_task_script_end_date_time'].StringValue} },`
                    @{ Label = 'Tine Task Script Outcome'; Expression={$_.Properties['tine_task_script_outcome_rcd'].StringValue} },`
                    @{ Label = 'User Id'; Expression={$_.Properties['user_id'].GuidValue} },`
                    @{ Label = 'Date Time'; Expression={$_.Properties['date_time'].StringValue} } `
                    -AutoSize `
                    | Out-String;

                # log
                if ($script:output -ne '') {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + $script:output
                } else {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'no result for ' + 'tine_script_run_log' #+ ': ' + $script:query.FilterString
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
    if ($tineScriptRunLog) { try { Remove-Variable -Scope:Script -Name tineScriptRunLog } catch {}}
    if ($script:tableTineScriptRunLog) { try { Remove-Variable -Scope:Script -Name tableTineScriptRunLog } catch {}}
    if ($script:storageContext) { try { Remove-Variable -Scope:Script -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'drop tine_script_run_log'
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

            $script:tableTineScriptRunLog = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunLog' -ErrorAction SilentlyContinue

            if ( $script:tableTineScriptRunLog -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_log table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                Remove-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunLog' -Force
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
    if ($script:tableTineScriptRunLog) { try { Remove-Variable -Scope:Script -Name tableTineScriptRunLog } catch {}}
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
if ($script:tineScriptRunLogData) { try { Remove-Variable -Scope:Script -Name tineScriptRunLogData } catch {} }

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
    ConvertTo-Json -InputObject $script:tineScriptRunLogDataList
}

if ($returnObject) {
    $script:tineScriptRunLogDataList
}

if ($returnGridView) {
    $script:tineScriptRunLogDataList | Out-GridView
}
