# SQL2X Generated code based on a SQL Server Schema
# SQL2X Version: 0.d
# http://sql2x.azurewebsites.net/
# Generated Date: 7/29/2018 3:08:41 PM
# Template: sql2x.PowerShellGenerator.CifudeScript
#
# .\cifude\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -create
# .\cifude\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -insert               -tineScriptRunLogId:([guid]'00000000-0000-0000-0000-000000000000')
# .\cifude\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -fetch                -tineScriptRunLogId:([guid]'00000000-0000-0000-0000-000000000000')
# .\cifude\tine_script_run_log.ps1 -returnValue  -doSql2x -comment test -fetchValue:column    -tineScriptRunLogId:([guid]'00000000-0000-0000-0000-000000000000')
# .\cifude\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -updateByPrimaryKey   -tineScriptRunLogId:([guid]'00000000-0000-0000-0000-000000000000') -show
# .\cifude\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -updateByForeignKeys  -show
# .\cifude\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -deleteAll
# .\cifude\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -delete               -tineScriptRunLogId:([guid]'00000000-0000-0000-0000-000000000000')
# .\cifude\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -drop
# .\cifude\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -show
# .\cifude\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -help
#
# all
# .\cifude\tine_script_run_log.ps1 -doEcho       -doSql2x -comment test -create -insert -fetch -fetchValue:column -update -show -delete -drop -tineScriptRunLogId:([guid]'00000000-0000-0000-0000-000000000000')
# [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSPossibleIncorrectComparisonWithNull', Scope='Function', Target='*')]  # because, history!
param (
    [string]$scriptName = 'CIFUDE ( Create Insert Fetch Update Delete Extras ) for tine_script_run_log',
    [string]$scriptStyle = 'original', # original / task
    [string]$scriptStatus = 'status ( todos, learn, learned )',
    [string]$scriptDocumentation = 'links urls, books, people, inspiration',

    [DateTime]$dateTimeStart = [System.DateTime]::UtcNow,
    [DateTime]$dateTimeStop = [System.DateTime]::UtcNow,
    [DateTime]$createdDateTime = '2018.07.29',
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
    [string]$comment = '',
    [switch]$sendMail = $false,

    # schema with foreign keys and default values
    [System.Guid]$tineScriptRunLogId = '00000000-0000-0000-0000-000000000000',
    [System.String]$tineScriptRunLogScriptName = '',
    [System.DateTime]$tineScriptRunLogStartDateTime = '1601.01.01T00:00:00Z',
    [System.DateTime]$tineScriptRunLogEndDateTime = '1601.01.01T00:00:00Z',
    [System.String]$tineTaskScriptOutcomeRcd = '',
    [System.Guid]$userId = '00000000-0000-0000-0000-000000000000',
    [System.DateTime]$dateTime = '1601.01.01T00:00:00Z',
    [System.String]$tineScriptRunLogPartitionKey = $env:ComputerName,
    [System.String]$tineScriptRunLogRowKey = [System.DateTime]::UtcNow.ToString('yyyy.MM.ddTHH:mm:ss.fffZ'),
    [System.String]$tineScriptRunLogScriptFileName = '',
    [System.Guid]$tineCreationId = '00000000-0000-0000-0000-000000000000',
    [System.Guid]$tineTaskId = '00000000-0000-0000-0000-000000000000'

)
##################################################################################################################
$taskName = 'locals'
#region
##################################################################################################################
[string] $taskLine = ''
[string] $answer = ''
[bool] $mailAnyway = $false
[string] $htmlLog = ''

[string] $storageConnectionString = 'DefaultEndpointsProtocol=https;AccountName=xxx;AccountKey=xxx/xxx+xxx/xxx;EndpointSuffix=core.windows.net'
#endregion
##################################################################################################################
$taskName = 'injection'
#region
##################################################################################################################
[switch]$doSql2x = $true
[switch]$doEcho = $true

[string]$comment = 'dev'
#endregion
##################################################################################################################
$taskName = 'set startup location'
#region
##################################################################################################################
try {
    [string] $startupDirectory = $pwd
    if ($doDevelopment) {
        [string] $startupDirectory = 'C:\SQL2XProjects' + '\' + 'sql2x' + '\' + 'Scripts'
    } elseif ($doTest) {
        [string] $startupDirectory = $home + '\' + 'sql2x' + '\' + 'Scripts'
    } elseif ($doSql2x) {
        [string] $startupDirectory = $pwd
    }
    if ($startupDirectory -ne '') {
        Set-Location $startupDirectory -ErrorAction:Stop
    }
} catch [Exception] {
    if ($rethrow) {
        Write-Host ($taskName + ' ' + 'Exception; ' + $_.Exception.Message)
        try { Set-Location $startupDirectory } catch { }; throw [Exception] ('Failed to; ' + $taskName)
    } else {
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + ('Exception:' + ' ' + $taskName + ' ' + '[' +  $_.Exception.Message + ']' + ' ' + 'Line:[' + $_.InvocationInfo.ScriptLineNumber + ']')
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doEcho) { Write-Host ( $taskLine ) -ForegroundColor Red }
        $doDevelopment = $false; $doTest = $true
    }
}
#endregion
##################################################################################################################
$taskName = 'start script:'
#region
##################################################################################################################
$taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + $taskName `
        + ' ' + $MyInvocation.MyCommand.Name `
        + ' ' + $MyInvocation.MyCommand.Arguments
$htmlLog = $htmlLog + $taskLine + '<br>'
if ($doEcho) { Write-Host $taskLine }

if (-not (([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).
        IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))) {
    $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + 'pwd:' + ' ' + $pwd + ' ' + 'Not Admin')
    $htmlLog = $htmlLog + $taskLine + '<br>'
    if ($doEcho) { Write-Host $taskLine }
} else {
    $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + 'pwd:' + ' ' + $pwd + ' ' + 'Admin')
    $htmlLog = $htmlLog + $taskLine + '<br>'
    if ($doEcho) { Write-Host $taskLine }
}

$taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'doDevelopment;' + '[' + $doDevelopment + ']' + ' ' + 'doTest;' + '[' + $doTest + ']' + ' ' + 'doStep;' + '[' + $doStep + ']' + ' ' + 'doEcho;' + '[' + $doEcho + ']' + ' ' + 'rethrow;' + '[' + $rethrow + ']'
$htmlLog = $htmlLog + $taskLine + '<br>'
if ($doEcho) { Write-Host $taskLine }

