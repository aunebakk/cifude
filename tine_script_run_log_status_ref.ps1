# SQL2X Generated code based on a SQL Server Schema
# SQL2X Version: 0.d
# http://sql2x.azurewebsites.net/
# Generated Date: 11/4/2018 6:35:40 AM
# Template: sql2x.PowerShellGenerator.CifudeScript
<#
.\tine_script_run_log_status_ref.ps1 -doEcho       -doSql2x -comment test -create
.\tine_script_run_log_status_ref.ps1 -doEcho       -doSql2x -comment test -insert
.\tine_script_run_log_status_ref.ps1 -doEcho       -doSql2x -comment test -fetch                -tineScriptRunLogStatusRcd:([string]'')
.\tine_script_run_log_status_ref.ps1 -returnValue  -doSql2x -comment test -fetchValue:column    -tineScriptRunLogStatusRcd:([string]'')
.\tine_script_run_log_status_ref.ps1 -doEcho       -doSql2x -comment test -updateByPrimaryKey   -show -tineScriptRunLogStatusRcd:([string]'')
.\tine_script_run_log_status_ref.ps1 -doEcho       -doSql2x -comment test -updateByForeignKeys  -show
.\tine_script_run_log_status_ref.ps1 -doEcho       -doSql2x -comment test -deleteAll
.\tine_script_run_log_status_ref.ps1 -doEcho       -doSql2x -comment test -delete               -tineScriptRunLogStatusRcd:([string]'')
.\tine_script_run_log_status_ref.ps1 -doEcho       -doSql2x -comment test -drop
.\tine_script_run_log_status_ref.ps1 -doEcho       -doSql2x -comment test -show
.\tine_script_run_log_status_ref.ps1 -doEcho       -doSql2x -comment test -help
.\tine_script_run_log_status_ref.ps1 -doEcho       -doSql2x -comment test -create -insert -fetch -fetchValue:column -updateByPrimaryKey -delete -drop -show -help -tineScriptRunLogStatusRcd:([string]'')
#>
using module '."tine_script_run_log_status_ref.psm1'
[Diagnostics.CodeAnalysis.SuppressMessageAttribute `
    ('PSPossibleIncorrectComparisonWithNull','')]
param(
    [string]$scriptName = 'CIFUDE ( Create Insert Fetch Update Delete Extras ) for tine_script_run_log_status_ref',
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
    [System.String]$tineScriptRunLogStatusRcd = '',
    [System.String]$tineScriptRunLogStatusRefPartitionKey = $env:ComputerName,
    [System.String]$tineScriptRunLogStatusRefRowKey = [System.DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ss.fffZ'),
    [System.String]$tineScriptRunLogStatusName = '',
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
# Generated Date: 11/4/2018 6:35:40 AM
# Template: sql2x.PowerShellGenerator.CifudeScript
<#
.\tine_script_run_log_status_ref.ps1 -doEcho       -doSql2x -comment test -create
.\tine_script_run_log_status_ref.ps1 -doEcho       -doSql2x -comment test -insert
.\tine_script_run_log_status_ref.ps1 -doEcho       -doSql2x -comment test -fetch                -tineScriptRunLogStatusRcd:([string]'')
.\tine_script_run_log_status_ref.ps1 -returnValue  -doSql2x -comment test -fetchValue:column    -tineScriptRunLogStatusRcd:([string]'')
.\tine_script_run_log_status_ref.ps1 -doEcho       -doSql2x -comment test -updateByPrimaryKey   -show -tineScriptRunLogStatusRcd:([string]'')
.\tine_script_run_log_status_ref.ps1 -doEcho       -doSql2x -comment test -updateByForeignKeys  -show
.\tine_script_run_log_status_ref.ps1 -doEcho       -doSql2x -comment test -deleteAll
.\tine_script_run_log_status_ref.ps1 -doEcho       -doSql2x -comment test -delete               -tineScriptRunLogStatusRcd:([string]'')
.\tine_script_run_log_status_ref.ps1 -doEcho       -doSql2x -comment test -drop
.\tine_script_run_log_status_ref.ps1 -doEcho       -doSql2x -comment test -show
.\tine_script_run_log_status_ref.ps1 -doEcho       -doSql2x -comment test -help
.\tine_script_run_log_status_ref.ps1 -doEcho       -doSql2x -comment test -create -insert -fetch -fetchValue:column -updateByPrimaryKey -delete -drop -show -help -tineScriptRunLogStatusRcd:([string]'')
#>"
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ('storageConnectionString' + ' ' + '=' + ' ' + '[' + $script:storageConnectionString + ']')
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.String] tineScriptRunLogStatusRcd = ''")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.String] tineScriptRunLogStatusRefPartitionKey = $env:ComputerName")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.String] tineScriptRunLogStatusRefRowKey = [System.DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ss.fffZ')")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.String] tineScriptRunLogStatusName = ''")
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
$script:taskName = 'create tine_script_run_log_status_ref'
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

            $script:tableTineScriptRunLogStatusRef = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunLogStatusRef' -ErrorAction SilentlyContinue

            if ( $script:tableTineScriptRunLogStatusRef -ne $null ) {
                Remove-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunLogStatusRef' -Force
            }

            [int] $script:trials = 0

            # create new table
            $script:tableTineScriptRunLogStatusRef = $null
            while ($script:tableTineScriptRunLogStatusRef -eq $null) {
                # wait for an escalating number of seconds 
                $script:trials++
                if ($script:trials -gt 10) {
                    throw [Exception] ('Failed to create table')
                }

                Start-Sleep $script:trials

                # create new table
                $script:tableTineScriptRunLogStatusRef = `
                    New-AzureStorageTable `
                        -Context $script:storageContext `
                        -Name 'tineScriptRunLogStatusRef'

                if ( $script:tableTineScriptRunLogStatusRef -ne $null ) {
                    # insert row
                    $tineScriptRunLogStatusRef = 
                        New-Object `
                            -TypeName Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity `
                            -ArgumentList $tineScriptRunLogStatusRefPartitionKey, $tineScriptRunLogStatusRefRowKey

                    $tineScriptRunLogStatusRef.Properties.Add( 'tine_script_run_log_status_rcd', [System.String]$tineScriptRunLogStatusRcd)
                    $tineScriptRunLogStatusRef.Properties.Add( 'tine_script_run_log_status_ref_partition_key', [System.String]$tineScriptRunLogStatusRefPartitionKey)
                    $tineScriptRunLogStatusRef.Properties.Add( 'tine_script_run_log_status_ref_row_key', [System.String]$tineScriptRunLogStatusRefRowKey)
                    $tineScriptRunLogStatusRef.Properties.Add( 'tine_script_run_log_status_name', [System.String]$tineScriptRunLogStatusName)
                    $tineScriptRunLogStatusRef.Properties.Add( 'user_id', [System.Guid]$userId)
                    $tineScriptRunLogStatusRef.Properties.Add( 'date_time', [System.DateTime]$dateTime)

                    $script:tableTineScriptRunLogStatusRef.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Insert($tineScriptRunLogStatusRef)) | Out-Null
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
    if ($script:tableTineScriptRunLogStatusRef) { try { Remove-Variable -Scope:Script -Name tableTineScriptRunLogStatusRef } catch {}}
    if ($script:storageContext) { try { Remove-Variable -Scope:Script -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'insert to tine_script_run_log_status_ref'
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

        # validate tineScriptRunLogStatusRcd ( primary key )
        if ($tineScriptRunLogStatusRcd -eq '') {
            # get a decent primary key, todo; check datatype
            [System.Guid] $tineScriptRunLogStatusRcd = [System.Guid]::NewGuid()

            # return primary key to caller
            $script:tineScriptRunLogStatusRefData = [TineScriptRunLogStatusRefData]::new()
            $script:tineScriptRunLogStatusRefData.tineScriptRunLogStatusRcd = $tineScriptRunLogStatusRcd
            $script:tineScriptRunLogStatusRefDataList += $script:tineScriptRunLogStatusRefData
        }

        if ($script:answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {

            # connect and validate table
            $script:storageContext = New-AzureStorageContext -ConnectionString $script:storageConnectionString

            $script:tableTineScriptRunLogStatusRef = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunLogStatusRef' -ErrorAction SilentlyContinue

            if ( $script:tableTineScriptRunLogStatusRef -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_log_status_ref table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # insert row
                $tineScriptRunLogStatusRef =
                    New-Object `
                        -TypeName Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity `
                        -ArgumentList $tineScriptRunLogStatusRefPartitionKey, $tineScriptRunLogStatusRefRowKey

                $tineScriptRunLogStatusRef.Properties.Add( 'tine_script_run_log_status_rcd', [System.String]$tineScriptRunLogStatusRcd)
                $tineScriptRunLogStatusRef.Properties.Add( 'tine_script_run_log_status_ref_partition_key', [System.String]$tineScriptRunLogStatusRefPartitionKey)
                $tineScriptRunLogStatusRef.Properties.Add( 'tine_script_run_log_status_ref_row_key', [System.String]$tineScriptRunLogStatusRefRowKey)
                $tineScriptRunLogStatusRef.Properties.Add( 'tine_script_run_log_status_name', [System.String]$tineScriptRunLogStatusName)
                $tineScriptRunLogStatusRef.Properties.Add( 'user_id', [System.Guid]$userId)
                $tineScriptRunLogStatusRef.Properties.Add( 'date_time', [System.DateTime]$dateTime)

                $script:tableTineScriptRunLogStatusRef.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Insert($tineScriptRunLogStatusRef)) | Out-Null
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
    if ($tineScriptRunLogStatusRef) { try { Remove-Variable -Scope:Script -Name tineScriptRunLogStatusRef } catch {}}
    if ($script:tableTineScriptRunLogStatusRef) { try { Remove-Variable -Scope:Script -Name tableTineScriptRunLogStatusRef } catch {}}
    if ($script:storageContext) { try { Remove-Variable -Scope:Script -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'fetch from tine_script_run_log_status_ref'
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
                $script:tableTineScriptRunLogStatusRef = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunLogStatusRef' -ErrorAction SilentlyContinue
            }

            if ( $script:tableTineScriptRunLogStatusRef -eq $null -and !$whatIf ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_log_status_ref table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_script_run_log_status_rcd' )
                $script:list.Add( 'tine_script_run_log_status_ref_partition_key' )
                $script:list.Add( 'tine_script_run_log_status_ref_row_key' )
                $script:list.Add( 'tine_script_run_log_status_name' )
                $script:list.Add( 'user_id' )
                $script:list.Add( 'date_time' )

                # filter tineScriptRunLogStatusRcd ( primary key )
                if ($PSBoundParameters.ContainsKey('tineScriptRunLogStatusRcd')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_script_run_log_status_rcd eq '''+ $tineScriptRunLogStatusRcd + ''''
                }

                # filter tineScriptRunLogStatusRefPartitionKey ( string column )
                if ($PSBoundParameters.ContainsKey('tineScriptRunLogStatusRefPartitionKey')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_script_run_log_status_ref_partition_key eq '''+ $tineScriptRunLogStatusRefPartitionKey + ''''
                }

                # filter tineScriptRunLogStatusRefRowKey ( string column )
                if ($PSBoundParameters.ContainsKey('tineScriptRunLogStatusRefRowKey')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_script_run_log_status_ref_row_key eq '''+ $tineScriptRunLogStatusRefRowKey + ''''
                }

                # filter tineScriptRunLogStatusName ( string column )
                if ($PSBoundParameters.ContainsKey('tineScriptRunLogStatusName')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_script_run_log_status_name eq '''+ $tineScriptRunLogStatusName + ''''
                }

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptRunLogStatusRef = $script:tableTineScriptRunLogStatusRef.CloudTable.ExecuteQuery($script:query)
                }

                # log count
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'Query Results' + ';' + ' ' + '[' + ($tineScriptRunLogStatusRef | Measure-Object).Count + ']'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }

                # transfer values from query to internal objects
                if ($script:tineScriptRunLogStatusRefData) { try { Remove-Variable -Scope:Script -Name tineScriptRunLogStatusRefData } catch {}}
                if ($script:tineScriptRunLogStatusRefDataList) { try { Remove-Variable -Scope:Script -Name tineScriptRunLogStatusRefDataList } catch {}}

                $script:tineScriptRunLogStatusRefDataList = @()

                if (-not [string]::IsNullOrEmpty($tineScriptRunLogStatusRef)) {
                    foreach ($entity in $tineScriptRunLogStatusRef) {
                        $script:tineScriptRunLogStatusRefData = [TineScriptRunLogStatusRefData]::new()
                        $script:tineScriptRunLogStatusRefData.tineScriptRunLogStatusRefPartitionKey = $env:ComputerName
                        $script:tineScriptRunLogStatusRefData.tineScriptRunLogStatusRefRowKey = [System.DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ss.fffZ')

                        $entity.Properties.Keys | 
                            ForEach-Object {
                                switch ($_) {
                                    'tine_script_run_log_status_rcd' { $script:tineScriptRunLogStatusRefData.tineScriptRunLogStatusRcd = $entity.Properties[$_].PropertyAsObject }
                                    'tine_script_run_log_status_name' { $script:tineScriptRunLogStatusRefData.tineScriptRunLogStatusName = $entity.Properties[$_].PropertyAsObject }
                                    'user_id' { $script:tineScriptRunLogStatusRefData.userId = $entity.Properties[$_].PropertyAsObject }
                                    'date_time' { $script:tineScriptRunLogStatusRefData.dateTime = $entity.Properties[$_].PropertyAsObject }
                                }
                            }
                        $script:tineScriptRunLogStatusRefDataList += $script:tineScriptRunLogStatusRefData
                    }
                }

                # check if any column parameter is chosen
                [boolean] $includeAll = $true
                foreach ($parameter in $PSBoundParameters.Keys) {
                    $includeAll -= ($parameter -eq 'tineScriptRunLogStatusRcd')
                    $includeAll -= ($parameter -eq 'tineScriptRunLogStatusRefPartitionKey')
                    $includeAll -= ($parameter -eq 'tineScriptRunLogStatusRefRowKey')
                    $includeAll -= ($parameter -eq 'tineScriptRunLogStatusName')
                    $includeAll -= ($parameter -eq 'userId')
                    $includeAll -= ($parameter -eq 'dateTime')
                }

                # property echo
                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineScriptRunLogStatusRcd') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineScriptRunLogStatusRcd' + '; [' + $tineScriptRunLogStatusRefData.tineScriptRunLogStatusRcd + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineScriptRunLogStatusRefPartitionKey') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineScriptRunLogStatusRefPartitionKey' + '; [' + $tineScriptRunLogStatusRefData.tineScriptRunLogStatusRefPartitionKey + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineScriptRunLogStatusRefRowKey') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineScriptRunLogStatusRefRowKey' + '; [' + $tineScriptRunLogStatusRefData.tineScriptRunLogStatusRefRowKey + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineScriptRunLogStatusName') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineScriptRunLogStatusName' + '; [' + $tineScriptRunLogStatusRefData.tineScriptRunLogStatusName + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('userId') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'userId' + '; [' + $tineScriptRunLogStatusRefData.userId + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('dateTime') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'dateTime' + '; [' + $tineScriptRunLogStatusRefData.dateTime + ']'
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
    if ($tineScriptRunLogStatusRef) { try { Remove-Variable -Scope:Script -Name tineScriptRunLogStatusRef } catch {}}
    if ($script:tableTineScriptRunLogStatusRef) { try { Remove-Variable -Scope:Script -Name tableTineScriptRunLogStatusRef } catch {}}
    if ($script:storageContext) { try { Remove-Variable -Scope:Script -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'update tine_script_run_log_status_ref'
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
                $script:tableTineScriptRunLogStatusRef = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunLogStatusRef' -ErrorAction SilentlyContinue
            }

            if ( $script:tableTineScriptRunLogStatusRef -eq $null -and !$whatIf ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_log_status_ref table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]


                $script:query.FilterString = 'tine_script_run_log_status_rcd eq '''+ $tineScriptRunLogStatusRcd + ''''
                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptRunLogStatusRefForUpdate = $script:tableTineScriptRunLogStatusRef.CloudTable.ExecuteQuery($script:query)
                }

                foreach ( $item in $tineScriptRunLogStatusRefForUpdate ) {
                    [string] $partitionKeyLocal = $item.PartitionKey
                    [string] $rowKeyLocal = $item.RowKey

                    # change task value
                    [Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity] $tineScriptRunLogStatusRef = `
                        New-Object 'Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity' $partitionKeyLocal, $rowKeyLocal

                    $tineScriptRunLogStatusRef.ETag = '*'
                    if ($PSBoundParameters.ContainsKey('tineScriptRunLogStatusRcd')) { $tineScriptRunLogStatusRef.Properties.Add( 'tine_script_run_log_status_rcd', [System.String]$tineScriptRunLogStatusRcd) }
                    if ($PSBoundParameters.ContainsKey('tineScriptRunLogStatusRefPartitionKey')) { $tineScriptRunLogStatusRef.Properties.Add( 'tine_script_run_log_status_ref_partition_key', [System.String]$tineScriptRunLogStatusRefPartitionKey) }
                    if ($PSBoundParameters.ContainsKey('tineScriptRunLogStatusRefRowKey')) { $tineScriptRunLogStatusRef.Properties.Add( 'tine_script_run_log_status_ref_row_key', [System.String]$tineScriptRunLogStatusRefRowKey) }
                    if ($PSBoundParameters.ContainsKey('tineScriptRunLogStatusName')) { $tineScriptRunLogStatusRef.Properties.Add( 'tine_script_run_log_status_name', [System.String]$tineScriptRunLogStatusName) }
                    if ($PSBoundParameters.ContainsKey('userId')) { $tineScriptRunLogStatusRef.Properties.Add( 'user_id', [System.Guid]$userId) }
                    if ($PSBoundParameters.ContainsKey('dateTime')) { $tineScriptRunLogStatusRef.Properties.Add( 'date_time', [System.DateTime]$dateTime) }

                    $script:tableTineScriptRunLogStatusRef.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Merge($tineScriptRunLogStatusRef)) | Out-Null
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
    if ($tineScriptRunLogStatusRefForUpdate) { try { Remove-Variable -Scope:Script -Name tineScriptRunLogStatusRefForUpdate } catch {}}
    if ($script:tableTineScriptRunLogStatusRef) { try { Remove-Variable -Scope:Script -Name tableTineScriptRunLogStatusRef } catch {}}
    if ($partitionKeyLocal) { try { Remove-Variable -Scope:Script -Name partitionKeyLocal } catch {}}
    if ($rowKeyLocal) { try { Remove-Variable -Scope:Script -Name rowKeyLocal } catch {}}
    if ($tineScriptRunLogStatusRef) { try { Remove-Variable -Scope:Script -Name tineScriptRunLogStatusRef } catch {}}
    if ($script:list) { try { Remove-Variable -Scope:Script -Name list } catch {}}
    if ($script:query) { try { Remove-Variable -Scope:Script -Name query } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'update tine_script_run_log_status_ref by foreign keys'
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
                $script:tableTineScriptRunLogStatusRef = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunLogStatusRef' -ErrorAction SilentlyContinue
            }

            if ( $script:tableTineScriptRunLogStatusRef -eq $null -and !$whatIf ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_log_status_ref table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_script_run_log_status_rcd' )
                $script:list.Add( 'tine_script_run_log_status_ref_partition_key' )
                $script:list.Add( 'tine_script_run_log_status_ref_row_key' )
                $script:list.Add( 'tine_script_run_log_status_name' )
                $script:list.Add( 'user_id' )
                $script:list.Add( 'date_time' )

                # filter tineScriptRunLogStatusRcd ( primary key )
                if ($PSBoundParameters.ContainsKey('tineScriptRunLogStatusRcd')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_script_run_log_status_rcd eq '''+ $tineScriptRunLogStatusRcd + ''''
                }

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptRunLogStatusRefForUpdate = $script:tableTineScriptRunLogStatusRef.CloudTable.ExecuteQuery($script:query)
                }

                foreach ( $item in $tineScriptRunLogStatusRefForUpdate ) {
                    [string] $partitionKeyLocal = $item.PartitionKey
                    [string] $rowKeyLocal = $item.RowKey

                    # change task value
                    [Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity] $tineScriptRunLogStatusRef = `
                        New-Object 'Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity' $partitionKeyLocal, $rowKeyLocal

                    $tineScriptRunLogStatusRef.ETag = '*'
                    if ($PSBoundParameters.ContainsKey('tineScriptRunLogStatusRcd')) { $tineScriptRunLogStatusRef.Properties.Add( 'tine_script_run_log_status_rcd', [System.String]$tineScriptRunLogStatusRcd) }
                    if ($PSBoundParameters.ContainsKey('tineScriptRunLogStatusRefPartitionKey')) { $tineScriptRunLogStatusRef.Properties.Add( 'tine_script_run_log_status_ref_partition_key', [System.String]$tineScriptRunLogStatusRefPartitionKey) }
                    if ($PSBoundParameters.ContainsKey('tineScriptRunLogStatusRefRowKey')) { $tineScriptRunLogStatusRef.Properties.Add( 'tine_script_run_log_status_ref_row_key', [System.String]$tineScriptRunLogStatusRefRowKey) }
                    if ($PSBoundParameters.ContainsKey('tineScriptRunLogStatusName')) { $tineScriptRunLogStatusRef.Properties.Add( 'tine_script_run_log_status_name', [System.String]$tineScriptRunLogStatusName) }
                    if ($PSBoundParameters.ContainsKey('userId')) { $tineScriptRunLogStatusRef.Properties.Add( 'user_id', [System.Guid]$userId) }
                    if ($PSBoundParameters.ContainsKey('dateTime')) { $tineScriptRunLogStatusRef.Properties.Add( 'date_time', [System.DateTime]$dateTime) }

                    $script:tableTineScriptRunLogStatusRef.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Merge($tineScriptRunLogStatusRef)) | Out-Null
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
    if ($tineScriptRunLogStatusRefForUpdate) { try { Remove-Variable -Scope:Script -Name tineScriptRunLogStatusRefForUpdate } catch {}}
    if ($script:tableTineScriptRunLogStatusRef) { try { Remove-Variable -Scope:Script -Name tableTineScriptRunLogStatusRef } catch {}}
    if ($partitionKeyLocal) { try { Remove-Variable -Scope:Script -Name partitionKeyLocal } catch {}}
    if ($rowKeyLocal) { try { Remove-Variable -Scope:Script -Name rowKeyLocal } catch {}}
    if ($tineScriptRunLogStatusRef) { try { Remove-Variable -Scope:Script -Name tineScriptRunLogStatusRef } catch {}}
    if ($script:list) { try { Remove-Variable -Scope:Script -Name list } catch {}}
    if ($script:query) { try { Remove-Variable -Scope:Script -Name query } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'delete from tine_script_run_log_status_ref'
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

            $script:tableTineScriptRunLogStatusRef = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunLogStatusRef' -ErrorAction SilentlyContinue

            if ( $script:tableTineScriptRunLogStatusRef -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_log_status_ref table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_script_run_log_status_rcd' )

                $script:query.FilterString = 'tine_script_run_log_status_rcd eq '''+ $tineScriptRunLogStatusRcd + ''''
                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptRunLogStatusRefForDelete = $script:tableTineScriptRunLogStatusRef.CloudTable.ExecuteQuery($script:query)
                }

                # delete selected rows
                foreach ( $tineScriptRunLogStatusRefItem in $tineScriptRunLogStatusRefForDelete ) {
                    $script:tableTineScriptRunLogStatusRef.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Delete($tineScriptRunLogStatusRefItem)) | Out-Null
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
    if ($tineScriptRunLogStatusRefForDelete) { try { Remove-Variable -Scope:Script -Name tineScriptRunLogStatusRefForDelete } catch {}}
    if ($tineScriptRunLogStatusRefItem) { try { Remove-Variable -Scope:Script -Name tineScriptRunLogStatusRefItem } catch {}}
    if ($script:tableTineScriptRunLogStatusRef) { try { Remove-Variable -Scope:Script -Name tableTineScriptRunLogStatusRef } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'fetch value from tine_script_run_log_status_ref'
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
                $script:tableTineScriptRunLogStatusRef = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunLogStatusRef' -ErrorAction SilentlyContinue
            }

            if ( $script:tableTineScriptRunLogStatusRef -eq $null -and !$whatIf ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_log_status_ref table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( $fetchValue )

                # filter tineScriptRunLogStatusRcd ( primary key )
                if ($PSBoundParameters.ContainsKey('tineScriptRunLogStatusRcd')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_script_run_log_status_rcd eq '''+ $tineScriptRunLogStatusRcd + ''''
                }

                # filter tineScriptRunLogStatusRefPartitionKey ( string column )
                if ($PSBoundParameters.ContainsKey('tineScriptRunLogStatusRefPartitionKey')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_script_run_log_status_ref_partition_key eq '''+ $tineScriptRunLogStatusRefPartitionKey + ''''
                }

                # filter tineScriptRunLogStatusRefRowKey ( string column )
                if ($PSBoundParameters.ContainsKey('tineScriptRunLogStatusRefRowKey')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_script_run_log_status_ref_row_key eq '''+ $tineScriptRunLogStatusRefRowKey + ''''
                }

                # filter tineScriptRunLogStatusName ( string column )
                if ($PSBoundParameters.ContainsKey('tineScriptRunLogStatusName')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                        $script:query.FilterString += 'tine_script_run_log_status_name eq '''+ $tineScriptRunLogStatusName + ''''
                }

                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + $script:query.FilterString
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptRunLogStatusRef = $script:tableTineScriptRunLogStatusRef.CloudTable.ExecuteQuery($script:query)
                }

                # get value
                [string] $outValue = ''
                if (($tineScriptRunLogStatusRef | Measure-Object).Count -gt 0) {
                    $outValue = $tineScriptRunLogStatusRef[0].Properties[$fetchValue].PropertyAsObject

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
    if ($tineScriptRunLogStatusRef) { try { Remove-Variable -Scope:Script -Name tineScriptRunLogStatusRef } catch {}}
    if ($script:tableTineScriptRunLogStatusRef) { try { Remove-Variable -Scope:Script -Name tableTineScriptRunLogStatusRef } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'delete all from tine_script_run_log_status_ref'
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

            $script:tableTineScriptRunLogStatusRef = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunLogStatusRef' -ErrorAction SilentlyContinue

            if ( $script:tableTineScriptRunLogStatusRef -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_log_status_ref table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_script_run_log_status_rcd' )

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptRunLogStatusRefForDelete = $script:tableTineScriptRunLogStatusRef.CloudTable.ExecuteQuery($script:query)
                }

                # delete selected rows
                foreach ( $tineScriptRunLogStatusRefItem in $tineScriptRunLogStatusRefForDelete ) {
                    $script:tableTineScriptRunLogStatusRef.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Delete($tineScriptRunLogStatusRefItem)) | Out-Null
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
    if ($tineScriptRunLogStatusRefForDelete) { try { Remove-Variable -Scope:Script -Name tineScriptRunLogStatusRefForDelete } catch {}}
    if ($tineScriptRunLogStatusRefItem) { try { Remove-Variable -Scope:Script -Name tineScriptRunLogStatusRefItem } catch {}}
    if ($script:tableTineScriptRunLogStatusRef) { try { Remove-Variable -Scope:Script -Name tableTineScriptRunLogStatusRef } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'show tine_script_run_log_status_ref'
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

            $script:tableTineScriptRunLogStatusRef = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunLogStatusRef' -ErrorAction SilentlyContinue

            if ( $script:tableTineScriptRunLogStatusRef -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_log_status_ref table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_script_run_log_status_rcd' )
                $script:list.Add( 'tine_script_run_log_status_ref_partition_key' )
                $script:list.Add( 'tine_script_run_log_status_ref_row_key' )
                $script:list.Add( 'tine_script_run_log_status_name' )
                $script:list.Add( 'user_id' )
                $script:list.Add( 'date_time' )

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptRunLogStatusRef = $script:tableTineScriptRunLogStatusRef.CloudTable.ExecuteQuery($script:query)
                }

                # echo
                [string] $script:output = ''
                $script:output = $tineScriptRunLogStatusRef `
                    | Format-Table PartitionKey, RowKey, `
                    @{ Label = 'Tine Script Run Log Status'; Expression={$_.Properties['tine_script_run_log_status_rcd'].StringValue} },`
                    @{ Label = 'Tine Script Run Log Status Ref Partition Key'; Expression={$_.Properties['tine_script_run_log_status_ref_partition_key'].StringValue} },`
                    @{ Label = 'Tine Script Run Log Status Ref Row Key'; Expression={$_.Properties['tine_script_run_log_status_ref_row_key'].StringValue} },`
                    @{ Label = 'Tine Script Run Log Status Name'; Expression={$_.Properties['tine_script_run_log_status_name'].StringValue} },`
                    @{ Label = 'User Id'; Expression={$_.Properties['user_id'].GuidValue} },`
                    @{ Label = 'Date Time'; Expression={$_.Properties['date_time'].StringValue} } `
                    -AutoSize `
                    | Out-String;

                # log
                if ($script:output -ne '') {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + $script:output
                } else {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'no result for ' + 'tine_script_run_log_status_ref' #+ ': ' + $script:query.FilterString
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
    if ($tineScriptRunLogStatusRef) { try { Remove-Variable -Scope:Script -Name tineScriptRunLogStatusRef } catch {}}
    if ($script:tableTineScriptRunLogStatusRef) { try { Remove-Variable -Scope:Script -Name tableTineScriptRunLogStatusRef } catch {}}
    if ($script:storageContext) { try { Remove-Variable -Scope:Script -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'drop tine_script_run_log_status_ref'
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

            $script:tableTineScriptRunLogStatusRef = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunLogStatusRef' -ErrorAction SilentlyContinue

            if ( $script:tableTineScriptRunLogStatusRef -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_run_log_status_ref table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                Remove-AzureStorageTable -Context $script:storageContext -Name 'tineScriptRunLogStatusRef' -Force
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
    if ($script:tableTineScriptRunLogStatusRef) { try { Remove-Variable -Scope:Script -Name tableTineScriptRunLogStatusRef } catch {}}
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
if ($script:tineScriptRunLogStatusRefData) { try { Remove-Variable -Scope:Script -Name tineScriptRunLogStatusRefData } catch {} }

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
    ConvertTo-Json -InputObject $script:tineScriptRunLogStatusRefDataList
}

if ($returnObject) {
    $script:tineScriptRunLogStatusRefDataList
}

if ($returnGridView) {
    $script:tineScriptRunLogStatusRefDataList | Out-GridView
}
