# SQL2X Generated code based on a SQL Server Schema
# SQL2X Version: 0.d
# http://sql2x.azurewebsites.net/
# Generated Date: 9/30/2018 3:03:37 PM
# Template: sql2x.PowerShellGenerator.CifudeScript
<#
.\tine_task.ps1 -doEcho       -doSql2x -comment test -create
.\tine_task.ps1 -doEcho       -doSql2x -comment test -insert
.\tine_task.ps1 -doEcho       -doSql2x -comment test -fetch                -tineTaskId:([guid]'')
.\tine_task.ps1 -returnValue  -doSql2x -comment test -fetchValue:column    -tineTaskId:([guid]'')
.\tine_task.ps1 -doEcho       -doSql2x -comment test -updateByPrimaryKey   -show -tineTaskId:([guid]'')
.\tine_task.ps1 -doEcho       -doSql2x -comment test -updateByForeignKeys  -show
.\tine_task.ps1 -doEcho       -doSql2x -comment test -deleteAll
.\tine_task.ps1 -doEcho       -doSql2x -comment test -delete               -tineTaskId:([guid]'')
.\tine_task.ps1 -doEcho       -doSql2x -comment test -drop
.\tine_task.ps1 -doEcho       -doSql2x -comment test -show
.\tine_task.ps1 -doEcho       -doSql2x -comment test -help
.\tine_task.ps1 -doEcho       -doSql2x -comment test -create -insert -fetch -fetchValue:column -updateByPrimaryKey -delete -drop -show -help -tineTaskId:([guid]'')
#>
[Diagnostics.CodeAnalysis.SuppressMessageAttribute `
    ('PSPossibleIncorrectComparisonWithNull','')]
param(
    [string]$scriptName = 'CIFUDE ( Create Insert Fetch Update Delete Extras ) for tine_task',
    [string]$scriptStyle = 'original', # original / task
    [string]$scriptStatus = 'status ( todos, learn, learned )',
    [string]$scriptDocumentation = 'links urls, books, people, inspiration',

    [DateTime]$dateTimeStart = [System.DateTime]::UtcNow,
    [DateTime]$dateTimeStop = [System.DateTime]::UtcNow,
    [DateTime]$createdDateTime = '2018.09.30',
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
    [System.Guid]$tineTaskId = '00000000-0000-0000-0000-000000000000',
    [System.String]$tineTaskPartitionKeyComputerName = $env:ComputerName,
    [System.String]$tineTaskRowKeyUtcDateTime = [System.DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ss.fffZ'),
    [System.Guid]$tineScriptLibraryId = '00000000-0000-0000-0000-000000000000',
    [System.Guid]$tineMachineId = '00000000-0000-0000-0000-000000000000',
    [System.Guid]$tineCreationId = '00000000-0000-0000-0000-000000000000',
    [System.String]$tineTaskRcd = '',
    [System.String]$tineTaskScriptName = '',
    [System.String]$tineTaskStatusRcd = '',
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
# [switch]$doSql2x = $true
# [switch]$doEcho = $true
# 
# [string]$comment = 'dev'
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
# Generated Date: 9/30/2018 3:03:37 PM
# Template: sql2x.PowerShellGenerator.CifudeScript
<#
.\tine_task.ps1 -doEcho       -doSql2x -comment test -create
.\tine_task.ps1 -doEcho       -doSql2x -comment test -insert
.\tine_task.ps1 -doEcho       -doSql2x -comment test -fetch                -tineTaskId:([guid]'')
.\tine_task.ps1 -returnValue  -doSql2x -comment test -fetchValue:column    -tineTaskId:([guid]'')
.\tine_task.ps1 -doEcho       -doSql2x -comment test -updateByPrimaryKey   -show -tineTaskId:([guid]'')
.\tine_task.ps1 -doEcho       -doSql2x -comment test -updateByForeignKeys  -show
.\tine_task.ps1 -doEcho       -doSql2x -comment test -deleteAll
.\tine_task.ps1 -doEcho       -doSql2x -comment test -delete               -tineTaskId:([guid]'')
.\tine_task.ps1 -doEcho       -doSql2x -comment test -drop
.\tine_task.ps1 -doEcho       -doSql2x -comment test -show
.\tine_task.ps1 -doEcho       -doSql2x -comment test -help
.\tine_task.ps1 -doEcho       -doSql2x -comment test -create -insert -fetch -fetchValue:column -updateByPrimaryKey -delete -drop -show -help -tineTaskId:([guid]'')
#>"
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ('storageConnectionString' + ' ' + '=' + ' ' + '[' + $script:storageConnectionString + ']')
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.Guid] tineTaskId = '00000000-0000-0000-0000-000000000000'")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.String] tineTaskPartitionKeyComputerName = $env:ComputerName")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.String] tineTaskRowKeyUtcDateTime = [System.DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ss.fffZ')")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.Guid] tineScriptLibraryId = '00000000-0000-0000-0000-000000000000'")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.Guid] tineMachineId = '00000000-0000-0000-0000-000000000000'")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.Guid] tineCreationId = '00000000-0000-0000-0000-000000000000'")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.String] tineTaskRcd = ''")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.String] tineTaskScriptName = ''")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.String] tineTaskStatusRcd = ''")
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
$script:taskName = 'data class'
#region
##################################################################################################################
class TineTaskData {
    [System.Guid]$tineTaskId = '00000000-0000-0000-0000-000000000000'
    [System.String]$tineTaskPartitionKeyComputerName = $env:ComputerName
    [System.String]$tineTaskRowKeyUtcDateTime = [System.DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ss.fffZ')
    [System.Guid]$tineScriptLibraryId = '00000000-0000-0000-0000-000000000000'
    [System.Guid]$tineMachineId = '00000000-0000-0000-0000-000000000000'
    [System.Guid]$tineCreationId = '00000000-0000-0000-0000-000000000000'
    [System.String]$tineTaskRcd = ''
    [System.String]$tineTaskScriptName = ''
    [System.String]$tineTaskStatusRcd = ''
    [System.DateTime]$tineTaskScriptStartDateTime = '1601.01.01T00:00:00Z'
    [System.DateTime]$tineTaskScriptEndDateTime = '1601.01.01T00:00:00Z'
    [System.String]$tineTaskScriptOutcomeRcd = ''
    [System.Guid]$userId = '00000000-0000-0000-0000-000000000000'
    [System.DateTime]$dateTime = '1601.01.01T00:00:00Z'
}
#endregion
##################################################################################################################
$script:taskName = 'create tine_task'
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

            $script:tableTineTask = Get-AzureStorageTable -Context $script:storageContext -Name 'tineTask' -ErrorAction SilentlyContinue

            if ( $script:tableTineTask -ne $null ) {
                Remove-AzureStorageTable -Context $script:storageContext -Name 'tineTask' -Force
            }

            [int] $script:trials = 0

            # create new table
            $script:tableTineTask = $null
            while ($script:tableTineTask -eq $null) {
                # wait for an escalating number of seconds 
                $script:trials++
                if ($script:trials -gt 10) {
                    throw [Exception] ('Failed to create table')
                }

                Start-Sleep $script:trials

                # create new table
                $script:tableTineTask = `
                    New-AzureStorageTable `
                        -Context $script:storageContext `
                        -Name 'tineTask'

                if ( $script:tableTineTask -ne $null ) {
                    # insert row
                    $tineTask = 
                        New-Object `
                            -TypeName Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity `
                            -ArgumentList $tineTaskPartitionKeyComputerName, $tineTaskRowKeyUtcDateTime

                    $tineTask.Properties.Add( 'tine_task_id', [System.Guid]$tineTaskId)
                    $tineTask.Properties.Add( 'tine_task_partition_key_computer_name', [System.String]$tineTaskPartitionKeyComputerName)
                    $tineTask.Properties.Add( 'tine_task_row_key_utc_date_time', [System.String]$tineTaskRowKeyUtcDateTime)
                    $tineTask.Properties.Add( 'tine_script_library_id', [System.Guid]$tineScriptLibraryId)
                    $tineTask.Properties.Add( 'tine_machine_id', [System.Guid]$tineMachineId)
                    $tineTask.Properties.Add( 'tine_creation_id', [System.Guid]$tineCreationId)
                    $tineTask.Properties.Add( 'tine_task_rcd', [System.String]$tineTaskRcd)
                    $tineTask.Properties.Add( 'tine_task_script_name', [System.String]$tineTaskScriptName)
                    $tineTask.Properties.Add( 'tine_task_status_rcd', [System.String]$tineTaskStatusRcd)
                    $tineTask.Properties.Add( 'tine_task_script_start_date_time', [System.DateTime]$tineTaskScriptStartDateTime)
                    $tineTask.Properties.Add( 'tine_task_script_end_date_time', [System.DateTime]$tineTaskScriptEndDateTime)
                    $tineTask.Properties.Add( 'tine_task_script_outcome_rcd', [System.String]$tineTaskScriptOutcomeRcd)
                    $tineTask.Properties.Add( 'user_id', [System.Guid]$userId)
                    $tineTask.Properties.Add( 'date_time', [System.DateTime]$dateTime)

                    $script:tableTineTask.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Insert($tineTask)) | Out-Null
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
    if ($script:tableTineTask) { try { Remove-Variable -Scope:Script -Name tableTineTask } catch {}}
    if ($script:storageContext) { try { Remove-Variable -Scope:Script -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'insert to tine_task'
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

        # validate tineTaskId ( primary key )
        if ($tineTaskId -eq '00000000-0000-0000-0000-000000000000') {
            # get a decent primary key, todo; check datatype
            [System.Guid] $tineTaskId = [System.Guid]::NewGuid()

            # return primary key to caller
            $script:tineTaskData = [TineTaskData]::new()
            $script:tineTaskData.tineTaskId = $tineTaskId
            $script:tineTaskDataList += $script:tineTaskData
        }

        # validate tineTaskRcd ( foreign key )
        if ($tineTaskRcd -eq '') {
            # log
            $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'Foreign Key:' + ' ' + 'tineTaskRcd' + ' ' + 'is missing'
            $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
            if ($doEcho) { Write-Host ( $script:taskLine ) -ForegroundColor red }
            $script:answer = 'no'
        }

        # validate tineTaskStatusRcd ( foreign key )
        if ($tineTaskStatusRcd -eq '') {
            # log
            $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'Foreign Key:' + ' ' + 'tineTaskStatusRcd' + ' ' + 'is missing'
            $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
            if ($doEcho) { Write-Host ( $script:taskLine ) -ForegroundColor red }
            $script:answer = 'no'
        }

        if ($script:answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {

            # connect and validate table
            $script:storageContext = New-AzureStorageContext -ConnectionString $script:storageConnectionString

            $script:tableTineTask = Get-AzureStorageTable -Context $script:storageContext -Name 'tineTask' -ErrorAction SilentlyContinue

            if ( $script:tableTineTask -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # insert row
                $tineTask =
                    New-Object `
                        -TypeName Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity `
                        -ArgumentList $tineTaskPartitionKeyComputerName, $tineTaskRowKeyUtcDateTime

                $tineTask.Properties.Add( 'tine_task_id', [System.Guid]$tineTaskId)
                $tineTask.Properties.Add( 'tine_task_partition_key_computer_name', [System.String]$tineTaskPartitionKeyComputerName)
                $tineTask.Properties.Add( 'tine_task_row_key_utc_date_time', [System.String]$tineTaskRowKeyUtcDateTime)
                $tineTask.Properties.Add( 'tine_script_library_id', [System.Guid]$tineScriptLibraryId)
                $tineTask.Properties.Add( 'tine_machine_id', [System.Guid]$tineMachineId)
                $tineTask.Properties.Add( 'tine_creation_id', [System.Guid]$tineCreationId)
                $tineTask.Properties.Add( 'tine_task_rcd', [System.String]$tineTaskRcd)
                $tineTask.Properties.Add( 'tine_task_script_name', [System.String]$tineTaskScriptName)
                $tineTask.Properties.Add( 'tine_task_status_rcd', [System.String]$tineTaskStatusRcd)
                $tineTask.Properties.Add( 'tine_task_script_start_date_time', [System.DateTime]$tineTaskScriptStartDateTime)
                $tineTask.Properties.Add( 'tine_task_script_end_date_time', [System.DateTime]$tineTaskScriptEndDateTime)
                $tineTask.Properties.Add( 'tine_task_script_outcome_rcd', [System.String]$tineTaskScriptOutcomeRcd)
                $tineTask.Properties.Add( 'user_id', [System.Guid]$userId)
                $tineTask.Properties.Add( 'date_time', [System.DateTime]$dateTime)

                $script:tableTineTask.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Insert($tineTask)) | Out-Null
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
    if ($tineTask) { try { Remove-Variable -Scope:Script -Name tineTask } catch {}}
    if ($script:tableTineTask) { try { Remove-Variable -Scope:Script -Name tableTineTask } catch {}}
    if ($script:storageContext) { try { Remove-Variable -Scope:Script -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'fetch from tine_task'
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
                $script:tableTineTask = Get-AzureStorageTable -Context $script:storageContext -Name 'tineTask' -ErrorAction SilentlyContinue
            }

            if ( $script:tableTineTask -eq $null -and !$whatIf ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_task_id' )
                $script:list.Add( 'tine_task_partition_key_computer_name' )
                $script:list.Add( 'tine_task_row_key_utc_date_time' )
                $script:list.Add( 'tine_script_library_id' )
                $script:list.Add( 'tine_machine_id' )
                $script:list.Add( 'tine_creation_id' )
                $script:list.Add( 'tine_task_rcd' )
                $script:list.Add( 'tine_task_script_name' )
                $script:list.Add( 'tine_task_status_rcd' )
                $script:list.Add( 'tine_task_script_start_date_time' )
                $script:list.Add( 'tine_task_script_end_date_time' )
                $script:list.Add( 'tine_task_script_outcome_rcd' )
                $script:list.Add( 'user_id' )
                $script:list.Add( 'date_time' )

                # filter tineTaskId ( primary key )
                if ($PSBoundParameters.ContainsKey('tineTaskId')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_id eq guid'''+ $tineTaskId + ''''
                }

                # filter tineScriptLibraryId ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineScriptLibraryId')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_script_library_id eq guid'''+ $tineScriptLibraryId + ''''
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

                # filter tineTaskRcd ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineTaskRcd')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_rcd eq '''+ $tineTaskRcd + ''''
                }

                # filter tineTaskStatusRcd ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineTaskStatusRcd')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_status_rcd eq '''+ $tineTaskStatusRcd + ''''
                }

                # filter tineTaskScriptOutcomeRcd ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRcd')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_script_outcome_rcd eq '''+ $tineTaskScriptOutcomeRcd + ''''
                }

                # filter tineTaskPartitionKeyComputerName ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskPartitionKeyComputerName')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_partition_key_computer_name eq '''+ $tineTaskPartitionKeyComputerName + ''''
                }

                # filter tineTaskRowKeyUtcDateTime ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskRowKeyUtcDateTime')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_row_key_utc_date_time eq '''+ $tineTaskRowKeyUtcDateTime + ''''
                }

                # filter tineTaskRcd ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskRcd')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_rcd eq '''+ $tineTaskRcd + ''''
                }

                # filter tineTaskScriptName ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptName')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_script_name eq '''+ $tineTaskScriptName + ''''
                }

                # filter tineTaskStatusRcd ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskStatusRcd')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_status_rcd eq '''+ $tineTaskStatusRcd + ''''
                }

                # filter tineTaskScriptOutcomeRcd ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRcd')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_script_outcome_rcd eq '''+ $tineTaskScriptOutcomeRcd + ''''
                }

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTask = $script:tableTineTask.CloudTable.ExecuteQuery($script:query)
                }

                # log count
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'Query Results' + ';' + ' ' + '[' + ($tineTask | Measure-Object).Count + ']'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }

                # transfer values from query to internal objects
                if ($script:tineTaskData) { try { Remove-Variable -Scope:Script -Name tineTaskData } catch {}}
                if ($script:tineTaskDataList) { try { Remove-Variable -Scope:Script -Name tineTaskDataList } catch {}}

                $script:tineTaskDataList = @()

                if (-not [string]::IsNullOrEmpty($tineTask)) {
                    foreach ($entity in $tineTask) {
                        $script:tineTaskData = [TineTaskData]::new()
                        $script:tineTaskData.tineTaskPartitionKeyComputerName = $env:ComputerName
                        $script:tineTaskData.tineTaskRowKeyUtcDateTime = [System.DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ss.fffZ')

                        $entity.Properties.Keys | 
                            ForEach-Object {
                                switch ($_) {
                                    'tine_task_id' { $script:tineTaskData.tineTaskId = $entity.Properties[$_].PropertyAsObject }
                                    'tine_script_library_id' { $script:tineTaskData.tineScriptLibraryId = $entity.Properties[$_].PropertyAsObject }
                                    'tine_machine_id' { $script:tineTaskData.tineMachineId = $entity.Properties[$_].PropertyAsObject }
                                    'tine_creation_id' { $script:tineTaskData.tineCreationId = $entity.Properties[$_].PropertyAsObject }
                                    'tine_task_rcd' { $script:tineTaskData.tineTaskRcd = $entity.Properties[$_].PropertyAsObject }
                                    'tine_task_script_name' { $script:tineTaskData.tineTaskScriptName = $entity.Properties[$_].PropertyAsObject }
                                    'tine_task_status_rcd' { $script:tineTaskData.tineTaskStatusRcd = $entity.Properties[$_].PropertyAsObject }
                                    'tine_task_script_start_date_time' { $script:tineTaskData.tineTaskScriptStartDateTime = $entity.Properties[$_].PropertyAsObject }
                                    'tine_task_script_end_date_time' { $script:tineTaskData.tineTaskScriptEndDateTime = $entity.Properties[$_].PropertyAsObject }
                                    'tine_task_script_outcome_rcd' { $script:tineTaskData.tineTaskScriptOutcomeRcd = $entity.Properties[$_].PropertyAsObject }
                                    'user_id' { $script:tineTaskData.userId = $entity.Properties[$_].PropertyAsObject }
                                    'date_time' { $script:tineTaskData.dateTime = $entity.Properties[$_].PropertyAsObject }
                                }
                            }
                        $script:tineTaskDataList += $script:tineTaskData
                    }
                }

                # check if any column parameter is chosen
                [boolean] $includeAll = $true
                foreach ($parameter in $PSBoundParameters.Keys) {
                    $includeAll -= ($parameter -eq 'tineTaskId')
                    $includeAll -= ($parameter -eq 'tineTaskPartitionKeyComputerName')
                    $includeAll -= ($parameter -eq 'tineTaskRowKeyUtcDateTime')
                    $includeAll -= ($parameter -eq 'tineScriptLibraryId')
                    $includeAll -= ($parameter -eq 'tineMachineId')
                    $includeAll -= ($parameter -eq 'tineCreationId')
                    $includeAll -= ($parameter -eq 'tineTaskRcd')
                    $includeAll -= ($parameter -eq 'tineTaskScriptName')
                    $includeAll -= ($parameter -eq 'tineTaskStatusRcd')
                    $includeAll -= ($parameter -eq 'tineTaskScriptStartDateTime')
                    $includeAll -= ($parameter -eq 'tineTaskScriptEndDateTime')
                    $includeAll -= ($parameter -eq 'tineTaskScriptOutcomeRcd')
                    $includeAll -= ($parameter -eq 'userId')
                    $includeAll -= ($parameter -eq 'dateTime')
                }

                # property echo
                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskId') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskId' + '; [' + $tineTaskData.tineTaskId + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskPartitionKeyComputerName') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskPartitionKeyComputerName' + '; [' + $tineTaskData.tineTaskPartitionKeyComputerName + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskRowKeyUtcDateTime') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskRowKeyUtcDateTime' + '; [' + $tineTaskData.tineTaskRowKeyUtcDateTime + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineScriptLibraryId') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineScriptLibraryId' + '; [' + $tineTaskData.tineScriptLibraryId + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineMachineId') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineMachineId' + '; [' + $tineTaskData.tineMachineId + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineCreationId') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineCreationId' + '; [' + $tineTaskData.tineCreationId + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskRcd') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskRcd' + '; [' + $tineTaskData.tineTaskRcd + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskScriptName') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskScriptName' + '; [' + $tineTaskData.tineTaskScriptName + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskStatusRcd') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskStatusRcd' + '; [' + $tineTaskData.tineTaskStatusRcd + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskScriptStartDateTime') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskScriptStartDateTime' + '; [' + $tineTaskData.tineTaskScriptStartDateTime + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskScriptEndDateTime') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskScriptEndDateTime' + '; [' + $tineTaskData.tineTaskScriptEndDateTime + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRcd') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskScriptOutcomeRcd' + '; [' + $tineTaskData.tineTaskScriptOutcomeRcd + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('userId') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'userId' + '; [' + $tineTaskData.userId + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('dateTime') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'dateTime' + '; [' + $tineTaskData.dateTime + ']'
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
    if ($tineTask) { try { Remove-Variable -Scope:Script -Name tineTask } catch {}}
    if ($script:tableTineTask) { try { Remove-Variable -Scope:Script -Name tableTineTask } catch {}}
    if ($script:storageContext) { try { Remove-Variable -Scope:Script -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'update tine_task'
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
                $script:tableTineTask = Get-AzureStorageTable -Context $script:storageContext -Name 'tineTask' -ErrorAction SilentlyContinue
            }

            if ( $script:tableTineTask -eq $null -and !$whatIf ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]


                $script:query.FilterString = 'tine_task_id eq guid'''+ $tineTaskId + ''''
                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTaskForUpdate = $script:tableTineTask.CloudTable.ExecuteQuery($script:query)
                }

                foreach ( $item in $tineTaskForUpdate ) {
                    [string] $partitionKeyLocal = $item.PartitionKey
                    [string] $rowKeyLocal = $item.RowKey

                    # change task value
                    [Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity] $tineTask = `
                        New-Object 'Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity' $partitionKeyLocal, $rowKeyLocal

                    $tineTask.ETag = '*'
                    if ($PSBoundParameters.ContainsKey('tineTaskId')) { $tineTask.Properties.Add( 'tine_task_id', [System.Guid]$tineTaskId) }
                    if ($PSBoundParameters.ContainsKey('tineTaskPartitionKeyComputerName')) { $tineTask.Properties.Add( 'tine_task_partition_key_computer_name', [System.String]$tineTaskPartitionKeyComputerName) }
                    if ($PSBoundParameters.ContainsKey('tineTaskRowKeyUtcDateTime')) { $tineTask.Properties.Add( 'tine_task_row_key_utc_date_time', [System.String]$tineTaskRowKeyUtcDateTime) }
                    if ($PSBoundParameters.ContainsKey('tineScriptLibraryId')) { $tineTask.Properties.Add( 'tine_script_library_id', [System.Guid]$tineScriptLibraryId) }
                    if ($PSBoundParameters.ContainsKey('tineMachineId')) { $tineTask.Properties.Add( 'tine_machine_id', [System.Guid]$tineMachineId) }
                    if ($PSBoundParameters.ContainsKey('tineCreationId')) { $tineTask.Properties.Add( 'tine_creation_id', [System.Guid]$tineCreationId) }
                    if ($PSBoundParameters.ContainsKey('tineTaskRcd')) { $tineTask.Properties.Add( 'tine_task_rcd', [System.String]$tineTaskRcd) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptName')) { $tineTask.Properties.Add( 'tine_task_script_name', [System.String]$tineTaskScriptName) }
                    if ($PSBoundParameters.ContainsKey('tineTaskStatusRcd')) { $tineTask.Properties.Add( 'tine_task_status_rcd', [System.String]$tineTaskStatusRcd) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptStartDateTime')) { $tineTask.Properties.Add( 'tine_task_script_start_date_time', [System.DateTime]$tineTaskScriptStartDateTime) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptEndDateTime')) { $tineTask.Properties.Add( 'tine_task_script_end_date_time', [System.DateTime]$tineTaskScriptEndDateTime) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRcd')) { $tineTask.Properties.Add( 'tine_task_script_outcome_rcd', [System.String]$tineTaskScriptOutcomeRcd) }
                    if ($PSBoundParameters.ContainsKey('userId')) { $tineTask.Properties.Add( 'user_id', [System.Guid]$userId) }
                    if ($PSBoundParameters.ContainsKey('dateTime')) { $tineTask.Properties.Add( 'date_time', [System.DateTime]$dateTime) }

                    $script:tableTineTask.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Merge($tineTask)) | Out-Null
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
    if ($tineTaskForUpdate) { try { Remove-Variable -Scope:Script -Name tineTaskForUpdate } catch {}}
    if ($script:tableTineTask) { try { Remove-Variable -Scope:Script -Name tableTineTask } catch {}}
    if ($partitionKeyLocal) { try { Remove-Variable -Scope:Script -Name partitionKeyLocal } catch {}}
    if ($rowKeyLocal) { try { Remove-Variable -Scope:Script -Name rowKeyLocal } catch {}}
    if ($tineTask) { try { Remove-Variable -Scope:Script -Name tineTask } catch {}}
    if ($script:list) { try { Remove-Variable -Scope:Script -Name list } catch {}}
    if ($script:query) { try { Remove-Variable -Scope:Script -Name query } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'update tine_task by foreign keys'
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
                $script:tableTineTask = Get-AzureStorageTable -Context $script:storageContext -Name 'tineTask' -ErrorAction SilentlyContinue
            }

            if ( $script:tableTineTask -eq $null -and !$whatIf ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_task_id' )
                $script:list.Add( 'tine_task_partition_key_computer_name' )
                $script:list.Add( 'tine_task_row_key_utc_date_time' )
                $script:list.Add( 'tine_script_library_id' )
                $script:list.Add( 'tine_machine_id' )
                $script:list.Add( 'tine_creation_id' )
                $script:list.Add( 'tine_task_rcd' )
                $script:list.Add( 'tine_task_script_name' )
                $script:list.Add( 'tine_task_status_rcd' )
                $script:list.Add( 'tine_task_script_start_date_time' )
                $script:list.Add( 'tine_task_script_end_date_time' )
                $script:list.Add( 'tine_task_script_outcome_rcd' )
                $script:list.Add( 'user_id' )
                $script:list.Add( 'date_time' )

                # filter tineTaskId ( primary key )
                if ($PSBoundParameters.ContainsKey('tineTaskId')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_id eq guid'''+ $tineTaskId + ''''
                }

                # filter tineScriptLibraryId ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineScriptLibraryId')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_script_library_id eq guid'''+ $tineScriptLibraryId + ''''
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

                # filter tineTaskRcd ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineTaskRcd')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_rcd eq '''+ $tineTaskRcd + ''''
                }

                # filter tineTaskStatusRcd ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineTaskStatusRcd')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_status_rcd eq '''+ $tineTaskStatusRcd + ''''
                }

                # filter tineTaskScriptOutcomeRcd ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRcd')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_script_outcome_rcd eq '''+ $tineTaskScriptOutcomeRcd + ''''
                }

                # filter tineTaskPartitionKeyComputerName ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskPartitionKeyComputerName')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_partition_key_computer_name eq '''+ $tineTaskPartitionKeyComputerName + ''''
                }

                # filter tineTaskRowKeyUtcDateTime ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskRowKeyUtcDateTime')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_row_key_utc_date_time eq '''+ $tineTaskRowKeyUtcDateTime + ''''
                }

                # filter tineTaskRcd ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskRcd')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_rcd eq '''+ $tineTaskRcd + ''''
                }

                # filter tineTaskScriptName ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptName')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_script_name eq '''+ $tineTaskScriptName + ''''
                }

                # filter tineTaskStatusRcd ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskStatusRcd')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_status_rcd eq '''+ $tineTaskStatusRcd + ''''
                }

                # filter tineTaskScriptOutcomeRcd ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRcd')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_script_outcome_rcd eq '''+ $tineTaskScriptOutcomeRcd + ''''
                }

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTaskForUpdate = $script:tableTineTask.CloudTable.ExecuteQuery($script:query)
                }

                foreach ( $item in $tineTaskForUpdate ) {
                    [string] $partitionKeyLocal = $item.PartitionKey
                    [string] $rowKeyLocal = $item.RowKey

                    # change task value
                    [Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity] $tineTask = `
                        New-Object 'Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity' $partitionKeyLocal, $rowKeyLocal

                    $tineTask.ETag = '*'
                    if ($PSBoundParameters.ContainsKey('tineTaskId')) { $tineTask.Properties.Add( 'tine_task_id', [System.Guid]$tineTaskId) }
                    if ($PSBoundParameters.ContainsKey('tineTaskPartitionKeyComputerName')) { $tineTask.Properties.Add( 'tine_task_partition_key_computer_name', [System.String]$tineTaskPartitionKeyComputerName) }
                    if ($PSBoundParameters.ContainsKey('tineTaskRowKeyUtcDateTime')) { $tineTask.Properties.Add( 'tine_task_row_key_utc_date_time', [System.String]$tineTaskRowKeyUtcDateTime) }
                    if ($PSBoundParameters.ContainsKey('tineScriptLibraryId')) { $tineTask.Properties.Add( 'tine_script_library_id', [System.Guid]$tineScriptLibraryId) }
                    if ($PSBoundParameters.ContainsKey('tineMachineId')) { $tineTask.Properties.Add( 'tine_machine_id', [System.Guid]$tineMachineId) }
                    if ($PSBoundParameters.ContainsKey('tineCreationId')) { $tineTask.Properties.Add( 'tine_creation_id', [System.Guid]$tineCreationId) }
                    if ($PSBoundParameters.ContainsKey('tineTaskRcd')) { $tineTask.Properties.Add( 'tine_task_rcd', [System.String]$tineTaskRcd) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptName')) { $tineTask.Properties.Add( 'tine_task_script_name', [System.String]$tineTaskScriptName) }
                    if ($PSBoundParameters.ContainsKey('tineTaskStatusRcd')) { $tineTask.Properties.Add( 'tine_task_status_rcd', [System.String]$tineTaskStatusRcd) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptStartDateTime')) { $tineTask.Properties.Add( 'tine_task_script_start_date_time', [System.DateTime]$tineTaskScriptStartDateTime) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptEndDateTime')) { $tineTask.Properties.Add( 'tine_task_script_end_date_time', [System.DateTime]$tineTaskScriptEndDateTime) }
                    if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRcd')) { $tineTask.Properties.Add( 'tine_task_script_outcome_rcd', [System.String]$tineTaskScriptOutcomeRcd) }
                    if ($PSBoundParameters.ContainsKey('userId')) { $tineTask.Properties.Add( 'user_id', [System.Guid]$userId) }
                    if ($PSBoundParameters.ContainsKey('dateTime')) { $tineTask.Properties.Add( 'date_time', [System.DateTime]$dateTime) }

                    $script:tableTineTask.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Merge($tineTask)) | Out-Null
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
    if ($tineTaskForUpdate) { try { Remove-Variable -Scope:Script -Name tineTaskForUpdate } catch {}}
    if ($script:tableTineTask) { try { Remove-Variable -Scope:Script -Name tableTineTask } catch {}}
    if ($partitionKeyLocal) { try { Remove-Variable -Scope:Script -Name partitionKeyLocal } catch {}}
    if ($rowKeyLocal) { try { Remove-Variable -Scope:Script -Name rowKeyLocal } catch {}}
    if ($tineTask) { try { Remove-Variable -Scope:Script -Name tineTask } catch {}}
    if ($script:list) { try { Remove-Variable -Scope:Script -Name list } catch {}}
    if ($script:query) { try { Remove-Variable -Scope:Script -Name query } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'delete from tine_task'
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

            $script:tableTineTask = Get-AzureStorageTable -Context $script:storageContext -Name 'tineTask' -ErrorAction SilentlyContinue

            if ( $script:tableTineTask -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_task_id' )

                $script:query.FilterString = 'tine_task_id eq guid'''+ $tineTaskId + ''''
                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTaskForDelete = $script:tableTineTask.CloudTable.ExecuteQuery($script:query)
                }

                # delete selected rows
                foreach ( $tineTaskItem in $tineTaskForDelete ) {
                    $script:tableTineTask.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Delete($tineTaskItem)) | Out-Null
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
    if ($tineTaskForDelete) { try { Remove-Variable -Scope:Script -Name tineTaskForDelete } catch {}}
    if ($tineTaskItem) { try { Remove-Variable -Scope:Script -Name tineTaskItem } catch {}}
    if ($script:tableTineTask) { try { Remove-Variable -Scope:Script -Name tableTineTask } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'fetch value from tine_task'
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
                $script:tableTineTask = Get-AzureStorageTable -Context $script:storageContext -Name 'tineTask' -ErrorAction SilentlyContinue
            }

            if ( $script:tableTineTask -eq $null -and !$whatIf ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( $fetchValue )

                # filter tineTaskId ( primary key )
                if ($PSBoundParameters.ContainsKey('tineTaskId')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_id eq guid'''+ $tineTaskId + ''''
                }

                # filter tineScriptLibraryId ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineScriptLibraryId')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_script_library_id eq guid'''+ $tineScriptLibraryId + ''''
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

                # filter tineTaskRcd ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineTaskRcd')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_rcd eq '''+ $tineTaskRcd + ''''
                }

                # filter tineTaskStatusRcd ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineTaskStatusRcd')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_status_rcd eq '''+ $tineTaskStatusRcd + ''''
                }

                # filter tineTaskScriptOutcomeRcd ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRcd')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_script_outcome_rcd eq '''+ $tineTaskScriptOutcomeRcd + ''''
                }

                # filter tineTaskPartitionKeyComputerName ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskPartitionKeyComputerName')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_partition_key_computer_name eq '''+ $tineTaskPartitionKeyComputerName + ''''
                }

                # filter tineTaskRowKeyUtcDateTime ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskRowKeyUtcDateTime')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_row_key_utc_date_time eq '''+ $tineTaskRowKeyUtcDateTime + ''''
                }

                # filter tineTaskRcd ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskRcd')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_rcd eq '''+ $tineTaskRcd + ''''
                }

                # filter tineTaskScriptName ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptName')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_script_name eq '''+ $tineTaskScriptName + ''''
                }

                # filter tineTaskStatusRcd ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskStatusRcd')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_status_rcd eq '''+ $tineTaskStatusRcd + ''''
                }

                # filter tineTaskScriptOutcomeRcd ( string column )
                if ($PSBoundParameters.ContainsKey('tineTaskScriptOutcomeRcd')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_task_script_outcome_rcd eq '''+ $tineTaskScriptOutcomeRcd + ''''
                }

                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + $script:query.FilterString
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTask = $script:tableTineTask.CloudTable.ExecuteQuery($script:query)
                }

                # get value
                [string] $outValue = ''
                if (($tineTask | Measure-Object).Count -gt 0) {
                    $outValue = $tineTask[0].Properties[$fetchValue].PropertyAsObject

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
    if ($tineTask) { try { Remove-Variable -Scope:Script -Name tineTask } catch {}}
    if ($script:tableTineTask) { try { Remove-Variable -Scope:Script -Name tableTineTask } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'delete all from tine_task'
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

            $script:tableTineTask = Get-AzureStorageTable -Context $script:storageContext -Name 'tineTask' -ErrorAction SilentlyContinue

            if ( $script:tableTineTask -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_task_id' )

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTaskForDelete = $script:tableTineTask.CloudTable.ExecuteQuery($script:query)
                }

                # delete selected rows
                foreach ( $tineTaskItem in $tineTaskForDelete ) {
                    $script:tableTineTask.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Delete($tineTaskItem)) | Out-Null
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
    if ($tineTaskForDelete) { try { Remove-Variable -Scope:Script -Name tineTaskForDelete } catch {}}
    if ($tineTaskItem) { try { Remove-Variable -Scope:Script -Name tineTaskItem } catch {}}
    if ($script:tableTineTask) { try { Remove-Variable -Scope:Script -Name tableTineTask } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'show tine_task'
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

            $script:tableTineTask = Get-AzureStorageTable -Context $script:storageContext -Name 'tineTask' -ErrorAction SilentlyContinue

            if ( $script:tableTineTask -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_task_id' )
                $script:list.Add( 'tine_task_partition_key_computer_name' )
                $script:list.Add( 'tine_task_row_key_utc_date_time' )
                $script:list.Add( 'tine_script_library_id' )
                $script:list.Add( 'tine_machine_id' )
                $script:list.Add( 'tine_creation_id' )
                $script:list.Add( 'tine_task_rcd' )
                $script:list.Add( 'tine_task_script_name' )
                $script:list.Add( 'tine_task_status_rcd' )
                $script:list.Add( 'tine_task_script_start_date_time' )
                $script:list.Add( 'tine_task_script_end_date_time' )
                $script:list.Add( 'tine_task_script_outcome_rcd' )
                $script:list.Add( 'user_id' )
                $script:list.Add( 'date_time' )

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTask = $script:tableTineTask.CloudTable.ExecuteQuery($script:query)
                }

                # echo
                [string] $script:output = ''
                $script:output = $tineTask `
                    | Format-Table PartitionKey, RowKey, `
                    @{ Label = 'Tine Task Id'; Expression={$_.Properties['tine_task_id'].GuidValue} },`
                    @{ Label = 'Tine Task Partition Key Computer Name'; Expression={$_.Properties['tine_task_partition_key_computer_name'].StringValue} },`
                    @{ Label = 'Tine Task Row Key Utc Date Time'; Expression={$_.Properties['tine_task_row_key_utc_date_time'].StringValue} },`
                    @{ Label = 'Tine Script Library Id'; Expression={$_.Properties['tine_script_library_id'].GuidValue} },`
                    @{ Label = 'Tine Machine Id'; Expression={$_.Properties['tine_machine_id'].GuidValue} },`
                    @{ Label = 'Tine Creation Id'; Expression={$_.Properties['tine_creation_id'].GuidValue} },`
                    @{ Label = 'Tine Task'; Expression={$_.Properties['tine_task_rcd'].StringValue} },`
                    @{ Label = 'Tine Task Script Name'; Expression={$_.Properties['tine_task_script_name'].StringValue} },`
                    @{ Label = 'Tine Task Status'; Expression={$_.Properties['tine_task_status_rcd'].StringValue} },`
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
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'no result for ' + 'tine_task' #+ ': ' + $script:query.FilterString
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
    if ($tineTask) { try { Remove-Variable -Scope:Script -Name tineTask } catch {}}
    if ($script:tableTineTask) { try { Remove-Variable -Scope:Script -Name tableTineTask } catch {}}
    if ($script:storageContext) { try { Remove-Variable -Scope:Script -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'drop tine_task'
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

            $script:tableTineTask = Get-AzureStorageTable -Context $script:storageContext -Name 'tineTask' -ErrorAction SilentlyContinue

            if ( $script:tableTineTask -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                Remove-AzureStorageTable -Context $script:storageContext -Name 'tineTask' -Force
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
    if ($script:tableTineTask) { try { Remove-Variable -Scope:Script -Name tableTineTask } catch {}}
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
if ($script:tineTaskData) { try { Remove-Variable -Scope:Script -Name tineTaskData } catch {} }

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
    ConvertTo-Json -InputObject $script:tineTaskDataList
}

if ($returnObject) {
    $script:tineTaskDataList
}

if ($returnGridView) {
    $script:tineTaskDataList | Out-GridView
}