# check comment
if ([string]::IsNullOrWhiteSpace($comment)) {
    [string] $comment = Read-Host -Prompt ([System.DateTime]::UtcNow.ToString() + ' ' + 'Comment')
    if ([string]::IsNullOrWhiteSpace($comment)) { throw [Exception] 'Need a comment' }
}
$taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'comment:' + ' ' + $comment
$htmlLog = $htmlLog + $taskLine + '<br>'
if ($doEcho) { Write-Host $taskLine }
#endregion
##################################################################################################################
$taskName = 'refs'
#region
##################################################################################################################
if (-not ([System.Management.Automation.PSTypeName]'TineCacheRef').Type) {
   Add-Type -TypeDefinition @"
   public enum TineCacheRef
   {
    None
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
$taskName = 'help'
#region
##################################################################################################################
try {
    if ($help) {
        # log
        $answer = 'yes'
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $taskName
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doStep) { $answer = Read-Host -Prompt ( $taskLine ) }
        elseif ($doEcho) { Write-Host ( $taskLine ) }

        if ($answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {
            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + 'storageConnectionString' + ' ' + '=' + ' ' + '[' + $storageConnectionString + ']')
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.Guid] tineScriptRunLogId = '00000000-0000-0000-0000-000000000000'")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.String] tineScriptRunLogScriptName = ''")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.DateTime] tineScriptRunLogStartDateTime = '1601.01.01T00:00:00Z'")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.DateTime] tineScriptRunLogEndDateTime = '1601.01.01T00:00:00Z'")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.String] tineTaskScriptOutcomeRcd = ''")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.Guid] userId = '00000000-0000-0000-0000-000000000000'")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.DateTime] dateTime = '1601.01.01T00:00:00Z'")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.String] tineScriptRunLogPartitionKey = $env:ComputerName")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.String] tineScriptRunLogRowKey = [System.DateTime]::UtcNow.ToString('yyyy.MM.ddTHH:mm:ss.fffZ')")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.String] tineScriptRunLogScriptFileName = ''")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.Guid] tineCreationId = '00000000-0000-0000-0000-000000000000'")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.Guid] tineTaskId = '00000000-0000-0000-0000-000000000000'")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

        }
        # log
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'end:' + ' ' + $taskName
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doEcho) { Write-Host ( $taskLine ) }
    }
} catch [Exception] {
    if ($rethrow) {
        Write-Host ($taskName + ' ' + 'Exception; ' + $_.Exception.Message)
        try { Set-Location $startupDirectory } catch { }; throw [Exception] ('Failed to; ' + $taskName)
    } else {
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + ('Exception:' + ' ' + $taskName + ' ' + '[' +  $_.Exception.Message + ']' + ' ' + 'Line:[' + $_.InvocationInfo.ScriptLineNumber + ']')
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doEcho) { Write-Host ( $taskLine ) -ForegroundColor Red }
    }
} finally {
}
#endregion
##################################################################################################################
$taskName = 'data class'
#region
##################################################################################################################
class TineScriptRunLogData {
    [System.Guid]$tineScriptRunLogId = '00000000-0000-0000-0000-000000000000'
    [System.String]$tineScriptRunLogScriptName = ''
    [System.DateTime]$tineScriptRunLogStartDateTime = '1601.01.01T00:00:00Z'
    [System.DateTime]$tineScriptRunLogEndDateTime = '1601.01.01T00:00:00Z'
    [System.String]$tineTaskScriptOutcomeRcd = ''
    [System.Guid]$userId = '00000000-0000-0000-0000-000000000000'
    [System.DateTime]$dateTime = '1601.01.01T00:00:00Z'
    [System.String]$tineScriptRunLogPartitionKey = $env:ComputerName
    [System.String]$tineScriptRunLogRowKey = [System.DateTime]::UtcNow.ToString('yyyy.MM.ddTHH:mm:ss.fffZ')
    [System.String]$tineScriptRunLogScriptFileName = ''
    [System.Guid]$tineCreationId = '00000000-0000-0000-0000-000000000000'
    [System.Guid]$tineTaskId = '00000000-0000-0000-0000-000000000000'
}
#endregion
##################################################################################################################
$taskName = 'create tine_script_run_log'
#region
##################################################################################################################
try {
    if ($create) {
        # log
        $answer = 'yes'
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $taskName
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doStep) { $answer = Read-Host -Prompt ( $taskLine ) }
        elseif ($doEcho) { Write-Host ( $taskLine ) }

        if ($answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {
            $storageContext = New-AzureStorageContext -ConnectionString $storageConnectionString

            $tableTineScriptRunLog = Get-AzureStorageTable -Context $storageContext -Name 'tineScriptRunLog' -ErrorAction SilentlyContinue

            if ( $tableTineScriptRunLog -ne $null ) {
                Remove-AzureStorageTable -Context $storageContext -Name 'tineScriptRunLog' -Force
            }

            # create new table
            $tableTineScriptRunLog = $null
            while ($tableTineScriptRunLog -eq $null) {
                # wait for an escalating number of seconds 
                $trials++
                if ($trials -gt 10) {
                    throw [Exception] ('Failed to create table')
                }

                Start-Sleep $trials

                # create new table
                $tableTineScriptRunLog = `
                    New-AzureStorageTable `
                        -Context $storageContext `
                        -Name 'tineScriptRunLog'

                if ( $tableTineScriptRunLog -ne $null ) {
                    # insert row
                    $tineScriptRunLog = 
                        New-Object `
                            -TypeName Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity `
                            -ArgumentList $tineScriptRunLogPartitionKey, $tineScriptRunLogRowKey

                    $tineScriptRunLog.Properties.Add( 'tine_script_run_log_id', [System.Guid]$tineScriptRunLogId)
                    $tineScriptRunLog.Properties.Add( 'tine_script_run_log_script_name', [System.String]$tineScriptRunLogScriptName)
                    $tineScriptRunLog.Properties.Add( 'tine_script_run_log_start_date_time', [System.DateTime]$tineScriptRunLogStartDateTime)
                    $tineScriptRunLog.Properties.Add( 'tine_script_run_log_end_date_time', [System.DateTime]$tineScriptRunLogEndDateTime)
                    $tineScriptRunLog.Properties.Add( 'tine_task_script_outcome_rcd', [System.String]$tineTaskScriptOutcomeRcd)
                    $tineScriptRunLog.Properties.Add( 'user_id', [System.Guid]$userId)
                    $tineScriptRunLog.Properties.Add( 'date_time', [System.DateTime]$dateTime)
                    $tineScriptRunLog.Properties.Add( 'tine_script_run_log_partition_key', [System.String]$tineScriptRunLogPartitionKey)
                    $tineScriptRunLog.Properties.Add( 'tine_script_run_log_row_key', [System.String]$tineScriptRunLogRowKey)
                    $tineScriptRunLog.Properties.Add( 'tine_script_run_log_script_file_name', [System.String]$tineScriptRunLogScriptFileName)
                    $tineScriptRunLog.Properties.Add( 'tine_creation_id', [System.Guid]$tineCreationId)
                    $tineScriptRunLog.Properties.Add( 'tine_task_id', [System.Guid]$tineTaskId)

                    $tableTineScriptRunLog.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Insert($tineScriptRunLog)) | Out-Null
                }
            }
        }
        # log
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'end:' + ' ' + $taskName
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doEcho) { Write-Host ( $taskLine ) }
    }
} catch [Exception] {
    if ($rethrow) {
        Write-Host ($taskName + ' ' + 'Exception; ' + $_.Exception.Message)
        try { Set-Location $startupDirectory } catch { }; throw [Exception] ('Failed to; ' + $taskName)
    } else {
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + ('Exception:' + ' ' + $taskName + ' ' + '[' +  $_.Exception.Message + ']' + ' ' + 'Line:[' + $_.InvocationInfo.ScriptLineNumber + ']')
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doEcho) { Write-Host ( $taskLine ) -ForegroundColor Red }
    }
} finally {
    if ($trials) { try { Remove-Variable -Name trials } catch {}}
    if ($tableTineScriptRunLog) { try { Remove-Variable -Name tableTineScriptRunLog } catch {}}
    if ($storageContext) { try { Remove-Variable -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'insert to tine_script_run_log'
#region
##################################################################################################################
try {
    if ($insert) {
        # log
        $answer = 'yes'
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $taskName
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doStep) { $answer = Read-Host -Prompt ( $taskLine ) }
        elseif ($doEcho) { Write-Host ( $taskLine ) }

        # validate tineScriptRunLogId ( primary key )
        if ($tineScriptRunLogId -eq '00000000-0000-0000-0000-000000000000') {
            # log
            $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'Primary Key:' + ' ' + 'tineScriptRunLogId' + ' ' + 'is missing'
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host ( $taskLine ) -ForegroundColor red }
            $answer = 'no'
        }

        if ($answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {

            # connect and validate table
            $storageContext = New-AzureStorageContext -ConnectionString $storageConnectionString

            $tableTineScriptRunLog = Get-AzureStorageTable -Context $storageContext -Name 'tineScriptRunLog' -ErrorAction SilentlyContinue

            if ( $tableTineScriptRunLog -eq $null ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_log table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # insert row
                $tineScriptRunLog =
                    New-Object `
                        -TypeName Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity `
                        -ArgumentList $tineScriptRunLogPartitionKey, $tineScriptRunLogRowKey

                $tineScriptRunLog.Properties.Add( 'tine_script_run_log_id', [System.Guid]$tineScriptRunLogId)
                $tineScriptRunLog.Properties.Add( 'tine_script_run_log_script_name', [System.String]$tineScriptRunLogScriptName)
                $tineScriptRunLog.Properties.Add( 'tine_script_run_log_start_date_time', [System.DateTime]$tineScriptRunLogStartDateTime)
                $tineScriptRunLog.Properties.Add( 'tine_script_run_log_end_date_time', [System.DateTime]$tineScriptRunLogEndDateTime)
                $tineScriptRunLog.Properties.Add( 'tine_task_script_outcome_rcd', [System.String]$tineTaskScriptOutcomeRcd)
                $tineScriptRunLog.Properties.Add( 'user_id', [System.Guid]$userId)
                $tineScriptRunLog.Properties.Add( 'date_time', [System.DateTime]$dateTime)
                $tineScriptRunLog.Properties.Add( 'tine_script_run_log_partition_key', [System.String]$tineScriptRunLogPartitionKey)
                $tineScriptRunLog.Properties.Add( 'tine_script_run_log_row_key', [System.String]$tineScriptRunLogRowKey)
                $tineScriptRunLog.Properties.Add( 'tine_script_run_log_script_file_name', [System.String]$tineScriptRunLogScriptFileName)
                $tineScriptRunLog.Properties.Add( 'tine_creation_id', [System.Guid]$tineCreationId)
                $tineScriptRunLog.Properties.Add( 'tine_task_id', [System.Guid]$tineTaskId)

                $tableTineScriptRunLog.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Insert($tineScriptRunLog)) | Out-Null
            }
        }
        # log
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'end:' + ' ' + $taskName
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doEcho) { Write-Host ( $taskLine ) }
    }
} catch [Exception] {
    if ($rethrow) {
        Write-Host ($taskName + ' ' + 'Exception; ' + $_.Exception.Message)
        try { Set-Location $startupDirectory } catch { }; throw [Exception] ('Failed to; ' + $taskName)
    } else {
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + ('Exception:' + ' ' + $taskName + ' ' + '[' +  $_.Exception.Message + ']' + ' ' + 'Line:[' + $_.InvocationInfo.ScriptLineNumber + ']')
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doEcho) { Write-Host ( $taskLine ) -ForegroundColor Red }
    }
} finally {
    if ($tineScriptRunLog) { try { Remove-Variable -Name tineScriptRunLog } catch {}}
    if ($tableTineScriptRunLog) { try { Remove-Variable -Name tableTineScriptRunLog } catch {}}
    if ($storageContext) { try { Remove-Variable -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'fetch from tine_script_run_log'
#region
##################################################################################################################
try {
    if ($fetch) {
        # log
        $answer = 'yes'
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $taskName
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doStep) { $answer = Read-Host -Prompt ( $taskLine ) }
        elseif ($doEcho) { Write-Host ( $taskLine ) }

        if ($answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {
            # connect and validate table
            $storageContext = New-AzureStorageContext -ConnectionString $storageConnectionString

            if ( !$whatIf ) {
                $tableTineScriptRunLog = Get-AzureStorageTable -Context $storageContext -Name 'tineScriptRunLog' -ErrorAction SilentlyContinue
            }

            if ( $tableTineScriptRunLog -eq $null -and !$whatIf ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_log table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $list = New-Object System.Collections.Generic.List[string]

                $list.Add( 'tine_script_run_log_id' )
                $list.Add( 'tine_script_run_log_script_name' )
                $list.Add( 'tine_script_run_log_start_date_time' )
                $list.Add( 'tine_script_run_log_end_date_time' )
                $list.Add( 'tine_task_script_outcome_rcd' )
                $list.Add( 'user_id' )
                $list.Add( 'date_time' )
                $list.Add( 'tine_script_run_log_partition_key' )
                $list.Add( 'tine_script_run_log_row_key' )
                $list.Add( 'tine_script_run_log_script_file_name' )
                $list.Add( 'tine_creation_id' )
                $list.Add( 'tine_task_id' )

                # filter tineScriptRunLogId ( primary key )
                if ($tineScriptRunLogId -ne  [TineScriptRunLogData]::new().tineScriptRunLogId) {
                    if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_script_run_log_id eq guid'''+ $tineScriptRunLogId + ''''
                }

                # filter tineTaskScriptOutcomeRcd ( foreign key )
                if ($tineTaskScriptOutcomeRcd -ne  [TineScriptRunLogData]::new().tineTaskScriptOutcomeRcd) {
                  if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_task_script_outcome_rcd eq '''+ $tineTaskScriptOutcomeRcd + ''''
                }

                # filter tineCreationId ( foreign key )
                if ($tineCreationId -ne  [TineScriptRunLogData]::new().tineCreationId) {
                  if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_creation_id eq guid'''+ $tineCreationId + ''''
                }

                # filter tineTaskId ( foreign key )
                if ($tineTaskId -ne  [TineScriptRunLogData]::new().tineTaskId) {
                  if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_task_id eq guid'''+ $tineTaskId + ''''
                }

                $query.SelectColumns = $list
                $query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptRunLog = $tableTineScriptRunLog.CloudTable.ExecuteQuery($query)
                }

                if ($tineScriptRunLogData) { try { Remove-Variable -Name tineScriptRunLogData } catch {}}

                if (($tineScriptRunLog | Measure-Object).Count -gt 0) {
                    $tineScriptRunLogData = [TineScriptRunLogData]::new()

                    $tineScriptRunLogData.tineScriptRunLogId = $tineScriptRunLog[0].Properties['tine_script_run_log_id'].GuidValue
                    $tineScriptRunLogData.tineScriptRunLogScriptName = $tineScriptRunLog[0].Properties['tine_script_run_log_script_name'].StringValue
                    $tineScriptRunLogData.tineScriptRunLogStartDateTime = $tineScriptRunLog[0].Properties['tine_script_run_log_start_date_time'].DateTime
                    $tineScriptRunLogData.tineScriptRunLogEndDateTime = $tineScriptRunLog[0].Properties['tine_script_run_log_end_date_time'].DateTime
                    $tineScriptRunLogData.tineTaskScriptOutcomeRcd = $tineScriptRunLog[0].Properties['tine_task_script_outcome_rcd'].StringValue
                    $tineScriptRunLogData.userId = $tineScriptRunLog[0].Properties['user_id'].GuidValue
                    $tineScriptRunLogData.dateTime = $tineScriptRunLog[0].Properties['date_time'].DateTime
                    $tineScriptRunLogData.tineScriptRunLogPartitionKey = $env:ComputerName
                    $tineScriptRunLogData.tineScriptRunLogRowKey = [System.DateTime]::UtcNow.ToString('yyyy.MM.ddTHH:mm:ss.fffZ')
                    $tineScriptRunLogData.tineScriptRunLogScriptFileName = $tineScriptRunLog[0].Properties['tine_script_run_log_script_file_name'].StringValue
                    $tineScriptRunLogData.tineCreationId = $tineScriptRunLog[0].Properties['tine_creation_id'].GuidValue
                    $tineScriptRunLogData.tineTaskId = $tineScriptRunLog[0].Properties['tine_task_id'].GuidValue

                    # to json
                    if ($returnJson) {
                        if ($outputJson) { try { Remove-Variable -Name outputJson } catch {}}

                        $outputJson = ConvertTo-Json -InputObject $tineScriptRunLogData
                    }

                }

                # check if any column parameter is chosen
                [boolean] $includeAll = $true
                foreach ($parameter in $PSBoundParameters.Keys) {
                    $includeAll -= ($parameter -eq 'tineScriptRunLogId')
                    $includeAll -= ($parameter -eq 'tineScriptRunLogScriptName')
                    $includeAll -= ($parameter -eq 'tineScriptRunLogStartDateTime')
                    $includeAll -= ($parameter -eq 'tineScriptRunLogEndDateTime')
                    $includeAll -= ($parameter -eq 'tineTaskScriptOutcomeRcd')
                    $includeAll -= ($parameter -eq 'userId')
                    $includeAll -= ($parameter -eq 'dateTime')
                    $includeAll -= ($parameter -eq 'tineScriptRunLogPartitionKey')
                    $includeAll -= ($parameter -eq 'tineScriptRunLogRowKey')
                    $includeAll -= ($parameter -eq 'tineScriptRunLogScriptFileName')
                    $includeAll -= ($parameter -eq 'tineCreationId')
                    $includeAll -= ($parameter -eq 'tineTaskId')
                }

                # property echo
                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineScriptRunLogId') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineScriptRunLogId' + '; [' + $tineScriptRunLogData.tineScriptRunLogId + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineScriptRunLogScriptName') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineScriptRunLogScriptName' + '; [' + $tineScriptRunLogData.tineScriptRunLogScriptName + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineScriptRunLogStartDateTime') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineScriptRunLogStartDateTime' + '; [' + $tineScriptRunLogData.tineScriptRunLogStartDateTime + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineScriptRunLogEndDateTime') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineScriptRunLogEndDateTime' + '; [' + $tineScriptRunLogData.tineScriptRunLogEndDateTime + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRcd') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskScriptOutcomeRcd' + '; [' + $tineScriptRunLogData.tineTaskScriptOutcomeRcd + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('userId') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'userId' + '; [' + $tineScriptRunLogData.userId + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('dateTime') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'dateTime' + '; [' + $tineScriptRunLogData.dateTime + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineScriptRunLogPartitionKey') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineScriptRunLogPartitionKey' + '; [' + $tineScriptRunLogData.tineScriptRunLogPartitionKey + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineScriptRunLogRowKey') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineScriptRunLogRowKey' + '; [' + $tineScriptRunLogData.tineScriptRunLogRowKey + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineScriptRunLogScriptFileName') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineScriptRunLogScriptFileName' + '; [' + $tineScriptRunLogData.tineScriptRunLogScriptFileName + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineCreationId') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineCreationId' + '; [' + $tineScriptRunLogData.tineCreationId + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskId') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskId' + '; [' + $tineScriptRunLogData.tineTaskId + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }
            }
        }
        # log
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'end:' + ' ' + $taskName
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doEcho) { Write-Host ( $taskLine ) }
    }
} catch [Exception] {
    if ($rethrow) {
        Write-Host ($taskName + ' ' + 'Exception; ' + $_.Exception.Message)
        try { Set-Location $startupDirectory } catch { }; throw [Exception] ('Failed to; ' + $taskName)
    } else {
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + ('Exception:' + ' ' + $taskName + ' ' + '[' +  $_.Exception.Message + ']' + ' ' + 'Line:[' + $_.InvocationInfo.ScriptLineNumber + ']')
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doEcho) { Write-Host ( $taskLine ) -ForegroundColor Red }
    }
} finally {
    if ($output) { try { Remove-Variable -Name output } catch {}}
    if ($list) { try { Remove-Variable -Name list } catch {}}
    if ($query) { try { Remove-Variable -Name query } catch {}}
    if ($tineScriptRunLog) { try { Remove-Variable -Name tineScriptRunLog } catch {}}
    if ($tableTineScriptRunLog) { try { Remove-Variable -Name tableTineScriptRunLog } catch {}}
    if ($storageContext) { try { Remove-Variable -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'update tine_script_run_log'
#region
##################################################################################################################
try {
    if ($updateByPrimaryKey) {
        # log
        $answer = 'yes'
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $taskName
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doStep) { $answer = Read-Host -Prompt ( $taskLine ) }
        elseif ($doEcho) { Write-Host ( $taskLine ) }

        if ($answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {
            # connect and validate table
            $storageContext = New-AzureStorageContext -ConnectionString $storageConnectionString

            if ( !$whatIf ) {
                $tableTineScriptRunLog = Get-AzureStorageTable -Context $storageContext -Name 'tineScriptRunLog' -ErrorAction SilentlyContinue
            }

            if ( $tableTineScriptRunLog -eq $null -and !$whatIf ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_log table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $list = New-Object System.Collections.Generic.List[string]


                $query.FilterString = 'tine_script_run_log_id eq guid'''+ $tineScriptRunLogId + ''''
                $query.SelectColumns = $list
                $query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptRunLogForUpdate = $tableTineScriptRunLog.CloudTable.ExecuteQuery($query)
                }

                foreach ( $item in $tineScriptRunLogForUpdate ) {
                    [string] $partitionKeyLocal = $item.PartitionKey
                    [string] $rowKeyLocal = $item.RowKey

                    # change task value
                    [Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity] $tineScriptRunLog = `
                        New-Object 'Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity' $partitionKeyLocal, $rowKeyLocal

                    $tineScriptRunLog.ETag = '*'
                    if ($PSBoundParameters.ContainsKey('tineScriptRunLogId')) { $tineScriptRunLog.Properties.Add( 'tine_script_run_log_id', [System.Guid]$tineScriptRunLogId) }
                    if ($PSBoundParameters.ContainsKey('tineScriptRunLogScriptName')) { $tineScriptRunLog.Properties.Add( 'tine_script_run_log_script_name', [System.String]$tineScriptRunLogScriptName) }
                    if ($PSBoundParameters.ContainsKey('tineScriptRunLogStartDateTime')) { $tineScriptRunLog.Properties.Add( 'tine_script_run_log_start_date_time', [System.DateTime]$tineScriptRunLogStartDateTime) }
                    if ($PSBoundParameters.ContainsKey('tineScriptRunLogEndDateTime')) { $tineScriptRunLog.Properties.Add( 'tine_script_run_log_end_date_time', [System.DateTime]$tineScriptRunLogEndDateTime) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRcd')) { $tineScriptRunLog.Properties.Add( 'tine_task_script_outcome_rcd', [System.String]$tineTaskScriptOutcomeRcd) }
                    if ($PSBoundParameters.ContainsKey('userId')) { $tineScriptRunLog.Properties.Add( 'user_id', [System.Guid]$userId) }
                    if ($PSBoundParameters.ContainsKey('dateTime')) { $tineScriptRunLog.Properties.Add( 'date_time', [System.DateTime]$dateTime) }
                    if ($PSBoundParameters.ContainsKey('tineScriptRunLogPartitionKey')) { $tineScriptRunLog.Properties.Add( 'tine_script_run_log_partition_key', [System.String]$tineScriptRunLogPartitionKey) }
                    if ($PSBoundParameters.ContainsKey('tineScriptRunLogRowKey')) { $tineScriptRunLog.Properties.Add( 'tine_script_run_log_row_key', [System.String]$tineScriptRunLogRowKey) }
                    if ($PSBoundParameters.ContainsKey('tineScriptRunLogScriptFileName')) { $tineScriptRunLog.Properties.Add( 'tine_script_run_log_script_file_name', [System.String]$tineScriptRunLogScriptFileName) }
                    if ($PSBoundParameters.ContainsKey('tineCreationId')) { $tineScriptRunLog.Properties.Add( 'tine_creation_id', [System.Guid]$tineCreationId) }
                    if ($PSBoundParameters.ContainsKey('tineTaskId')) { $tineScriptRunLog.Properties.Add( 'tine_task_id', [System.Guid]$tineTaskId) }

                    $tableTineScriptRunLog.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Merge($tineScriptRunLog)) | Out-Null
                }

                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'updated' + ':' + ' ' + $query.FilterString
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
            }
        }
        # log
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'end:' + ' ' + $taskName
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doEcho) { Write-Host ( $taskLine ) }
    }
} catch [Exception] {
    if ($rethrow) {
        Write-Host ($taskName + ' ' + 'Exception; ' + $_.Exception.Message)
        try { Set-Location $startupDirectory } catch { }; throw [Exception] ('Failed to; ' + $taskName)
    } else {
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + ('Exception:' + ' ' + $taskName + ' ' + '[' +  $_.Exception.Message + ']' + ' ' + 'Line:[' + $_.InvocationInfo.ScriptLineNumber + ']')
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doEcho) { Write-Host ( $taskLine ) -ForegroundColor Red }
    }
} finally {
    if ($tineScriptRunLogForUpdate) { try { Remove-Variable -Name tineScriptRunLogForUpdate } catch {}}
    if ($tableTineScriptRunLog) { try { Remove-Variable -Name tableTineScriptRunLog } catch {}}
    if ($partitionKeyLocal) { try { Remove-Variable -Name partitionKeyLocal } catch {}}
    if ($rowKeyLocal) { try { Remove-Variable -Name rowKeyLocal } catch {}}
    if ($tineScriptRunLog) { try { Remove-Variable -Name tineScriptRunLog } catch {}}
    if ($list) { try { Remove-Variable -Name list } catch {}}
    if ($query) { try { Remove-Variable -Name query } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'update tine_script_run_log by foreign keys'
#region
##################################################################################################################
try {
    if ($updateByForeignKeys) {
        # log
        $answer = 'yes'
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $taskName
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doStep) { $answer = Read-Host -Prompt ( $taskLine ) }
        elseif ($doEcho) { Write-Host ( $taskLine ) }

        if ($answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {
            # connect and validate table
            $storageContext = New-AzureStorageContext -ConnectionString $storageConnectionString

            if ( !$whatIf ) {
                $tableTineScriptRunLog = Get-AzureStorageTable -Context $storageContext -Name 'tineScriptRunLog' -ErrorAction SilentlyContinue
            }

            if ( $tableTineScriptRunLog -eq $null -and !$whatIf ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_log table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $list = New-Object System.Collections.Generic.List[string]

                $list.Add( 'tine_script_run_log_id' )
                $list.Add( 'tine_script_run_log_script_name' )
                $list.Add( 'tine_script_run_log_start_date_time' )
                $list.Add( 'tine_script_run_log_end_date_time' )
                $list.Add( 'tine_task_script_outcome_rcd' )
                $list.Add( 'user_id' )
                $list.Add( 'date_time' )
                $list.Add( 'tine_script_run_log_partition_key' )
                $list.Add( 'tine_script_run_log_row_key' )
                $list.Add( 'tine_script_run_log_script_file_name' )
                $list.Add( 'tine_creation_id' )
                $list.Add( 'tine_task_id' )

                # filter tineScriptRunLogId ( primary key )
                if ($tineScriptRunLogId -ne  [TineScriptRunLogData]::new().tineScriptRunLogId) {
                    if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_script_run_log_id eq guid'''+ $tineScriptRunLogId + ''''
                }

                # filter tineTaskScriptOutcomeRcd ( foreign key )
                if ($tineTaskScriptOutcomeRcd -ne  [TineScriptRunLogData]::new().tineTaskScriptOutcomeRcd) {
                  if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_task_script_outcome_rcd eq '''+ $tineTaskScriptOutcomeRcd + ''''
                }

                # filter tineCreationId ( foreign key )
                if ($tineCreationId -ne  [TineScriptRunLogData]::new().tineCreationId) {
                  if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_creation_id eq guid'''+ $tineCreationId + ''''
                }

                # filter tineTaskId ( foreign key )
                if ($tineTaskId -ne  [TineScriptRunLogData]::new().tineTaskId) {
                  if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_task_id eq guid'''+ $tineTaskId + ''''
                }

                $query.SelectColumns = $list
                $query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptRunLogForUpdate = $tableTineScriptRunLog.CloudTable.ExecuteQuery($query)
                }

                foreach ( $item in $tineScriptRunLogForUpdate ) {
                    [string] $partitionKeyLocal = $item.PartitionKey
                    [string] $rowKeyLocal = $item.RowKey

                    # change task value
                    [Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity] $tineScriptRunLog = `
                        New-Object 'Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity' $partitionKeyLocal, $rowKeyLocal

                    $tineScriptRunLog.ETag = '*'
                    if ($PSBoundParameters.ContainsKey('tineScriptRunLogId')) { $tineScriptRunLog.Properties.Add( 'tine_script_run_log_id', [System.Guid]$tineScriptRunLogId) }
                    if ($PSBoundParameters.ContainsKey('tineScriptRunLogScriptName')) { $tineScriptRunLog.Properties.Add( 'tine_script_run_log_script_name', [System.String]$tineScriptRunLogScriptName) }
                    if ($PSBoundParameters.ContainsKey('tineScriptRunLogStartDateTime')) { $tineScriptRunLog.Properties.Add( 'tine_script_run_log_start_date_time', [System.DateTime]$tineScriptRunLogStartDateTime) }
                    if ($PSBoundParameters.ContainsKey('tineScriptRunLogEndDateTime')) { $tineScriptRunLog.Properties.Add( 'tine_script_run_log_end_date_time', [System.DateTime]$tineScriptRunLogEndDateTime) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRcd')) { $tineScriptRunLog.Properties.Add( 'tine_task_script_outcome_rcd', [System.String]$tineTaskScriptOutcomeRcd) }
                    if ($PSBoundParameters.ContainsKey('userId')) { $tineScriptRunLog.Properties.Add( 'user_id', [System.Guid]$userId) }
                    if ($PSBoundParameters.ContainsKey('dateTime')) { $tineScriptRunLog.Properties.Add( 'date_time', [System.DateTime]$dateTime) }
                    if ($PSBoundParameters.ContainsKey('tineScriptRunLogPartitionKey')) { $tineScriptRunLog.Properties.Add( 'tine_script_run_log_partition_key', [System.String]$tineScriptRunLogPartitionKey) }
                    if ($PSBoundParameters.ContainsKey('tineScriptRunLogRowKey')) { $tineScriptRunLog.Properties.Add( 'tine_script_run_log_row_key', [System.String]$tineScriptRunLogRowKey) }
                    if ($PSBoundParameters.ContainsKey('tineScriptRunLogScriptFileName')) { $tineScriptRunLog.Properties.Add( 'tine_script_run_log_script_file_name', [System.String]$tineScriptRunLogScriptFileName) }
                    if ($PSBoundParameters.ContainsKey('tineCreationId')) { $tineScriptRunLog.Properties.Add( 'tine_creation_id', [System.Guid]$tineCreationId) }
                    if ($PSBoundParameters.ContainsKey('tineTaskId')) { $tineScriptRunLog.Properties.Add( 'tine_task_id', [System.Guid]$tineTaskId) }

                    $tableTineScriptRunLog.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Merge($tineScriptRunLog)) | Out-Null
                }

                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'updated' + ':' + ' ' + $query.FilterString
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
            }
        }
        # log
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'end:' + ' ' + $taskName
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doEcho) { Write-Host ( $taskLine ) }
    }
} catch [Exception] {
    if ($rethrow) {
        Write-Host ($taskName + ' ' + 'Exception; ' + $_.Exception.Message)
        try { Set-Location $startupDirectory } catch { }; throw [Exception] ('Failed to; ' + $taskName)
    } else {
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + ('Exception:' + ' ' + $taskName + ' ' + '[' +  $_.Exception.Message + ']' + ' ' + 'Line:[' + $_.InvocationInfo.ScriptLineNumber + ']')
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doEcho) { Write-Host ( $taskLine ) -ForegroundColor Red }
    }
} finally {
    if ($tineScriptRunLogForUpdate) { try { Remove-Variable -Name tineScriptRunLogForUpdate } catch {}}
    if ($tableTineScriptRunLog) { try { Remove-Variable -Name tableTineScriptRunLog } catch {}}
    if ($partitionKeyLocal) { try { Remove-Variable -Name partitionKeyLocal } catch {}}
    if ($rowKeyLocal) { try { Remove-Variable -Name rowKeyLocal } catch {}}
    if ($tineScriptRunLog) { try { Remove-Variable -Name tineScriptRunLog } catch {}}
    if ($list) { try { Remove-Variable -Name list } catch {}}
    if ($query) { try { Remove-Variable -Name query } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'delete from tine_script_run_log'
#region
##################################################################################################################
try {
    if ($delete) {
        # log
        $answer = 'yes'
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $taskName
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doStep) { $answer = Read-Host -Prompt ( $taskLine ) }
        elseif ($doEcho) { Write-Host ( $taskLine ) }

        if ($answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {
            # connect and validate table
            $storageContext = New-AzureStorageContext -ConnectionString $storageConnectionString

            $tableTineScriptRunLog = Get-AzureStorageTable -Context $storageContext -Name 'tineScriptRunLog' -ErrorAction SilentlyContinue

            if ( $tableTineScriptRunLog -eq $null ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_log table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $list = New-Object System.Collections.Generic.List[string]

                $list.Add( 'tine_script_run_log_id' )

                $query.FilterString = 'tine_script_run_log_id eq guid'''+ $tineScriptRunLogId + ''''
                $query.SelectColumns = $list
                $query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptRunLogForDelete = $tableTineScriptRunLog.CloudTable.ExecuteQuery($query)
                }

                # delete selected rows
                foreach ( $tineScriptRunLogItem in $tineScriptRunLogForDelete ) {
                    $tableTineScriptRunLog.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Delete($tineScriptRunLogItem)) | Out-Null
                }
            }
        }
        # log
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'end:' + ' ' + $taskName
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doEcho) { Write-Host ( $taskLine ) }
    }
} catch [Exception] {
    if ($rethrow) {
        Write-Host ($taskName + ' ' + 'Exception; ' + $_.Exception.Message)
        try { Set-Location $startupDirectory } catch { }; throw [Exception] ('Failed to; ' + $taskName)
    } else {
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + ('Exception:' + ' ' + $taskName + ' ' + '[' +  $_.Exception.Message + ']' + ' ' + 'Line:[' + $_.InvocationInfo.ScriptLineNumber + ']')
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doEcho) { Write-Host ( $taskLine ) -ForegroundColor Red }
    }
} finally {
    if ($list) { try { Remove-Variable -Name list } catch {}}
    if ($query) { try { Remove-Variable -Name query } catch {}}
    if ($tineScriptRunLogForDelete) { try { Remove-Variable -Name tineScriptRunLogForDelete } catch {}}
    if ($tineScriptRunLogItem) { try { Remove-Variable -Name tineScriptRunLogItem } catch {}}
    if ($tableTineScriptRunLog) { try { Remove-Variable -Name tableTineScriptRunLog } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'fetch value from tine_script_run_log'
#region
##################################################################################################################
try {
    if ($fetchValue -ne '') {
        # log
        $answer = 'yes'
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $taskName
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doStep) { $answer = Read-Host -Prompt ( $taskLine ) }
        elseif ($doEcho) { Write-Host ( $taskLine ) }

        if ($answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {
            # connect and validate table
            $storageContext = New-AzureStorageContext -ConnectionString $storageConnectionString

            if ( !$whatIf ) {
                $tableTineScriptRunLog = Get-AzureStorageTable -Context $storageContext -Name 'tineScriptRunLog' -ErrorAction SilentlyContinue
            }

            if ( $tableTineScriptRunLog -eq $null -and !$whatIf ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_log table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $list = New-Object System.Collections.Generic.List[string]

                $list.Add( $fetchValue )

                # filter tineScriptRunLogId ( primary key )
                if ($tineScriptRunLogId -ne  [TineScriptRunLogData]::new().tineScriptRunLogId) {
                    if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_script_run_log_id eq guid'''+ $tineScriptRunLogId + ''''
                }

                # filter tineTaskScriptOutcomeRcd ( foreign key )
                if ($tineTaskScriptOutcomeRcd -ne  [TineScriptRunLogData]::new().tineTaskScriptOutcomeRcd) {
                  if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_task_script_outcome_rcd eq '''+ $tineTaskScriptOutcomeRcd + ''''
                }

                # filter tineCreationId ( foreign key )
                if ($tineCreationId -ne  [TineScriptRunLogData]::new().tineCreationId) {
                  if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_creation_id eq guid'''+ $tineCreationId + ''''
                }

                # filter tineTaskId ( foreign key )
                if ($tineTaskId -ne  [TineScriptRunLogData]::new().tineTaskId) {
                  if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_task_id eq guid'''+ $tineTaskId + ''''
                }

                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + $query.FilterString
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }

                $query.SelectColumns = $list
                $query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptRunLog = $tableTineScriptRunLog.CloudTable.ExecuteQuery($query)
                }

                # get value
                [string] $outValue = ''
                if (($tineScriptRunLog | Measure-Object).Count -gt 0) {
                    $outValue = $tineScriptRunLog[0].Properties[$fetchValue].PropertyAsObject

                    # log
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + $fetchValue + '=' + '[' + $outValue + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }
            }
        }
        # log
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'end:' + ' ' + $taskName
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doEcho) { Write-Host ( $taskLine ) }
    }
} catch [Exception] {
    if ($rethrow) {
        Write-Host ($taskName + ' ' + 'Exception; ' + $_.Exception.Message)
        try { Set-Location $startupDirectory } catch { }; throw [Exception] ('Failed to; ' + $taskName)
    } else {
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + ('Exception:' + ' ' + $taskName + ' ' + '[' +  $_.Exception.Message + ']' + ' ' + 'Line:[' + $_.InvocationInfo.ScriptLineNumber + ']')
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doEcho) { Write-Host ( $taskLine ) -ForegroundColor Red }
    }
} finally {
    if ($list) { try { Remove-Variable -Name list } catch {}}
    if ($query) { try { Remove-Variable -Name query } catch {}}
    if ($tineScriptRunLog) { try { Remove-Variable -Name tineScriptRunLog } catch {}}
    if ($tableTineScriptRunLog) { try { Remove-Variable -Name tableTineScriptRunLog } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'delete all from tine_script_run_log'
#region
##################################################################################################################
try {
    if ($deleteAll) {
        # log
        $answer = 'yes'
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $taskName
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doStep) { $answer = Read-Host -Prompt ( $taskLine ) }
        elseif ($doEcho) { Write-Host ( $taskLine ) }

        if ($answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {
            # connect and validate table
            $storageContext = New-AzureStorageContext -ConnectionString $storageConnectionString

            $tableTineScriptRunLog = Get-AzureStorageTable -Context $storageContext -Name 'tineScriptRunLog' -ErrorAction SilentlyContinue

            if ( $tableTineScriptRunLog -eq $null ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_log table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $list = New-Object System.Collections.Generic.List[string]

                $list.Add( 'tine_script_run_log_id' )

                $query.SelectColumns = $list
                $query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptRunLogForDelete = $tableTineScriptRunLog.CloudTable.ExecuteQuery($query)
                }

                # delete selected rows
                foreach ( $tineScriptRunLogItem in $tineScriptRunLogForDelete ) {
                    $tableTineScriptRunLog.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Delete($tineScriptRunLogItem)) | Out-Null
                }
            }
        }
        # log
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'end:' + ' ' + $taskName
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doEcho) { Write-Host ( $taskLine ) }
    }
} catch [Exception] {
    if ($rethrow) {
        Write-Host ($taskName + ' ' + 'Exception; ' + $_.Exception.Message)
        try { Set-Location $startupDirectory } catch { }; throw [Exception] ('Failed to; ' + $taskName)
    } else {
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + ('Exception:' + ' ' + $taskName + ' ' + '[' +  $_.Exception.Message + ']' + ' ' + 'Line:[' + $_.InvocationInfo.ScriptLineNumber + ']')
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doEcho) { Write-Host ( $taskLine ) -ForegroundColor Red }
    }
} finally {
    if ($list) { try { Remove-Variable -Name list } catch {}}
    if ($query) { try { Remove-Variable -Name query } catch {}}
    if ($tineScriptRunLogForDelete) { try { Remove-Variable -Name tineScriptRunLogForDelete } catch {}}
    if ($tineScriptRunLogItem) { try { Remove-Variable -Name tineScriptRunLogItem } catch {}}
    if ($tableTineScriptRunLog) { try { Remove-Variable -Name tableTineScriptRunLog } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'show tine_script_run_log'
#region
##################################################################################################################
try {
    if ($show) {
        # log
        $answer = 'yes'
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $taskName
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doStep) { $answer = Read-Host -Prompt ( $taskLine ) }
        elseif ($doEcho) { Write-Host ( $taskLine ) }

        if ($answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {
            # connect and validate table
            $storageContext = New-AzureStorageContext -ConnectionString $storageConnectionString

            $tableTineScriptRunLog = Get-AzureStorageTable -Context $storageContext -Name 'tineScriptRunLog' -ErrorAction SilentlyContinue

            if ( $tableTineScriptRunLog -eq $null ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_log table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $list = New-Object System.Collections.Generic.List[string]

                $list.Add( 'tine_script_run_log_id' )
                $list.Add( 'tine_script_run_log_script_name' )
                $list.Add( 'tine_script_run_log_start_date_time' )
                $list.Add( 'tine_script_run_log_end_date_time' )
                $list.Add( 'tine_task_script_outcome_rcd' )
                $list.Add( 'user_id' )
                $list.Add( 'date_time' )
                $list.Add( 'tine_script_run_log_partition_key' )
                $list.Add( 'tine_script_run_log_row_key' )
                $list.Add( 'tine_script_run_log_script_file_name' )
                $list.Add( 'tine_creation_id' )
                $list.Add( 'tine_task_id' )

                $query.SelectColumns = $list
                $query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptRunLog = $tableTineScriptRunLog.CloudTable.ExecuteQuery($query)
                }

                # echo
                [string] $output = ''
                $output = $tineScriptRunLog `
                    | Format-Table PartitionKey, RowKey, `
                    @{ Label = 'Tine Script Run Log Id'; Expression={$_.Properties['tine_script_run_log_id'].GuidValue} },`
                    @{ Label = 'Tine Script Run Log Script Name'; Expression={$_.Properties['tine_script_run_log_script_name'].StringValue} },`
                    @{ Label = 'Tine Script Run Log Start Date Time'; Expression={$_.Properties['tine_script_run_log_start_date_time'].StringValue} },`
                    @{ Label = 'Tine Script Run Log End Date Time'; Expression={$_.Properties['tine_script_run_log_end_date_time'].StringValue} },`
                    @{ Label = 'Tine Task Script Outcome'; Expression={$_.Properties['tine_task_script_outcome_rcd'].StringValue} },`
                    @{ Label = 'User Id'; Expression={$_.Properties['user_id'].GuidValue} },`
                    @{ Label = 'Date Time'; Expression={$_.Properties['date_time'].StringValue} },`
                    @{ Label = 'Tine Script Run Log Partition Key'; Expression={$_.Properties['tine_script_run_log_partition_key'].StringValue} },`
                    @{ Label = 'Tine Script Run Log Row Key'; Expression={$_.Properties['tine_script_run_log_row_key'].StringValue} },`
                    @{ Label = 'Tine Script Run Log Script File Name'; Expression={$_.Properties['tine_script_run_log_script_file_name'].StringValue} },`
                    @{ Label = 'Tine Creation Id'; Expression={$_.Properties['tine_creation_id'].GuidValue} },`
                    @{ Label = 'Tine Task Id'; Expression={$_.Properties['tine_task_id'].GuidValue} } `
                    -AutoSize `
                    | Out-String;

                # log
                if ($output -ne '') {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + $output
                } else {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'no result for ' + 'tine_script_run_log' #+ ': ' + $query.FilterString
                }
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
            }
        }
        # log
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'end:' + ' ' + $taskName
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doEcho) { Write-Host ( $taskLine ) }
    }
} catch [Exception] {
    if ($rethrow) {
        Write-Host ($taskName + ' ' + 'Exception; ' + $_.Exception.Message)
        try { Set-Location $startupDirectory } catch { }; throw [Exception] ('Failed to; ' + $taskName)
    } else {
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + ('Exception:' + ' ' + $taskName + ' ' + '[' +  $_.Exception.Message + ']' + ' ' + 'Line:[' + $_.InvocationInfo.ScriptLineNumber + ']')
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doEcho) { Write-Host ( $taskLine ) -ForegroundColor Red }
    }
} finally {
    if ($output) { try { Remove-Variable -Name output } catch {}}
    if ($list) { try { Remove-Variable -Name list } catch {}}
    if ($query) { try { Remove-Variable -Name query } catch {}}
    if ($tineScriptRunLog) { try { Remove-Variable -Name tineScriptRunLog } catch {}}
    if ($tableTineScriptRunLog) { try { Remove-Variable -Name tableTineScriptRunLog } catch {}}
    if ($storageContext) { try { Remove-Variable -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'drop tine_script_run_log'
#region
##################################################################################################################
try {
    if ($drop) {
        # log
        $answer = 'yes'
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $taskName
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doStep) { $answer = Read-Host -Prompt ( $taskLine ) }
        elseif ($doEcho) { Write-Host ( $taskLine ) }

        if ($answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {
            $storageContext = New-AzureStorageContext -ConnectionString $storageConnectionString

            $tableTineScriptRunLog = Get-AzureStorageTable -Context $storageContext -Name 'tineScriptRunLog' -ErrorAction SilentlyContinue

            if ( $tableTineScriptRunLog -eq $null ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_log table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                Remove-AzureStorageTable -Context $storageContext -Name 'tineScriptRunLog' -Force
            }
        }
        # log
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'end:' + ' ' + $taskName
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doEcho) { Write-Host ( $taskLine ) }
    }
} catch [Exception] {
    if ($rethrow) {
        Write-Host ($taskName + ' ' + 'Exception; ' + $_.Exception.Message)
        try { Set-Location $startupDirectory } catch { }; throw [Exception] ('Failed to; ' + $taskName)
    } else {
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + ('Exception:' + ' ' + $taskName + ' ' + '[' +  $_.Exception.Message + ']' + ' ' + 'Line:[' + $_.InvocationInfo.ScriptLineNumber + ']')
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doEcho) { Write-Host ( $taskLine ) -ForegroundColor Red }
    }
} finally {
    if ($tableTineScriptRunLog) { try { Remove-Variable -Name tableTineScriptRunLog } catch {}}
    if ($storageContext) { try { Remove-Variable -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'mail status'
#region
##################################################################################################################
try {
    $answer = 'yes'

    # log
    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'start:' + ' ' + $taskName
    $htmlLog = $htmlLog + $taskLine + '<br>'
    if ($doStep) { $answer = Read-Host -Prompt ( $taskLine ) }
    elseif ($doEcho) { Write-Host ( $taskLine ) }

    if ($sendMail -and $answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x -or $mailAnyway)) {
        $SMTPClient = New-Object System.Net.Mail.SmtpClient
        $SMTPClient.Port = 25 # 587
        $SMTPClient.Host = 'smtp.live.com'
        $SMTPClient.EnableSsl = $true
        $SMTPClient.Timeout = 10000;
        $SMTPClient.DeliveryMethod = ([System.Net.Mail.SmtpDeliveryMethod]::Network)
        $SMTPClient.UseDefaultCredentials = $false

        $SMTPClient.Credentials = New-Object System.Net.NetworkCredential( `
            'xxx' , `
            'xxx' `
            );

        $emailMessage = New-Object System.Net.Mail.MailMessage
        $emailMessage.From = 'xxx'
        $emailMessage.To.Add('xxx')
        $emailMessage.Subject = ($env:ComputerName + ' : ' + $MyInvocation.MyCommand.Name)
        $emailMessage.Body = $htmlLog
        $emailMessage.IsBodyHtml = $true
        $emailMessage.BodyEncoding = ([System.Text.UTF8Encoding]::UTF8)
        $emailMessage.DeliveryNotificationOptions = ([System.Net.Mail.DeliveryNotificationOptions]::OnFailure)

        $SMTPClient.Send( $emailMessage )
        $SMTPClient.Dispose()
    }

    # log
    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'end:' + ' ' + $taskName
    $htmlLog = $htmlLog + $taskLine + '<br>'
    if ($doEcho) { Write-Host ( $taskLine ) }
} catch [Exception] {
    if ($rethrow) {
        Write-Host ($taskName + ' ' + 'Exception; ' + $_.Exception.Message)
        try { Set-Location $startupDirectory } catch { }; throw [Exception] ('Failed to; ' + $taskName)
    } else {
        $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + ('Exception:' + ' ' + $taskName + ' ' + '[' +  $_.Exception.Message + ']' + ' ' + 'Line:[' + $_.InvocationInfo.ScriptLineNumber + ']')
        $htmlLog = $htmlLog + $taskLine + '<br>'
        if ($doEcho) { Write-Host ( $taskLine ) -ForegroundColor Red }
    }
} finally {
    if ($SMTPClient) { try { Remove-Variable -Name SMTPClient } catch {} }
    if ($emailMessage) { try { Remove-Variable -Name emailMessage } catch {} }
}
#endregion
##################################################################################################################
$taskName = 'end script:'
#region
##################################################################################################################
$dateTimeStop = [System.DateTime]::UtcNow
$taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + $taskName `
    + ' ' + '[' + $MyInvocation.MyCommand.Name `
    + ' ' + $MyInvocation.MyCommand.Arguments + ']' `
    + ' ' + 'from' + ' ' + '[' + $dateTimeStart + ']' `
    + ' ' + 'to' + ' ' + '[' + $dateTimeStop  + ']'
$htmlLog = $htmlLog + $taskLine + '<br>'
if ($doEcho) { Write-Host ( $taskLine ) }
#endregion
##################################################################################################################
$taskName = 'cleanup'
#region
##################################################################################################################
if ($storageConnectionString) { try { Remove-Variable -Name storageConnectionString } catch {}}

if ($startupDirectory) { try { Remove-Variable -Name startupDirectory } catch {} }

if ($mailAnyway) { try { Remove-Variable -Name mailAnyway } catch {} }
if ($answer) { try { Remove-Variable -Name answer } catch {} }
if ($taskLine) { try { Remove-Variable -Name taskLine } catch {} }
if ($taskName) { try { Remove-Variable -Name taskName } catch {} }

if ($returnHtml -and $htmlLog) {
    try { $htmlLog; Remove-Variable -Name htmlLog; return } catch {} }
elseif ($htmlLog) {
    try { Remove-Variable -Name htmlLog } catch {} }
#endregion

if ($returnValue) {
    $outValue
}

if ($returnJson) {
    $outputJson
}

if ($returnObject) {
    $tineScriptRunLogData
}

if ($returnGridView) {
    $tineScriptRunLogData | Out-GridView
}
