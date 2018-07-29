# SQL2X Generated code based on a SQL Server Schema
# SQL2X Version: 0.d
# http://sql2x.azurewebsites.net/
# Generated Date: 7/29/2018 2:50:53 PM
# Template: sql2x.PowerShellGenerator.CifudeScript
#
# .\cifude\tine_task_status_ref.ps1 -doEcho       -doSql2x -comment test -create
# .\cifude\tine_task_status_ref.ps1 -doEcho       -doSql2x -comment test -insert               -tineTaskStatusRcd:([string]'')
# .\cifude\tine_task_status_ref.ps1 -doEcho       -doSql2x -comment test -fetch                -tineTaskStatusRcd:([string]'')
# .\cifude\tine_task_status_ref.ps1 -returnValue  -doSql2x -comment test -fetchValue:column    -tineTaskStatusRcd:([string]'')
# .\cifude\tine_task_status_ref.ps1 -doEcho       -doSql2x -comment test -updateByPrimaryKey   -tineTaskStatusRcd:([string]'') -show
# .\cifude\tine_task_status_ref.ps1 -doEcho       -doSql2x -comment test -updateByForeignKeys  -show
# .\cifude\tine_task_status_ref.ps1 -doEcho       -doSql2x -comment test -deleteAll
# .\cifude\tine_task_status_ref.ps1 -doEcho       -doSql2x -comment test -delete               -tineTaskStatusRcd:([string]'')
# .\cifude\tine_task_status_ref.ps1 -doEcho       -doSql2x -comment test -drop
# .\cifude\tine_task_status_ref.ps1 -doEcho       -doSql2x -comment test -show
# .\cifude\tine_task_status_ref.ps1 -doEcho       -doSql2x -comment test -help
#
# all
# .\cifude\tine_task_status_ref.ps1 -doEcho       -doSql2x -comment test -create -insert -fetch -fetchValue:column -update -show -delete -drop -tineTaskStatusRcd:([string]'')
# [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSPossibleIncorrectComparisonWithNull', Scope='Function', Target='*')]  # because, history!
param (
    [string]$scriptName = 'CIFUDE ( Create Insert Fetch Update Delete Extras ) for tine_task_status_ref',
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
    [System.String]$tineTaskStatusRcd = '',
    [System.String]$tineTaskStatusName = '',
    [System.Guid]$userId = '00000000-0000-0000-0000-000000000000',
    [System.DateTime]$dateTime = '1601.01.01T00:00:00Z',
    [System.String]$tineTaskStatusRefPartitionKey = $env:ComputerName,
    [System.String]$tineTaskStatusRefRowKey = [System.DateTime]::UtcNow.ToString('yyyy.MM.ddTHH:mm:ss fffZ')

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

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.String] tineTaskStatusRcd = ''")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.String] tineTaskStatusName = ''")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.Guid] userId = '00000000-0000-0000-0000-000000000000'")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.DateTime] dateTime = '1601.01.01T00:00:00Z'")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.String] tineTaskStatusRefPartitionKey = $env:ComputerName")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.String] tineTaskStatusRefRowKey = [System.DateTime]::UtcNow.ToString('yyyy.MM.ddTHH:mm:ss fffZ')")
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
class TineTaskStatusRefData {
    [System.String]$tineTaskStatusRcd = ''
    [System.String]$tineTaskStatusName = ''
    [System.Guid]$userId = '00000000-0000-0000-0000-000000000000'
    [System.DateTime]$dateTime = '1601.01.01T00:00:00Z'
    [System.String]$tineTaskStatusRefPartitionKey = $env:ComputerName
    [System.String]$tineTaskStatusRefRowKey = [System.DateTime]::UtcNow.ToString('yyyy.MM.ddTHH:mm:ss fffZ')
}
#endregion
##################################################################################################################
$taskName = 'create tine_task_status_ref'
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

            $tableTineTaskStatusRef = Get-AzureStorageTable -Context $storageContext -Name 'tineTaskStatusRef' -ErrorAction SilentlyContinue

            if ( $tableTineTaskStatusRef -ne $null ) {
                Remove-AzureStorageTable -Context $storageContext -Name 'tineTaskStatusRef' -Force
            }

            # create new table
            $tableTineTaskStatusRef = $null
            while ($tableTineTaskStatusRef -eq $null) {
                # wait for an escalating number of seconds 
                $trials++
                if ($trials -gt 10) {
                    throw [Exception] ('Failed to create table')
                }

                Start-Sleep $trials

                # create new table
                $tableTineTaskStatusRef = `
                    New-AzureStorageTable `
                        -Context $storageContext `
                        -Name 'tineTaskStatusRef'

                if ( $tableTineTaskStatusRef -ne $null ) {
                    # insert row
                    $tineTaskStatusRef = 
                        New-Object `
                            -TypeName Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity `
                            -ArgumentList $tineTaskStatusRefPartitionKey, $tineTaskStatusRefRowKey

                    $tineTaskStatusRef.Properties.Add( 'tine_task_status_rcd', [System.String]$tineTaskStatusRcd)
                    $tineTaskStatusRef.Properties.Add( 'tine_task_status_name', [System.String]$tineTaskStatusName)
                    $tineTaskStatusRef.Properties.Add( 'user_id', [System.Guid]$userId)
                    $tineTaskStatusRef.Properties.Add( 'date_time', [System.DateTime]$dateTime)
                    $tineTaskStatusRef.Properties.Add( 'tine_task_status_ref_partition_key', [System.String]$tineTaskStatusRefPartitionKey)
                    $tineTaskStatusRef.Properties.Add( 'tine_task_status_ref_row_key', [System.String]$tineTaskStatusRefRowKey)

                    $tableTineTaskStatusRef.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Insert($tineTaskStatusRef)) | Out-Null
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
    if ($tableTineTaskStatusRef) { try { Remove-Variable -Name tableTineTaskStatusRef } catch {}}
    if ($storageContext) { try { Remove-Variable -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'insert to tine_task_status_ref'
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

        # validate tineTaskStatusRcd ( primary key )
        if ($tineTaskStatusRcd -eq '') {
            # log
            $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'Primary Key:' + ' ' + 'tineTaskStatusRcd' + ' ' + 'is missing'
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host ( $taskLine ) -ForegroundColor red }
            $answer = 'no'
        }

        if ($answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {

            # connect and validate table
            $storageContext = New-AzureStorageContext -ConnectionString $storageConnectionString

            $tableTineTaskStatusRef = Get-AzureStorageTable -Context $storageContext -Name 'tineTaskStatusRef' -ErrorAction SilentlyContinue

            if ( $tableTineTaskStatusRef -eq $null ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task_status_ref table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # insert row
                $tineTaskStatusRef =
                    New-Object `
                        -TypeName Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity `
                        -ArgumentList $tineTaskStatusRefPartitionKey, $tineTaskStatusRefRowKey

                $tineTaskStatusRef.Properties.Add( 'tine_task_status_rcd', [System.String]$tineTaskStatusRcd)
                $tineTaskStatusRef.Properties.Add( 'tine_task_status_name', [System.String]$tineTaskStatusName)
                $tineTaskStatusRef.Properties.Add( 'user_id', [System.Guid]$userId)
                $tineTaskStatusRef.Properties.Add( 'date_time', [System.DateTime]$dateTime)
                $tineTaskStatusRef.Properties.Add( 'tine_task_status_ref_partition_key', [System.String]$tineTaskStatusRefPartitionKey)
                $tineTaskStatusRef.Properties.Add( 'tine_task_status_ref_row_key', [System.String]$tineTaskStatusRefRowKey)

                $tableTineTaskStatusRef.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Insert($tineTaskStatusRef)) | Out-Null
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
    if ($tineTaskStatusRef) { try { Remove-Variable -Name tineTaskStatusRef } catch {}}
    if ($tableTineTaskStatusRef) { try { Remove-Variable -Name tableTineTaskStatusRef } catch {}}
    if ($storageContext) { try { Remove-Variable -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'fetch from tine_task_status_ref'
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
                $tableTineTaskStatusRef = Get-AzureStorageTable -Context $storageContext -Name 'tineTaskStatusRef' -ErrorAction SilentlyContinue
            }

            if ( $tableTineTaskStatusRef -eq $null -and !$whatIf ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task_status_ref table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $list = New-Object System.Collections.Generic.List[string]

                $list.Add( 'tine_task_status_rcd' )
                $list.Add( 'tine_task_status_name' )
                $list.Add( 'user_id' )
                $list.Add( 'date_time' )
                $list.Add( 'tine_task_status_ref_partition_key' )
                $list.Add( 'tine_task_status_ref_row_key' )

                # filter tineTaskStatusRcd ( primary key )
                if ($tineTaskStatusRcd -ne  [TineTaskStatusRefData]::new().tineTaskStatusRcd) {
                    if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_task_status_rcd eq '''+ $tineTaskStatusRcd + ''''
                }

                $query.SelectColumns = $list
                $query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTaskStatusRef = $tableTineTaskStatusRef.CloudTable.ExecuteQuery($query)
                }

                if ($tineTaskStatusRefData) { try { Remove-Variable -Name tineTaskStatusRefData } catch {}}

                if (($tineTaskStatusRef | Measure-Object).Count -gt 0) {
                    $tineTaskStatusRefData = [TineTaskStatusRefData]::new()

                    $tineTaskStatusRefData.tineTaskStatusRcd = $tineTaskStatusRef[0].Properties['tine_task_status_rcd'].StringValue
                    $tineTaskStatusRefData.tineTaskStatusName = $tineTaskStatusRef[0].Properties['tine_task_status_name'].StringValue
                    $tineTaskStatusRefData.userId = $tineTaskStatusRef[0].Properties['user_id'].GuidValue
                    $tineTaskStatusRefData.dateTime = $tineTaskStatusRef[0].Properties['date_time'].DateTime
                    $tineTaskStatusRefData.tineTaskStatusRefPartitionKey = $env:ComputerName
                    $tineTaskStatusRefData.tineTaskStatusRefRowKey = [System.DateTime]::UtcNow.ToString('yyyy.MM.ddTHH:mm:ss fffZ')

                    # to json
                    if ($returnJson) {
                        if ($outputJson) { try { Remove-Variable -Name outputJson } catch {}}

                        $outputJson = ConvertTo-Json -InputObject $tineTaskStatusRefData
                    }

                }

                # check if any column parameter is chosen
                [boolean] $includeAll = $true
                foreach ($parameter in $PSBoundParameters.Keys) {
                    $includeAll -= ($parameter -eq 'tineTaskStatusRcd')
                    $includeAll -= ($parameter -eq 'tineTaskStatusName')
                    $includeAll -= ($parameter -eq 'userId')
                    $includeAll -= ($parameter -eq 'dateTime')
                    $includeAll -= ($parameter -eq 'tineTaskStatusRefPartitionKey')
                    $includeAll -= ($parameter -eq 'tineTaskStatusRefRowKey')
                }

                # property echo
                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskStatusRcd') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskStatusRcd' + '; [' + $tineTaskStatusRefData.tineTaskStatusRcd + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskStatusName') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskStatusName' + '; [' + $tineTaskStatusRefData.tineTaskStatusName + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('userId') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'userId' + '; [' + $tineTaskStatusRefData.userId + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('dateTime') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'dateTime' + '; [' + $tineTaskStatusRefData.dateTime + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskStatusRefPartitionKey') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskStatusRefPartitionKey' + '; [' + $tineTaskStatusRefData.tineTaskStatusRefPartitionKey + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineTaskStatusRefRowKey') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineTaskStatusRefRowKey' + '; [' + $tineTaskStatusRefData.tineTaskStatusRefRowKey + ']'
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
    if ($tineTaskStatusRef) { try { Remove-Variable -Name tineTaskStatusRef } catch {}}
    if ($tableTineTaskStatusRef) { try { Remove-Variable -Name tableTineTaskStatusRef } catch {}}
    if ($storageContext) { try { Remove-Variable -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'update tine_task_status_ref'
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
                $tableTineTaskStatusRef = Get-AzureStorageTable -Context $storageContext -Name 'tineTaskStatusRef' -ErrorAction SilentlyContinue
            }

            if ( $tableTineTaskStatusRef -eq $null -and !$whatIf ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task_status_ref table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $list = New-Object System.Collections.Generic.List[string]


                $query.FilterString = 'tine_task_status_rcd eq '''+ $tineTaskStatusRcd + ''''
                $query.SelectColumns = $list
                $query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTaskStatusRefForUpdate = $tableTineTaskStatusRef.CloudTable.ExecuteQuery($query)
                }

                foreach ( $item in $tineTaskStatusRefForUpdate ) {
                    [string] $partitionKeyLocal = $item.PartitionKey
                    [string] $rowKeyLocal = $item.RowKey

                    # change task value
                    [Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity] $tineTaskStatusRef = `
                        New-Object 'Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity' $partitionKeyLocal, $rowKeyLocal

                    $tineTaskStatusRef.ETag = '*'
                    if ($PSBoundParameters.ContainsKey('tineTaskStatusRcd')) { $tineTaskStatusRef.Properties.Add( 'tine_task_status_rcd', [System.String]$tineTaskStatusRcd) }
                    if ($PSBoundParameters.ContainsKey('tineTaskStatusName')) { $tineTaskStatusRef.Properties.Add( 'tine_task_status_name', [System.String]$tineTaskStatusName) }
                    if ($PSBoundParameters.ContainsKey('userId')) { $tineTaskStatusRef.Properties.Add( 'user_id', [System.Guid]$userId) }
                    if ($PSBoundParameters.ContainsKey('dateTime')) { $tineTaskStatusRef.Properties.Add( 'date_time', [System.DateTime]$dateTime) }
                    if ($PSBoundParameters.ContainsKey('tineTaskStatusRefPartitionKey')) { $tineTaskStatusRef.Properties.Add( 'tine_task_status_ref_partition_key', [System.String]$tineTaskStatusRefPartitionKey) }
                    if ($PSBoundParameters.ContainsKey('tineTaskStatusRefRowKey')) { $tineTaskStatusRef.Properties.Add( 'tine_task_status_ref_row_key', [System.String]$tineTaskStatusRefRowKey) }

                    $tableTineTaskStatusRef.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Merge($tineTaskStatusRef)) | Out-Null
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
    if ($tineTaskStatusRefForUpdate) { try { Remove-Variable -Name tineTaskStatusRefForUpdate } catch {}}
    if ($tableTineTaskStatusRef) { try { Remove-Variable -Name tableTineTaskStatusRef } catch {}}
    if ($partitionKeyLocal) { try { Remove-Variable -Name partitionKeyLocal } catch {}}
    if ($rowKeyLocal) { try { Remove-Variable -Name rowKeyLocal } catch {}}
    if ($tineTaskStatusRef) { try { Remove-Variable -Name tineTaskStatusRef } catch {}}
    if ($list) { try { Remove-Variable -Name list } catch {}}
    if ($query) { try { Remove-Variable -Name query } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'update tine_task_status_ref by foreign keys'
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
                $tableTineTaskStatusRef = Get-AzureStorageTable -Context $storageContext -Name 'tineTaskStatusRef' -ErrorAction SilentlyContinue
            }

            if ( $tableTineTaskStatusRef -eq $null -and !$whatIf ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task_status_ref table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $list = New-Object System.Collections.Generic.List[string]

                $list.Add( 'tine_task_status_rcd' )
                $list.Add( 'tine_task_status_name' )
                $list.Add( 'user_id' )
                $list.Add( 'date_time' )
                $list.Add( 'tine_task_status_ref_partition_key' )
                $list.Add( 'tine_task_status_ref_row_key' )

                # filter tineTaskStatusRcd ( primary key )
                if ($tineTaskStatusRcd -ne  [TineTaskStatusRefData]::new().tineTaskStatusRcd) {
                    if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_task_status_rcd eq '''+ $tineTaskStatusRcd + ''''
                }

                $query.SelectColumns = $list
                $query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTaskStatusRefForUpdate = $tableTineTaskStatusRef.CloudTable.ExecuteQuery($query)
                }

                foreach ( $item in $tineTaskStatusRefForUpdate ) {
                    [string] $partitionKeyLocal = $item.PartitionKey
                    [string] $rowKeyLocal = $item.RowKey

                    # change task value
                    [Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity] $tineTaskStatusRef = `
                        New-Object 'Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity' $partitionKeyLocal, $rowKeyLocal

                    $tineTaskStatusRef.ETag = '*'
                    if ($PSBoundParameters.ContainsKey('tineTaskStatusRcd')) { $tineTaskStatusRef.Properties.Add( 'tine_task_status_rcd', [System.String]$tineTaskStatusRcd) }
                    if ($PSBoundParameters.ContainsKey('tineTaskStatusName')) { $tineTaskStatusRef.Properties.Add( 'tine_task_status_name', [System.String]$tineTaskStatusName) }
                    if ($PSBoundParameters.ContainsKey('userId')) { $tineTaskStatusRef.Properties.Add( 'user_id', [System.Guid]$userId) }
                    if ($PSBoundParameters.ContainsKey('dateTime')) { $tineTaskStatusRef.Properties.Add( 'date_time', [System.DateTime]$dateTime) }
                    if ($PSBoundParameters.ContainsKey('tineTaskStatusRefPartitionKey')) { $tineTaskStatusRef.Properties.Add( 'tine_task_status_ref_partition_key', [System.String]$tineTaskStatusRefPartitionKey) }
                    if ($PSBoundParameters.ContainsKey('tineTaskStatusRefRowKey')) { $tineTaskStatusRef.Properties.Add( 'tine_task_status_ref_row_key', [System.String]$tineTaskStatusRefRowKey) }

                    $tableTineTaskStatusRef.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Merge($tineTaskStatusRef)) | Out-Null
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
    if ($tineTaskStatusRefForUpdate) { try { Remove-Variable -Name tineTaskStatusRefForUpdate } catch {}}
    if ($tableTineTaskStatusRef) { try { Remove-Variable -Name tableTineTaskStatusRef } catch {}}
    if ($partitionKeyLocal) { try { Remove-Variable -Name partitionKeyLocal } catch {}}
    if ($rowKeyLocal) { try { Remove-Variable -Name rowKeyLocal } catch {}}
    if ($tineTaskStatusRef) { try { Remove-Variable -Name tineTaskStatusRef } catch {}}
    if ($list) { try { Remove-Variable -Name list } catch {}}
    if ($query) { try { Remove-Variable -Name query } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'delete from tine_task_status_ref'
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

            $tableTineTaskStatusRef = Get-AzureStorageTable -Context $storageContext -Name 'tineTaskStatusRef' -ErrorAction SilentlyContinue

            if ( $tableTineTaskStatusRef -eq $null ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task_status_ref table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $list = New-Object System.Collections.Generic.List[string]

                $list.Add( 'tine_task_status_rcd' )

                $query.FilterString = 'tine_task_status_rcd eq '''+ $tineTaskStatusRcd + ''''
                $query.SelectColumns = $list
                $query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTaskStatusRefForDelete = $tableTineTaskStatusRef.CloudTable.ExecuteQuery($query)
                }

                # delete selected rows
                foreach ( $tineTaskStatusRefItem in $tineTaskStatusRefForDelete ) {
                    $tableTineTaskStatusRef.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Delete($tineTaskStatusRefItem)) | Out-Null
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
    if ($tineTaskStatusRefForDelete) { try { Remove-Variable -Name tineTaskStatusRefForDelete } catch {}}
    if ($tineTaskStatusRefItem) { try { Remove-Variable -Name tineTaskStatusRefItem } catch {}}
    if ($tableTineTaskStatusRef) { try { Remove-Variable -Name tableTineTaskStatusRef } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'fetch value from tine_task_status_ref'
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
                $tableTineTaskStatusRef = Get-AzureStorageTable -Context $storageContext -Name 'tineTaskStatusRef' -ErrorAction SilentlyContinue
            }

            if ( $tableTineTaskStatusRef -eq $null -and !$whatIf ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task_status_ref table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $list = New-Object System.Collections.Generic.List[string]

                $list.Add( $fetchValue )

                # filter tineTaskStatusRcd ( primary key )
                if ($tineTaskStatusRcd -ne  [TineTaskStatusRefData]::new().tineTaskStatusRcd) {
                    if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_task_status_rcd eq '''+ $tineTaskStatusRcd + ''''
                }

                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + $query.FilterString
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }

                $query.SelectColumns = $list
                $query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTaskStatusRef = $tableTineTaskStatusRef.CloudTable.ExecuteQuery($query)
                }

                # get value
                [string] $outValue = ''
                if (($tineTaskStatusRef | Measure-Object).Count -gt 0) {
                    $outValue = $tineTaskStatusRef[0].Properties[$fetchValue].PropertyAsObject

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
    if ($tineTaskStatusRef) { try { Remove-Variable -Name tineTaskStatusRef } catch {}}
    if ($tableTineTaskStatusRef) { try { Remove-Variable -Name tableTineTaskStatusRef } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'delete all from tine_task_status_ref'
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

            $tableTineTaskStatusRef = Get-AzureStorageTable -Context $storageContext -Name 'tineTaskStatusRef' -ErrorAction SilentlyContinue

            if ( $tableTineTaskStatusRef -eq $null ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task_status_ref table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $list = New-Object System.Collections.Generic.List[string]

                $list.Add( 'tine_task_status_rcd' )

                $query.SelectColumns = $list
                $query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTaskStatusRefForDelete = $tableTineTaskStatusRef.CloudTable.ExecuteQuery($query)
                }

                # delete selected rows
                foreach ( $tineTaskStatusRefItem in $tineTaskStatusRefForDelete ) {
                    $tableTineTaskStatusRef.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Delete($tineTaskStatusRefItem)) | Out-Null
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
    if ($tineTaskStatusRefForDelete) { try { Remove-Variable -Name tineTaskStatusRefForDelete } catch {}}
    if ($tineTaskStatusRefItem) { try { Remove-Variable -Name tineTaskStatusRefItem } catch {}}
    if ($tableTineTaskStatusRef) { try { Remove-Variable -Name tableTineTaskStatusRef } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'show tine_task_status_ref'
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

            $tableTineTaskStatusRef = Get-AzureStorageTable -Context $storageContext -Name 'tineTaskStatusRef' -ErrorAction SilentlyContinue

            if ( $tableTineTaskStatusRef -eq $null ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task_status_ref table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $list = New-Object System.Collections.Generic.List[string]

                $list.Add( 'tine_task_status_rcd' )
                $list.Add( 'tine_task_status_name' )
                $list.Add( 'user_id' )
                $list.Add( 'date_time' )
                $list.Add( 'tine_task_status_ref_partition_key' )
                $list.Add( 'tine_task_status_ref_row_key' )

                $query.SelectColumns = $list
                $query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineTaskStatusRef = $tableTineTaskStatusRef.CloudTable.ExecuteQuery($query)
                }

                # echo
                [string] $output = ''
                $output = $tineTaskStatusRef `
                    | Format-Table PartitionKey, RowKey, `
                    @{ Label = 'Tine Task Status'; Expression={$_.Properties['tine_task_status_rcd'].StringValue} },`
                    @{ Label = 'Tine Task Status Name'; Expression={$_.Properties['tine_task_status_name'].StringValue} },`
                    @{ Label = 'User Id'; Expression={$_.Properties['user_id'].GuidValue} },`
                    @{ Label = 'Date Time'; Expression={$_.Properties['date_time'].StringValue} },`
                    @{ Label = 'Tine Task Status Ref Partition Key'; Expression={$_.Properties['tine_task_status_ref_partition_key'].StringValue} },`
                    @{ Label = 'Tine Task Status Ref Row Key'; Expression={$_.Properties['tine_task_status_ref_row_key'].StringValue} } `
                    -AutoSize `
                    | Out-String;

                # log
                if ($output -ne '') {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + $output
                } else {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'no result for ' + 'tine_task_status_ref' #+ ': ' + $query.FilterString
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
    if ($tineTaskStatusRef) { try { Remove-Variable -Name tineTaskStatusRef } catch {}}
    if ($tableTineTaskStatusRef) { try { Remove-Variable -Name tableTineTaskStatusRef } catch {}}
    if ($storageContext) { try { Remove-Variable -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'drop tine_task_status_ref'
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

            $tableTineTaskStatusRef = Get-AzureStorageTable -Context $storageContext -Name 'tineTaskStatusRef' -ErrorAction SilentlyContinue

            if ( $tableTineTaskStatusRef -eq $null ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_task_status_ref table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                Remove-AzureStorageTable -Context $storageContext -Name 'tineTaskStatusRef' -Force
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
    if ($tableTineTaskStatusRef) { try { Remove-Variable -Name tableTineTaskStatusRef } catch {}}
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
    $tineTaskStatusRefData
}

if ($returnGridView) {
    $tineTaskStatusRefData | Out-GridView
}
