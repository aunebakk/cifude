# SQL2X Generated code based on a SQL Server Schema
# SQL2X Version: 0.d
# http://sql2x.azurewebsites.net/
# Generated Date: 7/29/2018 9:45:06 AM
# Template: sql2x.PowerShellGenerator.CifudeScript
#
# .\cifude\tine_task.ps1 -doEcho       -doSql2x -comment test -create
# .\cifude\tine_task.ps1 -doEcho       -doSql2x -comment test -insert               -tineTaskId:([guid]'00000000-0000-0000-0000-000000000000')
# .\cifude\tine_task.ps1 -doEcho       -doSql2x -comment test -fetch                -tineTaskId:([guid]'00000000-0000-0000-0000-000000000000')
# .\cifude\tine_task.ps1 -returnValue  -doSql2x -comment test -fetchValue:column    -tineTaskId:([guid]'00000000-0000-0000-0000-000000000000')
# .\cifude\tine_task.ps1 -doEcho       -doSql2x -comment test -updateByPrimaryKey   -tineTaskId:([guid]'00000000-0000-0000-0000-000000000000') -show
# .\cifude\tine_task.ps1 -doEcho       -doSql2x -comment test -updateByForeignKeys  -show
# .\cifude\tine_task.ps1 -doEcho       -doSql2x -comment test -deleteAll
# .\cifude\tine_task.ps1 -doEcho       -doSql2x -comment test -delete               -tineTaskId:([guid]'00000000-0000-0000-0000-000000000000')
# .\cifude\tine_task.ps1 -doEcho       -doSql2x -comment test -drop
# .\cifude\tine_task.ps1 -doEcho       -doSql2x -comment test -show
# .\cifude\tine_task.ps1 -doEcho       -doSql2x -comment test -help
#
# all
# .\cifude\tine_task.ps1 -doEcho       -doSql2x -comment test -create -insert -fetch -fetchValue:column -update -show -delete -drop -tineTaskId:([guid]'00000000-0000-0000-0000-000000000000')
# [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSPossibleIncorrectComparisonWithNull', Scope='Function', Target='*')]  # because, history!
param (
    [string]$scriptName = 'CIFUDE ( Create Insert Fetch Update Delete Extras ) for tine_task',
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
    [System.Guid]$tineTaskId = '00000000-0000-0000-0000-000000000000',
    [System.String]$tineTaskScriptName = '',
    [System.DateTime]$tineTaskScriptStartDateTime = '1601.01.01T00:00:00Z',
    [System.DateTime]$tineTaskScriptEndDateTime = '1601.01.01T00:00:00Z',
    [System.Guid]$userId = '00000000-0000-0000-0000-000000000000',
    [System.DateTime]$dateTime = '1601.01.01T00:00:00Z',
    [System.String]$tineTaskRcd = '',
    [System.String]$tineTaskScriptOutcomeRcd = '',
    [System.String]$tineTaskPartitionKeyComputerName = $env:ComputerName,
    [System.String]$tineTaskRowKeyUtcDateTime = [System.DateTime]::UtcNow.ToString('yyyy.MM.dd HH:mm:ss fff'),
    [System.Guid]$tineMachineId = '00000000-0000-0000-0000-000000000000',
    [System.String]$tineTaskStatusRcd = '',
    [System.Guid]$tineScriptLibraryId = '00000000-0000-0000-0000-000000000000',
    [System.Guid]$tineCreationId = '00000000-0000-0000-0000-000000000000'

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

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.Guid] tineTaskId = '00000000-0000-0000-0000-000000000000'")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.String] tineTaskScriptName = ''")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.DateTime] tineTaskScriptStartDateTime = '1601.01.01T00:00:00Z'")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.DateTime] tineTaskScriptEndDateTime = '1601.01.01T00:00:00Z'")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.Guid] userId = '00000000-0000-0000-0000-000000000000'")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.DateTime] dateTime = '1601.01.01T00:00:00Z'")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.String] tineTaskRcd = ''")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.String] tineTaskScriptOutcomeRcd = ''")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.String] tineTaskPartitionKeyComputerName = $env:ComputerName")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.String] tineTaskRowKeyUtcDateTime = [System.DateTime]::UtcNow.ToString('yyyy.MM.dd HH:mm:ss fff')")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.Guid] tineMachineId = '00000000-0000-0000-0000-000000000000'")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.String] tineTaskStatusRcd = ''")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.Guid] tineScriptLibraryId = '00000000-0000-0000-0000-000000000000'")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.Guid] tineCreationId = '00000000-0000-0000-0000-000000000000'")
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
class TineTaskData {
    [System.Guid]$tineTaskId = '00000000-0000-0000-0000-000000000000'
    [System.String]$tineTaskScriptName = ''
    [System.DateTime]$tineTaskScriptStartDateTime = '1601.01.01T00:00:00Z'
    [System.DateTime]$tineTaskScriptEndDateTime = '1601.01.01T00:00:00Z'
    [System.Guid]$userId = '00000000-0000-0000-0000-000000000000'
    [System.DateTime]$dateTime = '1601.01.01T00:00:00Z'
    [System.String]$tineTaskRcd = ''
    [System.String]$tineTaskScriptOutcomeRcd = ''
    [System.String]$tineTaskPartitionKeyComputerName = $env:ComputerName
    [System.String]$tineTaskRowKeyUtcDateTime = [System.DateTime]::UtcNow.ToString('yyyy.MM.dd HH:mm:ss fff')
    [System.Guid]$tineMachineId = '00000000-0000-0000-0000-000000000000'
    [System.String]$tineTaskStatusRcd = ''
    [System.Guid]$tineScriptLibraryId = '00000000-0000-0000-0000-000000000000'
    [System.Guid]$tineCreationId = '00000000-0000-0000-0000-000000000000'
}
#endregion
##################################################################################################################
$taskName = 'create tine_task'
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

            $tableTineTask = Get-AzureStorageTable -Context $storageContext -Name 'tineTask' -ErrorAction SilentlyContinue

            if ( $tableTineTask -ne $null ) {
                Remove-AzureStorageTable -Context $storageContext -Name 'tineTask' -Force
            }

            # create new table
            $tableTineTask = $null
            while ($tableTineTask -eq $null) {
                # wait for an escalating number of seconds 
                $trials++
                if ($trials -gt 10) {
                    throw [Exception] ('Failed to create table')
                }

                Start-Sleep $trials

                # create new table
                $tableTineTask = `
                    New-AzureStorageTable `
                        -Context $storageContext `
                        -Name 'tineTask'

                if ( $tableTineTask -ne $null ) {
                    # insert row
                    $tineTask = 
                        New-Object `
                            -TypeName Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity `
                            -ArgumentList $tineTaskPartitionKeyComputerName, $tineTaskRowKeyUtcDateTime

                    $tineTask.Properties.Add( 'tine_task_id', [System.Guid]$tineTaskId)
                    $tineTask.Properties.Add( 'tine_task_script_name', [System.String]$tineTaskScriptName)
                    $tineTask.Properties.Add( 'tine_task_script_start_date_time', [System.DateTime]$tineTaskScriptStartDateTime)
                    $tineTask.Properties.Add( 'tine_task_script_end_date_time', [System.DateTime]$tineTaskScriptEndDateTime)
                    $tineTask.Properties.Add( 'user_id', [System.Guid]$userId)
                    $tineTask.Properties.Add( 'date_time', [System.DateTime]$dateTime)
                    $tineTask.Properties.Add( 'tine_task_rcd', [System.String]$tineTaskRcd)
                    $tineTask.Properties.Add( 'tine_task_script_outcome_rcd', [System.String]$tineTaskScriptOutcomeRcd)
                    $tineTask.Properties.Add( 'tine_task_partition_key_computer_name', [System.String]$tineTaskPartitionKeyComputerName)
                    $tineTask.Properties.Add( 'tine_task_row_key_utc_date_time', [System.String]$tineTaskRowKeyUtcDateTime)
                    $tineTask.Properties.Add( 'tine_machine_id', [System.Guid]$tineMachineId)
                    $tineTask.Properties.Add( 'tine_task_status_rcd', [System.String]$tineTaskStatusRcd)
                    $tineTask.Properties.Add( 'tine_script_library_id', [System.Guid]$tineScriptLibraryId)
                    $tineTask.Properties.Add( 'tine_creation_id', [System.Guid]$tineCreationId)

                    $tableTineTask.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Insert($tineTask)) | Out-Null
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
    if ($tableTineTask) { try { Remove-Variable -Name tableTineTask } catch {}}
    if ($storageContext) { try { Remove-Variable -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'insert to tine_task'
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

        # validate tineTaskId ( primary key )
        if ($tineTaskId -eq '00000000-0000-0000-0000-000000000000') {
            # log
            $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'Primary Key:' + ' ' + 'tineTaskId' + ' ' + 'is missing'
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host ( $taskLine ) -ForegroundColor red }
            $answer = 'no'
        }

        # validate tineTaskRcd ( foreign key )
        if ($tineTaskRcd -eq '') {
            # log
            $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'Foreign Key:' + ' ' + 'tineTaskRcd' + ' ' + 'is missing'
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host ( $taskLine ) -ForegroundColor red }
            $answer = 'no'
        }

        # validate tineTaskStatusRcd ( foreign key )
        if ($tineTaskStatusRcd -eq '') {
            # log
            $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'Foreign Key:' + ' ' + 'tineTaskStatusRcd' + ' ' + 'is missing'
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host ( $taskLine ) -ForegroundColor red }
            $answer = 'no'
        }

        if ($answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {

            # connect and validate table
            $storageContext = New-AzureStorageContext -ConnectionString $storageConnectionString

            $tableTineTask = Get-AzureStorageTable -Context $storageContext -Name 'tineTask' -ErrorAction SilentlyContinue

            if ( $tableTineTask -eq $null ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # insert row
                $tineTask =
                    New-Object `
                        -TypeName Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity `
                        -ArgumentList $tineTaskPartitionKeyComputerName, $tineTaskRowKeyUtcDateTime

                $tineTask.Properties.Add( 'tine_task_id', [System.Guid]$tineTaskId)
                $tineTask.Properties.Add( 'tine_task_script_name', [System.String]$tineTaskScriptName)
                $tineTask.Properties.Add( 'tine_task_script_start_date_time', [System.DateTime]$tineTaskScriptStartDateTime)
                $tineTask.Properties.Add( 'tine_task_script_end_date_time', [System.DateTime]$tineTaskScriptEndDateTime)
                $tineTask.Properties.Add( 'user_id', [System.Guid]$userId)
                $tineTask.Properties.Add( 'date_time', [System.DateTime]$dateTime)
                $tineTask.Properties.Add( 'tine_task_rcd', [System.String]$tineTaskRcd)
                $tineTask.Properties.Add( 'tine_task_script_outcome_rcd', [System.String]$tineTaskScriptOutcomeRcd)
                $tineTask.Properties.Add( 'tine_task_partition_key_computer_name', [System.String]$tineTaskPartitionKeyComputerName)
                $tineTask.Properties.Add( 'tine_task_row_key_utc_date_time', [System.String]$tineTaskRowKeyUtcDateTime)
                $tineTask.Properties.Add( 'tine_machine_id', [System.Guid]$tineMachineId)
                $tineTask.Properties.Add( 'tine_task_status_rcd', [System.String]$tineTaskStatusRcd)
                $tineTask.Properties.Add( 'tine_script_library_id', [System.Guid]$tineScriptLibraryId)
                $tineTask.Properties.Add( 'tine_creation_id', [System.Guid]$tineCreationId)

                $tableTineTask.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Insert($tineTask)) | Out-Null
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
    if ($tineTask) { try { Remove-Variable -Name tineTask } catch {}}
    if ($tableTineTask) { try { Remove-Variable -Name tableTineTask } catch {}}
    if ($storageContext) { try { Remove-Variable -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'fetch from tine_task'
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
                $tableTineTask = Get-AzureStorageTable -Context $storageContext -Name 'tineTask' -ErrorAction SilentlyContinue
            }

            if ( $tableTineTask -eq $null -and !$whatIf ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $list = New-Object System.Collections.Generic.List[string]

                $list.Add( 'tine_task_id' )
                $list.Add( 'tine_task_script_name' )
                $list.Add( 'tine_task_script_start_date_time' )
                $list.Add( 'tine_task_script_end_date_time' )
                $list.Add( 'user_id' )
                $list.Add( 'date_time' )
                $list.Add( 'tine_task_rcd' )
                $list.Add( 'tine_task_script_outcome_rcd' )
                $list.Add( 'tine_task_partition_key_computer_name' )
                $list.Add( 'tine_task_row_key_utc_date_time' )
                $list.Add( 'tine_machine_id' )
                $list.Add( 'tine_task_status_rcd' )
                $list.Add( 'tine_script_library_id' )
                $list.Add( 'tine_creation_id' )

                # filter tineTaskId ( primary key )
                if ($tineTaskId -ne  [TineTaskData]::new().tineTaskId) {
                    if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_task_id eq guid'''+ $tineTaskId + ''''
                }

                # filter tineTaskRcd ( foreign key )
                if ($tineTaskRcd -ne  [TineTaskData]::new().tineTaskRcd) {
                  if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_task_rcd eq '''+ $tineTaskRcd + ''''
                }

                # filter tineTaskScriptOutcomeRcd ( foreign key )
                if ($tineTaskScriptOutcomeRcd -ne  [TineTaskData]::new().tineTaskScriptOutcomeRcd) {
                  if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_task_script_outcome_rcd eq '''+ $tineTaskScriptOutcomeRcd + ''''
                }

                # filter tineMachineId ( foreign key )
                if ($tineMachineId -ne  [TineTaskData]::new().tineMachineId) {
                  if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_machine_id eq guid'''+ $tineMachineId + ''''
                }

                # filter tineTaskStatusRcd ( foreign key )
                if ($tineTaskStatusRcd -ne  [TineTaskData]::new().tineTaskStatusRcd) {
                  if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_task_status_rcd eq '''+ $tineTaskStatusRcd + ''''
                }

                # filter tineScriptLibraryId ( foreign key )
                if ($tineScriptLibraryId -ne  [TineTaskData]::new().tineScriptLibraryId) {
                  if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_script_library_id eq guid'''+ $tineScriptLibraryId + ''''
                }

                # filter tineCreationId ( foreign key )
                if ($tineCreationId -ne  [TineTaskData]::new().tineCreationId) {
                  if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_creation_id eq guid'''+ $tineCreationId + ''''
                }

                $query.SelectColumns = $list
                $query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTask = $tableTineTask.CloudTable.ExecuteQuery($query)
                }

                if ($tineTaskData) { try { Remove-Variable -Name tineTaskData } catch {}}

                if (($tineTask | Measure-Object).Count -gt 0) {
                    $tineTaskData = [TineTaskData]::new()

                    $tineTaskData.tineTaskId = $tineTask[0].Properties['tine_task_id'].GuidValue
                    $tineTaskData.tineTaskScriptName = $tineTask[0].Properties['tine_task_script_name'].StringValue
                    $tineTaskData.tineTaskScriptStartDateTime = $tineTask[0].Properties['tine_task_script_start_date_time'].DateTime
                    $tineTaskData.tineTaskScriptEndDateTime = $tineTask[0].Properties['tine_task_script_end_date_time'].DateTime
                    $tineTaskData.userId = $tineTask[0].Properties['user_id'].GuidValue
                    $tineTaskData.dateTime = $tineTask[0].Properties['date_time'].DateTime
                    $tineTaskData.tineTaskRcd = $tineTask[0].Properties['tine_task_rcd'].StringValue
                    $tineTaskData.tineTaskScriptOutcomeRcd = $tineTask[0].Properties['tine_task_script_outcome_rcd'].StringValue
                    $tineTaskData.tineTaskPartitionKeyComputerName = $env:ComputerName
                    $tineTaskData.tineTaskRowKeyUtcDateTime = [System.DateTime]::UtcNow.ToString('yyyy.MM.dd HH:mm:ss fff')
                    $tineTaskData.tineMachineId = $tineTask[0].Properties['tine_machine_id'].GuidValue
                    $tineTaskData.tineTaskStatusRcd = $tineTask[0].Properties['tine_task_status_rcd'].StringValue
                    $tineTaskData.tineScriptLibraryId = $tineTask[0].Properties['tine_script_library_id'].GuidValue
                    $tineTaskData.tineCreationId = $tineTask[0].Properties['tine_creation_id'].GuidValue

                    # to json
                    if ($returnJson) {
                        if ($outputJson) { try { Remove-Variable -Name outputJson } catch {}}

                        $outputJson = ConvertTo-Json -InputObject $tineTaskData
                    }

                }

                # check if any column parameter is chosen
                [boolean] $includeAll = $true
                foreach ($parameter in $PSBoundParameters.Keys) {
                    $includeAll -= ($parameter -eq 'tineTaskId')
                    $includeAll -= ($parameter -eq 'tineTaskScriptName')
                    $includeAll -= ($parameter -eq 'tineTaskScriptStartDateTime')
                    $includeAll -= ($parameter -eq 'tineTaskScriptEndDateTime')
                    $includeAll -= ($parameter -eq 'userId')
                    $includeAll -= ($parameter -eq 'dateTime')
                    $includeAll -= ($parameter -eq 'tineTaskRcd')
                    $includeAll -= ($parameter -eq 'tineTaskScriptOutcomeRcd')
                    $includeAll -= ($parameter -eq 'tineTaskPartitionKeyComputerName')
                    $includeAll -= ($parameter -eq 'tineTaskRowKeyUtcDateTime')
                    $includeAll -= ($parameter -eq 'tineMachineId')
                    $includeAll -= ($parameter -eq 'tineTaskStatusRcd')
                    $includeAll -= ($parameter -eq 'tineScriptLibraryId')
                    $includeAll -= ($parameter -eq 'tineCreationId')
                }

                # property echo
                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskId') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskId' + '; [' + $tineTaskData.tineTaskId + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskScriptName') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskScriptName' + '; [' + $tineTaskData.tineTaskScriptName + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskScriptStartDateTime') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskScriptStartDateTime' + '; [' + $tineTaskData.tineTaskScriptStartDateTime + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskScriptEndDateTime') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskScriptEndDateTime' + '; [' + $tineTaskData.tineTaskScriptEndDateTime + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('userId') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'userId' + '; [' + $tineTaskData.userId + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('dateTime') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'dateTime' + '; [' + $tineTaskData.dateTime + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskRcd') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskRcd' + '; [' + $tineTaskData.tineTaskRcd + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRcd') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskScriptOutcomeRcd' + '; [' + $tineTaskData.tineTaskScriptOutcomeRcd + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskPartitionKeyComputerName') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskPartitionKeyComputerName' + '; [' + $tineTaskData.tineTaskPartitionKeyComputerName + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskRowKeyUtcDateTime') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskRowKeyUtcDateTime' + '; [' + $tineTaskData.tineTaskRowKeyUtcDateTime + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineMachineId') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineMachineId' + '; [' + $tineTaskData.tineMachineId + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskStatusRcd') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskStatusRcd' + '; [' + $tineTaskData.tineTaskStatusRcd + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineScriptLibraryId') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineScriptLibraryId' + '; [' + $tineTaskData.tineScriptLibraryId + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineCreationId') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineCreationId' + '; [' + $tineTaskData.tineCreationId + ']'
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
    if ($tineTask) { try { Remove-Variable -Name tineTask } catch {}}
    if ($tableTineTask) { try { Remove-Variable -Name tableTineTask } catch {}}
    if ($storageContext) { try { Remove-Variable -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'update tine_task'
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
                $tableTineTask = Get-AzureStorageTable -Context $storageContext -Name 'tineTask' -ErrorAction SilentlyContinue
            }

            if ( $tableTineTask -eq $null -and !$whatIf ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $list = New-Object System.Collections.Generic.List[string]


                $query.FilterString = 'tine_task_id eq guid'''+ $tineTaskId + ''''
                $query.SelectColumns = $list
                $query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTaskForUpdate = $tableTineTask.CloudTable.ExecuteQuery($query)
                }

                foreach ( $item in $tineTaskForUpdate ) {
                    [string] $partitionKeyLocal = $item.PartitionKey
                    [string] $rowKeyLocal = $item.RowKey

                    # change task value
                    [Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity] $tineTask = `
                        New-Object 'Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity' $partitionKeyLocal, $rowKeyLocal

                    $tineTask.ETag = '*'
                    if ($PSBoundParameters.ContainsKey('tineTaskId')) { $tineTask.Properties.Add( 'tine_task_id', [System.Guid]$tineTaskId) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptName')) { $tineTask.Properties.Add( 'tine_task_script_name', [System.String]$tineTaskScriptName) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptStartDateTime')) { $tineTask.Properties.Add( 'tine_task_script_start_date_time', [System.DateTime]$tineTaskScriptStartDateTime) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptEndDateTime')) { $tineTask.Properties.Add( 'tine_task_script_end_date_time', [System.DateTime]$tineTaskScriptEndDateTime) }
                    if ($PSBoundParameters.ContainsKey('userId')) { $tineTask.Properties.Add( 'user_id', [System.Guid]$userId) }
                    if ($PSBoundParameters.ContainsKey('dateTime')) { $tineTask.Properties.Add( 'date_time', [System.DateTime]$dateTime) }
                    if ($PSBoundParameters.ContainsKey('tineTaskRcd')) { $tineTask.Properties.Add( 'tine_task_rcd', [System.String]$tineTaskRcd) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRcd')) { $tineTask.Properties.Add( 'tine_task_script_outcome_rcd', [System.String]$tineTaskScriptOutcomeRcd) }
                    if ($PSBoundParameters.ContainsKey('tineTaskPartitionKeyComputerName')) { $tineTask.Properties.Add( 'tine_task_partition_key_computer_name', [System.String]$tineTaskPartitionKeyComputerName) }
                    if ($PSBoundParameters.ContainsKey('tineTaskRowKeyUtcDateTime')) { $tineTask.Properties.Add( 'tine_task_row_key_utc_date_time', [System.String]$tineTaskRowKeyUtcDateTime) }
                    if ($PSBoundParameters.ContainsKey('tineMachineId')) { $tineTask.Properties.Add( 'tine_machine_id', [System.Guid]$tineMachineId) }
                    if ($PSBoundParameters.ContainsKey('tineTaskStatusRcd')) { $tineTask.Properties.Add( 'tine_task_status_rcd', [System.String]$tineTaskStatusRcd) }
                    if ($PSBoundParameters.ContainsKey('tineScriptLibraryId')) { $tineTask.Properties.Add( 'tine_script_library_id', [System.Guid]$tineScriptLibraryId) }
                    if ($PSBoundParameters.ContainsKey('tineCreationId')) { $tineTask.Properties.Add( 'tine_creation_id', [System.Guid]$tineCreationId) }

                    $tableTineTask.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Merge($tineTask)) | Out-Null
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
    if ($tineTaskForUpdate) { try { Remove-Variable -Name tineTaskForUpdate } catch {}}
    if ($tableTineTask) { try { Remove-Variable -Name tableTineTask } catch {}}
    if ($partitionKeyLocal) { try { Remove-Variable -Name partitionKeyLocal } catch {}}
    if ($rowKeyLocal) { try { Remove-Variable -Name rowKeyLocal } catch {}}
    if ($tineTask) { try { Remove-Variable -Name tineTask } catch {}}
    if ($list) { try { Remove-Variable -Name list } catch {}}
    if ($query) { try { Remove-Variable -Name query } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'update tine_task by foreign keys'
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
                $tableTineTask = Get-AzureStorageTable -Context $storageContext -Name 'tineTask' -ErrorAction SilentlyContinue
            }

            if ( $tableTineTask -eq $null -and !$whatIf ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $list = New-Object System.Collections.Generic.List[string]

                $list.Add( 'tine_task_id' )
                $list.Add( 'tine_task_script_name' )
                $list.Add( 'tine_task_script_start_date_time' )
                $list.Add( 'tine_task_script_end_date_time' )
                $list.Add( 'user_id' )
                $list.Add( 'date_time' )
                $list.Add( 'tine_task_rcd' )
                $list.Add( 'tine_task_script_outcome_rcd' )
                $list.Add( 'tine_task_partition_key_computer_name' )
                $list.Add( 'tine_task_row_key_utc_date_time' )
                $list.Add( 'tine_machine_id' )
                $list.Add( 'tine_task_status_rcd' )
                $list.Add( 'tine_script_library_id' )
                $list.Add( 'tine_creation_id' )

                # filter tineTaskId ( primary key )
                if ($tineTaskId -ne  [TineTaskData]::new().tineTaskId) {
                    if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_task_id eq guid'''+ $tineTaskId + ''''
                }

                # filter tineTaskRcd ( foreign key )
                if ($tineTaskRcd -ne  [TineTaskData]::new().tineTaskRcd) {
                  if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_task_rcd eq '''+ $tineTaskRcd + ''''
                }

                # filter tineTaskScriptOutcomeRcd ( foreign key )
                if ($tineTaskScriptOutcomeRcd -ne  [TineTaskData]::new().tineTaskScriptOutcomeRcd) {
                  if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_task_script_outcome_rcd eq '''+ $tineTaskScriptOutcomeRcd + ''''
                }

                # filter tineMachineId ( foreign key )
                if ($tineMachineId -ne  [TineTaskData]::new().tineMachineId) {
                  if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_machine_id eq guid'''+ $tineMachineId + ''''
                }

                # filter tineTaskStatusRcd ( foreign key )
                if ($tineTaskStatusRcd -ne  [TineTaskData]::new().tineTaskStatusRcd) {
                  if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_task_status_rcd eq '''+ $tineTaskStatusRcd + ''''
                }

                # filter tineScriptLibraryId ( foreign key )
                if ($tineScriptLibraryId -ne  [TineTaskData]::new().tineScriptLibraryId) {
                  if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_script_library_id eq guid'''+ $tineScriptLibraryId + ''''
                }

                # filter tineCreationId ( foreign key )
                if ($tineCreationId -ne  [TineTaskData]::new().tineCreationId) {
                  if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_creation_id eq guid'''+ $tineCreationId + ''''
                }

                $query.SelectColumns = $list
                $query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTaskForUpdate = $tableTineTask.CloudTable.ExecuteQuery($query)
                }

                foreach ( $item in $tineTaskForUpdate ) {
                    [string] $partitionKeyLocal = $item.PartitionKey
                    [string] $rowKeyLocal = $item.RowKey

                    # change task value
                    [Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity] $tineTask = `
                        New-Object 'Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity' $partitionKeyLocal, $rowKeyLocal

                    $tineTask.ETag = '*'
                    if ($PSBoundParameters.ContainsKey('tineTaskId')) { $tineTask.Properties.Add( 'tine_task_id', [System.Guid]$tineTaskId) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptName')) { $tineTask.Properties.Add( 'tine_task_script_name', [System.String]$tineTaskScriptName) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptStartDateTime')) { $tineTask.Properties.Add( 'tine_task_script_start_date_time', [System.DateTime]$tineTaskScriptStartDateTime) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptEndDateTime')) { $tineTask.Properties.Add( 'tine_task_script_end_date_time', [System.DateTime]$tineTaskScriptEndDateTime) }
                    if ($PSBoundParameters.ContainsKey('userId')) { $tineTask.Properties.Add( 'user_id', [System.Guid]$userId) }
                    if ($PSBoundParameters.ContainsKey('dateTime')) { $tineTask.Properties.Add( 'date_time', [System.DateTime]$dateTime) }
                    if ($PSBoundParameters.ContainsKey('tineTaskRcd')) { $tineTask.Properties.Add( 'tine_task_rcd', [System.String]$tineTaskRcd) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRcd')) { $tineTask.Properties.Add( 'tine_task_script_outcome_rcd', [System.String]$tineTaskScriptOutcomeRcd) }
                    if ($PSBoundParameters.ContainsKey('tineTaskPartitionKeyComputerName')) { $tineTask.Properties.Add( 'tine_task_partition_key_computer_name', [System.String]$tineTaskPartitionKeyComputerName) }
                    if ($PSBoundParameters.ContainsKey('tineTaskRowKeyUtcDateTime')) { $tineTask.Properties.Add( 'tine_task_row_key_utc_date_time', [System.String]$tineTaskRowKeyUtcDateTime) }
                    if ($PSBoundParameters.ContainsKey('tineMachineId')) { $tineTask.Properties.Add( 'tine_machine_id', [System.Guid]$tineMachineId) }
                    if ($PSBoundParameters.ContainsKey('tineTaskStatusRcd')) { $tineTask.Properties.Add( 'tine_task_status_rcd', [System.String]$tineTaskStatusRcd) }
                    if ($PSBoundParameters.ContainsKey('tineScriptLibraryId')) { $tineTask.Properties.Add( 'tine_script_library_id', [System.Guid]$tineScriptLibraryId) }
                    if ($PSBoundParameters.ContainsKey('tineCreationId')) { $tineTask.Properties.Add( 'tine_creation_id', [System.Guid]$tineCreationId) }

                    $tableTineTask.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Merge($tineTask)) | Out-Null
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
    if ($tineTaskForUpdate) { try { Remove-Variable -Name tineTaskForUpdate } catch {}}
    if ($tableTineTask) { try { Remove-Variable -Name tableTineTask } catch {}}
    if ($partitionKeyLocal) { try { Remove-Variable -Name partitionKeyLocal } catch {}}
    if ($rowKeyLocal) { try { Remove-Variable -Name rowKeyLocal } catch {}}
    if ($tineTask) { try { Remove-Variable -Name tineTask } catch {}}
    if ($list) { try { Remove-Variable -Name list } catch {}}
    if ($query) { try { Remove-Variable -Name query } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'delete from tine_task'
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

            $tableTineTask = Get-AzureStorageTable -Context $storageContext -Name 'tineTask' -ErrorAction SilentlyContinue

            if ( $tableTineTask -eq $null ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $list = New-Object System.Collections.Generic.List[string]

                $list.Add( 'tine_task_id' )

                $query.FilterString = 'tine_task_id eq guid'''+ $tineTaskId + ''''
                $query.SelectColumns = $list
                $query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTaskForDelete = $tableTineTask.CloudTable.ExecuteQuery($query)
                }

                # delete selected rows
                foreach ( $tineTaskItem in $tineTaskForDelete ) {
                    $tableTineTask.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Delete($tineTaskItem)) | Out-Null
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
    if ($tineTaskForDelete) { try { Remove-Variable -Name tineTaskForDelete } catch {}}
    if ($tineTaskItem) { try { Remove-Variable -Name tineTaskItem } catch {}}
    if ($tableTineTask) { try { Remove-Variable -Name tableTineTask } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'fetch value from tine_task'
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
                $tableTineTask = Get-AzureStorageTable -Context $storageContext -Name 'tineTask' -ErrorAction SilentlyContinue
            }

            if ( $tableTineTask -eq $null -and !$whatIf ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $list = New-Object System.Collections.Generic.List[string]

                $list.Add( $fetchValue )

                # filter tineTaskId ( primary key )
                if ($tineTaskId -ne  [TineTaskData]::new().tineTaskId) {
                    if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_task_id eq guid'''+ $tineTaskId + ''''
                }

                # filter tineTaskRcd ( foreign key )
                if ($tineTaskRcd -ne  [TineTaskData]::new().tineTaskRcd) {
                  if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_task_rcd eq '''+ $tineTaskRcd + ''''
                }

                # filter tineTaskScriptOutcomeRcd ( foreign key )
                if ($tineTaskScriptOutcomeRcd -ne  [TineTaskData]::new().tineTaskScriptOutcomeRcd) {
                  if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_task_script_outcome_rcd eq '''+ $tineTaskScriptOutcomeRcd + ''''
                }

                # filter tineMachineId ( foreign key )
                if ($tineMachineId -ne  [TineTaskData]::new().tineMachineId) {
                  if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_machine_id eq guid'''+ $tineMachineId + ''''
                }

                # filter tineTaskStatusRcd ( foreign key )
                if ($tineTaskStatusRcd -ne  [TineTaskData]::new().tineTaskStatusRcd) {
                  if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_task_status_rcd eq '''+ $tineTaskStatusRcd + ''''
                }

                # filter tineScriptLibraryId ( foreign key )
                if ($tineScriptLibraryId -ne  [TineTaskData]::new().tineScriptLibraryId) {
                  if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_script_library_id eq guid'''+ $tineScriptLibraryId + ''''
                }

                # filter tineCreationId ( foreign key )
                if ($tineCreationId -ne  [TineTaskData]::new().tineCreationId) {
                  if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_creation_id eq guid'''+ $tineCreationId + ''''
                }

                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + $query.FilterString
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }

                $query.SelectColumns = $list
                $query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTask = $tableTineTask.CloudTable.ExecuteQuery($query)
                }

                # get value
                [string] $outValue = ''
                if (($tineTask | Measure-Object).Count -gt 0) {
                    $outValue = $tineTask[0].Properties[$fetchValue].PropertyAsObject

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
    if ($tineTask) { try { Remove-Variable -Name tineTask } catch {}}
    if ($tableTineTask) { try { Remove-Variable -Name tableTineTask } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'delete all from tine_task'
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

            $tableTineTask = Get-AzureStorageTable -Context $storageContext -Name 'tineTask' -ErrorAction SilentlyContinue

            if ( $tableTineTask -eq $null ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $list = New-Object System.Collections.Generic.List[string]

                $list.Add( 'tine_task_id' )

                $query.SelectColumns = $list
                $query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTaskForDelete = $tableTineTask.CloudTable.ExecuteQuery($query)
                }

                # delete selected rows
                foreach ( $tineTaskItem in $tineTaskForDelete ) {
                    $tableTineTask.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Delete($tineTaskItem)) | Out-Null
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
    if ($tineTaskForDelete) { try { Remove-Variable -Name tineTaskForDelete } catch {}}
    if ($tineTaskItem) { try { Remove-Variable -Name tineTaskItem } catch {}}
    if ($tableTineTask) { try { Remove-Variable -Name tableTineTask } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'show tine_task'
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

            $tableTineTask = Get-AzureStorageTable -Context $storageContext -Name 'tineTask' -ErrorAction SilentlyContinue

            if ( $tableTineTask -eq $null ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $list = New-Object System.Collections.Generic.List[string]

                $list.Add( 'tine_task_id' )
                $list.Add( 'tine_task_script_name' )
                $list.Add( 'tine_task_script_start_date_time' )
                $list.Add( 'tine_task_script_end_date_time' )
                $list.Add( 'user_id' )
                $list.Add( 'date_time' )
                $list.Add( 'tine_task_rcd' )
                $list.Add( 'tine_task_script_outcome_rcd' )
                $list.Add( 'tine_task_partition_key_computer_name' )
                $list.Add( 'tine_task_row_key_utc_date_time' )
                $list.Add( 'tine_machine_id' )
                $list.Add( 'tine_task_status_rcd' )
                $list.Add( 'tine_script_library_id' )
                $list.Add( 'tine_creation_id' )

                $query.SelectColumns = $list
                $query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTask = $tableTineTask.CloudTable.ExecuteQuery($query)
                }

                # echo
                [string] $output = ''
                $output = $tineTask `
                    | Format-Table PartitionKey, RowKey, `
                    @{ Label = 'Tine Task Id'; Expression={$_.Properties['tine_task_id'].GuidValue} },`
                    @{ Label = 'Tine Task Script Name'; Expression={$_.Properties['tine_task_script_name'].StringValue} },`
                    @{ Label = 'Tine Task Script Start Date Time'; Expression={$_.Properties['tine_task_script_start_date_time'].StringValue} },`
                    @{ Label = 'Tine Task Script End Date Time'; Expression={$_.Properties['tine_task_script_end_date_time'].StringValue} },`
                    @{ Label = 'User Id'; Expression={$_.Properties['user_id'].GuidValue} },`
                    @{ Label = 'Date Time'; Expression={$_.Properties['date_time'].StringValue} },`
                    @{ Label = 'Tine Task'; Expression={$_.Properties['tine_task_rcd'].StringValue} },`
                    @{ Label = 'Tine Task Script Outcome'; Expression={$_.Properties['tine_task_script_outcome_rcd'].StringValue} },`
                    @{ Label = 'Tine Task Partition Key Computer Name'; Expression={$_.Properties['tine_task_partition_key_computer_name'].StringValue} },`
                    @{ Label = 'Tine Task Row Key Utc Date Time'; Expression={$_.Properties['tine_task_row_key_utc_date_time'].StringValue} },`
                    @{ Label = 'Tine Machine Id'; Expression={$_.Properties['tine_machine_id'].GuidValue} },`
                    @{ Label = 'Tine Task Status'; Expression={$_.Properties['tine_task_status_rcd'].StringValue} },`
                    @{ Label = 'Tine Script Library Id'; Expression={$_.Properties['tine_script_library_id'].GuidValue} },`
                    @{ Label = 'Tine Creation Id'; Expression={$_.Properties['tine_creation_id'].GuidValue} } `
                    -AutoSize `
                    | Out-String;

                # log
                if ($output -ne '') {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + $output
                } else {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'no result for ' + 'tine_task' #+ ': ' + $query.FilterString
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
    if ($tineTask) { try { Remove-Variable -Name tineTask } catch {}}
    if ($tableTineTask) { try { Remove-Variable -Name tableTineTask } catch {}}
    if ($storageContext) { try { Remove-Variable -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'drop tine_task'
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

            $tableTineTask = Get-AzureStorageTable -Context $storageContext -Name 'tineTask' -ErrorAction SilentlyContinue

            if ( $tableTineTask -eq $null ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                Remove-AzureStorageTable -Context $storageContext -Name 'tineTask' -Force
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
    if ($tableTineTask) { try { Remove-Variable -Name tableTineTask } catch {}}
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
    $tineTaskData
}

if ($returnGridView) {
    $tineTaskData | Out-GridView
}
