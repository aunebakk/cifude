# SQL2X Generated code based on a SQL Server Schema
# SQL2X Version: 0.d
# http://sql2x.azurewebsites.net/
# Generated Date: 9/30/2018 3:03:36 PM
# Template: sql2x.PowerShellGenerator.CifudeScript
<#
.\tine_script_library.ps1 -doEcho       -doSql2x -comment test -create
.\tine_script_library.ps1 -doEcho       -doSql2x -comment test -insert
.\tine_script_library.ps1 -doEcho       -doSql2x -comment test -fetch                -tineScriptLibraryId:([guid]'')
.\tine_script_library.ps1 -returnValue  -doSql2x -comment test -fetchValue:column    -tineScriptLibraryId:([guid]'')
.\tine_script_library.ps1 -doEcho       -doSql2x -comment test -updateByPrimaryKey   -show -tineScriptLibraryId:([guid]'')
.\tine_script_library.ps1 -doEcho       -doSql2x -comment test -updateByForeignKeys  -show
.\tine_script_library.ps1 -doEcho       -doSql2x -comment test -deleteAll
.\tine_script_library.ps1 -doEcho       -doSql2x -comment test -delete               -tineScriptLibraryId:([guid]'')
.\tine_script_library.ps1 -doEcho       -doSql2x -comment test -drop
.\tine_script_library.ps1 -doEcho       -doSql2x -comment test -show
.\tine_script_library.ps1 -doEcho       -doSql2x -comment test -help
.\tine_script_library.ps1 -doEcho       -doSql2x -comment test -create -insert -fetch -fetchValue:column -updateByPrimaryKey -delete -drop -show -help -tineScriptLibraryId:([guid]'')
#>
[Diagnostics.CodeAnalysis.SuppressMessageAttribute `
    ('PSPossibleIncorrectComparisonWithNull','')]
param(
    [string]$scriptName = 'CIFUDE ( Create Insert Fetch Update Delete Extras ) for tine_script_library',
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
    [System.Guid]$tineScriptLibraryId = '00000000-0000-0000-0000-000000000000',
    [System.String]$tineLibraryPartitionKey = $env:ComputerName,
    [System.String]$tineLibraryRowKey = [System.DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ss.fffZ'),
    [System.String]$tineScriptReadinessStateRcd = '',
    [System.String]$tineLibraryScriptName = '',
    [System.String]$tineLibraryScriptFileName = '',
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
# Generated Date: 9/30/2018 3:03:36 PM
# Template: sql2x.PowerShellGenerator.CifudeScript
<#
.\tine_script_library.ps1 -doEcho       -doSql2x -comment test -create
.\tine_script_library.ps1 -doEcho       -doSql2x -comment test -insert
.\tine_script_library.ps1 -doEcho       -doSql2x -comment test -fetch                -tineScriptLibraryId:([guid]'')
.\tine_script_library.ps1 -returnValue  -doSql2x -comment test -fetchValue:column    -tineScriptLibraryId:([guid]'')
.\tine_script_library.ps1 -doEcho       -doSql2x -comment test -updateByPrimaryKey   -show -tineScriptLibraryId:([guid]'')
.\tine_script_library.ps1 -doEcho       -doSql2x -comment test -updateByForeignKeys  -show
.\tine_script_library.ps1 -doEcho       -doSql2x -comment test -deleteAll
.\tine_script_library.ps1 -doEcho       -doSql2x -comment test -delete               -tineScriptLibraryId:([guid]'')
.\tine_script_library.ps1 -doEcho       -doSql2x -comment test -drop
.\tine_script_library.ps1 -doEcho       -doSql2x -comment test -show
.\tine_script_library.ps1 -doEcho       -doSql2x -comment test -help
.\tine_script_library.ps1 -doEcho       -doSql2x -comment test -create -insert -fetch -fetchValue:column -updateByPrimaryKey -delete -drop -show -help -tineScriptLibraryId:([guid]'')
#>"
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ('storageConnectionString' + ' ' + '=' + ' ' + '[' + $script:storageConnectionString + ']')
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.Guid] tineScriptLibraryId = '00000000-0000-0000-0000-000000000000'")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.String] tineLibraryPartitionKey = $env:ComputerName")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.String] tineLibraryRowKey = [System.DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ss.fffZ')")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.String] tineScriptReadinessStateRcd = ''")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.String] tineLibraryScriptName = ''")
        $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
        if (!$returnHtml) { Write-Host $script:taskLine }

        $script:taskLine = ("[System.String] tineLibraryScriptFileName = ''")
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
class TineScriptLibraryData {
    [System.Guid]$tineScriptLibraryId = '00000000-0000-0000-0000-000000000000'
    [System.String]$tineLibraryPartitionKey = $env:ComputerName
    [System.String]$tineLibraryRowKey = [System.DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ss.fffZ')
    [System.String]$tineScriptReadinessStateRcd = ''
    [System.String]$tineLibraryScriptName = ''
    [System.String]$tineLibraryScriptFileName = ''
    [System.Guid]$userId = '00000000-0000-0000-0000-000000000000'
    [System.DateTime]$dateTime = '1601.01.01T00:00:00Z'
}
#endregion
##################################################################################################################
$script:taskName = 'create tine_script_library'
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

            $script:tableTineScriptLibrary = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptLibrary' -ErrorAction SilentlyContinue

            if ( $script:tableTineScriptLibrary -ne $null ) {
                Remove-AzureStorageTable -Context $script:storageContext -Name 'tineScriptLibrary' -Force
            }

            [int] $script:trials = 0

            # create new table
            $script:tableTineScriptLibrary = $null
            while ($script:tableTineScriptLibrary -eq $null) {
                # wait for an escalating number of seconds 
                $script:trials++
                if ($script:trials -gt 10) {
                    throw [Exception] ('Failed to create table')
                }

                Start-Sleep $script:trials

                # create new table
                $script:tableTineScriptLibrary = `
                    New-AzureStorageTable `
                        -Context $script:storageContext `
                        -Name 'tineScriptLibrary'

                if ( $script:tableTineScriptLibrary -ne $null ) {
                    # insert row
                    $tineScriptLibrary = 
                        New-Object `
                            -TypeName Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity `
                            -ArgumentList $tineLibraryPartitionKey, $tineLibraryRowKey

                    $tineScriptLibrary.Properties.Add( 'tine_script_library_id', [System.Guid]$tineScriptLibraryId)
                    $tineScriptLibrary.Properties.Add( 'tine_library_partition_key', [System.String]$tineLibraryPartitionKey)
                    $tineScriptLibrary.Properties.Add( 'tine_library_row_key', [System.String]$tineLibraryRowKey)
                    $tineScriptLibrary.Properties.Add( 'tine_script_readiness_state_rcd', [System.String]$tineScriptReadinessStateRcd)
                    $tineScriptLibrary.Properties.Add( 'tine_library_script_name', [System.String]$tineLibraryScriptName)
                    $tineScriptLibrary.Properties.Add( 'tine_library_script_file_name', [System.String]$tineLibraryScriptFileName)
                    $tineScriptLibrary.Properties.Add( 'user_id', [System.Guid]$userId)
                    $tineScriptLibrary.Properties.Add( 'date_time', [System.DateTime]$dateTime)

                    $script:tableTineScriptLibrary.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Insert($tineScriptLibrary)) | Out-Null
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
    if ($script:tableTineScriptLibrary) { try { Remove-Variable -Scope:Script -Name tableTineScriptLibrary } catch {}}
    if ($script:storageContext) { try { Remove-Variable -Scope:Script -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'insert to tine_script_library'
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

        # validate tineScriptLibraryId ( primary key )
        if ($tineScriptLibraryId -eq '00000000-0000-0000-0000-000000000000') {
            # get a decent primary key, todo; check datatype
            [System.Guid] $tineScriptLibraryId = [System.Guid]::NewGuid()

            # return primary key to caller
            $script:tineScriptLibraryData = [TineScriptLibraryData]::new()
            $script:tineScriptLibraryData.tineScriptLibraryId = $tineScriptLibraryId
            $script:tineScriptLibraryDataList += $script:tineScriptLibraryData
        }

        # validate tineScriptReadinessStateRcd ( foreign key )
        if ($tineScriptReadinessStateRcd -eq '') {
            # log
            $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'Foreign Key:' + ' ' + 'tineScriptReadinessStateRcd' + ' ' + 'is missing'
            $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
            if ($doEcho) { Write-Host ( $script:taskLine ) -ForegroundColor red }
            $script:answer = 'no'
        }

        # validate tineLibraryScriptName ( not empty )
        if ($tineLibraryScriptName -eq '') {
            # log
            $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'Column:' + ' ' + 'tineLibraryScriptName' + ' ' + 'is empty'
            $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
            if ($doEcho) { Write-Host ( $script:taskLine ) -ForegroundColor red }
            $script:answer = 'no'
        }

        # validate tineLibraryScriptFileName ( not empty )
        if ($tineLibraryScriptFileName -eq '') {
            # log
            $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'Column:' + ' ' + 'tineLibraryScriptFileName' + ' ' + 'is empty'
            $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
            if ($doEcho) { Write-Host ( $script:taskLine ) -ForegroundColor red }
            $script:answer = 'no'
        }

        if ($script:answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {

            # connect and validate table
            $script:storageContext = New-AzureStorageContext -ConnectionString $script:storageConnectionString

            $script:tableTineScriptLibrary = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptLibrary' -ErrorAction SilentlyContinue

            if ( $script:tableTineScriptLibrary -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_library table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # insert row
                $tineScriptLibrary =
                    New-Object `
                        -TypeName Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity `
                        -ArgumentList $tineLibraryPartitionKey, $tineLibraryRowKey

                $tineScriptLibrary.Properties.Add( 'tine_script_library_id', [System.Guid]$tineScriptLibraryId)
                $tineScriptLibrary.Properties.Add( 'tine_library_partition_key', [System.String]$tineLibraryPartitionKey)
                $tineScriptLibrary.Properties.Add( 'tine_library_row_key', [System.String]$tineLibraryRowKey)
                $tineScriptLibrary.Properties.Add( 'tine_script_readiness_state_rcd', [System.String]$tineScriptReadinessStateRcd)
                $tineScriptLibrary.Properties.Add( 'tine_library_script_name', [System.String]$tineLibraryScriptName)
                $tineScriptLibrary.Properties.Add( 'tine_library_script_file_name', [System.String]$tineLibraryScriptFileName)
                $tineScriptLibrary.Properties.Add( 'user_id', [System.Guid]$userId)
                $tineScriptLibrary.Properties.Add( 'date_time', [System.DateTime]$dateTime)

                $script:tableTineScriptLibrary.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Insert($tineScriptLibrary)) | Out-Null
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
    if ($tineScriptLibrary) { try { Remove-Variable -Scope:Script -Name tineScriptLibrary } catch {}}
    if ($script:tableTineScriptLibrary) { try { Remove-Variable -Scope:Script -Name tableTineScriptLibrary } catch {}}
    if ($script:storageContext) { try { Remove-Variable -Scope:Script -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'fetch from tine_script_library'
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
                $script:tableTineScriptLibrary = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptLibrary' -ErrorAction SilentlyContinue
            }

            if ( $script:tableTineScriptLibrary -eq $null -and !$whatIf ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_library table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_script_library_id' )
                $script:list.Add( 'tine_library_partition_key' )
                $script:list.Add( 'tine_library_row_key' )
                $script:list.Add( 'tine_script_readiness_state_rcd' )
                $script:list.Add( 'tine_library_script_name' )
                $script:list.Add( 'tine_library_script_file_name' )
                $script:list.Add( 'user_id' )
                $script:list.Add( 'date_time' )

                # filter tineScriptLibraryId ( primary key )
                if ($PSBoundParameters.ContainsKey('tineScriptLibraryId')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_script_library_id eq guid'''+ $tineScriptLibraryId + ''''
                }

                # filter tineScriptReadinessStateRcd ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineScriptReadinessStateRcd')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_script_readiness_state_rcd eq '''+ $tineScriptReadinessStateRcd + ''''
                }

                # filter tineLibraryPartitionKey ( string column )
                if ($PSBoundParameters.ContainsKey('tineLibraryPartitionKey')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_library_partition_key eq '''+ $tineLibraryPartitionKey + ''''
                }

                # filter tineLibraryRowKey ( string column )
                if ($PSBoundParameters.ContainsKey('tineLibraryRowKey')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_library_row_key eq '''+ $tineLibraryRowKey + ''''
                }

                # filter tineScriptReadinessStateRcd ( string column )
                if ($PSBoundParameters.ContainsKey('tineScriptReadinessStateRcd')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_script_readiness_state_rcd eq '''+ $tineScriptReadinessStateRcd + ''''
                }

                # filter tineLibraryScriptName ( string column )
                if ($PSBoundParameters.ContainsKey('tineLibraryScriptName')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_library_script_name eq '''+ $tineLibraryScriptName + ''''
                }

                # filter tineLibraryScriptFileName ( string column )
                if ($PSBoundParameters.ContainsKey('tineLibraryScriptFileName')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_library_script_file_name eq '''+ $tineLibraryScriptFileName + ''''
                }

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptLibrary = $script:tableTineScriptLibrary.CloudTable.ExecuteQuery($script:query)
                }

                # log count
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'Query Results' + ';' + ' ' + '[' + ($tineScriptLibrary | Measure-Object).Count + ']'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }

                # transfer values from query to internal objects
                if ($script:tineScriptLibraryData) { try { Remove-Variable -Scope:Script -Name tineScriptLibraryData } catch {}}
                if ($script:tineScriptLibraryDataList) { try { Remove-Variable -Scope:Script -Name tineScriptLibraryDataList } catch {}}

                $script:tineScriptLibraryDataList = @()

                if (-not [string]::IsNullOrEmpty($tineScriptLibrary)) {
                    foreach ($entity in $tineScriptLibrary) {
                        $script:tineScriptLibraryData = [TineScriptLibraryData]::new()
                        $script:tineScriptLibraryData.tineLibraryPartitionKey = $env:ComputerName
                        $script:tineScriptLibraryData.tineLibraryRowKey = [System.DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ss.fffZ')

                        $entity.Properties.Keys | 
                            ForEach-Object {
                                switch ($_) {
                                    'tine_script_library_id' { $script:tineScriptLibraryData.tineScriptLibraryId = $entity.Properties[$_].PropertyAsObject }
                                    'tine_script_readiness_state_rcd' { $script:tineScriptLibraryData.tineScriptReadinessStateRcd = $entity.Properties[$_].PropertyAsObject }
                                    'tine_library_script_name' { $script:tineScriptLibraryData.tineLibraryScriptName = $entity.Properties[$_].PropertyAsObject }
                                    'tine_library_script_file_name' { $script:tineScriptLibraryData.tineLibraryScriptFileName = $entity.Properties[$_].PropertyAsObject }
                                    'user_id' { $script:tineScriptLibraryData.userId = $entity.Properties[$_].PropertyAsObject }
                                    'date_time' { $script:tineScriptLibraryData.dateTime = $entity.Properties[$_].PropertyAsObject }
                                }
                            }
                        $script:tineScriptLibraryDataList += $script:tineScriptLibraryData
                    }
                }

                # check if any column parameter is chosen
                [boolean] $includeAll = $true
                foreach ($parameter in $PSBoundParameters.Keys) {
                    $includeAll -= ($parameter -eq 'tineScriptLibraryId')
                    $includeAll -= ($parameter -eq 'tineLibraryPartitionKey')
                    $includeAll -= ($parameter -eq 'tineLibraryRowKey')
                    $includeAll -= ($parameter -eq 'tineScriptReadinessStateRcd')
                    $includeAll -= ($parameter -eq 'tineLibraryScriptName')
                    $includeAll -= ($parameter -eq 'tineLibraryScriptFileName')
                    $includeAll -= ($parameter -eq 'userId')
                    $includeAll -= ($parameter -eq 'dateTime')
                }

                # property echo
                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineScriptLibraryId') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineScriptLibraryId' + '; [' + $tineScriptLibraryData.tineScriptLibraryId + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineLibraryPartitionKey') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineLibraryPartitionKey' + '; [' + $tineScriptLibraryData.tineLibraryPartitionKey + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineLibraryRowKey') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineLibraryRowKey' + '; [' + $tineScriptLibraryData.tineLibraryRowKey + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineScriptReadinessStateRcd') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineScriptReadinessStateRcd' + '; [' + $tineScriptLibraryData.tineScriptReadinessStateRcd + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineLibraryScriptName') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineLibraryScriptName' + '; [' + $tineScriptLibraryData.tineLibraryScriptName + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineLibraryScriptFileName') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineLibraryScriptFileName' + '; [' + $tineScriptLibraryData.tineLibraryScriptFileName + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('userId') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'userId' + '; [' + $tineScriptLibraryData.userId + ']'
                    $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $script:taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('dateTime') ) {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'dateTime' + '; [' + $tineScriptLibraryData.dateTime + ']'
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
    if ($tineScriptLibrary) { try { Remove-Variable -Scope:Script -Name tineScriptLibrary } catch {}}
    if ($script:tableTineScriptLibrary) { try { Remove-Variable -Scope:Script -Name tableTineScriptLibrary } catch {}}
    if ($script:storageContext) { try { Remove-Variable -Scope:Script -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'update tine_script_library'
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
                $script:tableTineScriptLibrary = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptLibrary' -ErrorAction SilentlyContinue
            }

            if ( $script:tableTineScriptLibrary -eq $null -and !$whatIf ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_library table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]


                $script:query.FilterString = 'tine_script_library_id eq guid'''+ $tineScriptLibraryId + ''''
                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptLibraryForUpdate = $script:tableTineScriptLibrary.CloudTable.ExecuteQuery($script:query)
                }

                foreach ( $item in $tineScriptLibraryForUpdate ) {
                    [string] $partitionKeyLocal = $item.PartitionKey
                    [string] $rowKeyLocal = $item.RowKey

                    # change task value
                    [Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity] $tineScriptLibrary = `
                        New-Object 'Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity' $partitionKeyLocal, $rowKeyLocal

                    $tineScriptLibrary.ETag = '*'
                    if ($PSBoundParameters.ContainsKey('tineScriptLibraryId')) { $tineScriptLibrary.Properties.Add( 'tine_script_library_id', [System.Guid]$tineScriptLibraryId) }
                    if ($PSBoundParameters.ContainsKey('tineLibraryPartitionKey')) { $tineScriptLibrary.Properties.Add( 'tine_library_partition_key', [System.String]$tineLibraryPartitionKey) }
                    if ($PSBoundParameters.ContainsKey('tineLibraryRowKey')) { $tineScriptLibrary.Properties.Add( 'tine_library_row_key', [System.String]$tineLibraryRowKey) }
                    if ($PSBoundParameters.ContainsKey('tineScriptReadinessStateRcd')) { $tineScriptLibrary.Properties.Add( 'tine_script_readiness_state_rcd', [System.String]$tineScriptReadinessStateRcd) }
                    if ($PSBoundParameters.ContainsKey('tineLibraryScriptName')) { $tineScriptLibrary.Properties.Add( 'tine_library_script_name', [System.String]$tineLibraryScriptName) }
                    if ($PSBoundParameters.ContainsKey('tineLibraryScriptFileName')) { $tineScriptLibrary.Properties.Add( 'tine_library_script_file_name', [System.String]$tineLibraryScriptFileName) }
                    if ($PSBoundParameters.ContainsKey('userId')) { $tineScriptLibrary.Properties.Add( 'user_id', [System.Guid]$userId) }
                    if ($PSBoundParameters.ContainsKey('dateTime')) { $tineScriptLibrary.Properties.Add( 'date_time', [System.DateTime]$dateTime) }

                    $script:tableTineScriptLibrary.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Merge($tineScriptLibrary)) | Out-Null
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
    if ($tineScriptLibraryForUpdate) { try { Remove-Variable -Scope:Script -Name tineScriptLibraryForUpdate } catch {}}
    if ($script:tableTineScriptLibrary) { try { Remove-Variable -Scope:Script -Name tableTineScriptLibrary } catch {}}
    if ($partitionKeyLocal) { try { Remove-Variable -Scope:Script -Name partitionKeyLocal } catch {}}
    if ($rowKeyLocal) { try { Remove-Variable -Scope:Script -Name rowKeyLocal } catch {}}
    if ($tineScriptLibrary) { try { Remove-Variable -Scope:Script -Name tineScriptLibrary } catch {}}
    if ($script:list) { try { Remove-Variable -Scope:Script -Name list } catch {}}
    if ($script:query) { try { Remove-Variable -Scope:Script -Name query } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'update tine_script_library by foreign keys'
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
                $script:tableTineScriptLibrary = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptLibrary' -ErrorAction SilentlyContinue
            }

            if ( $script:tableTineScriptLibrary -eq $null -and !$whatIf ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_library table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_script_library_id' )
                $script:list.Add( 'tine_library_partition_key' )
                $script:list.Add( 'tine_library_row_key' )
                $script:list.Add( 'tine_script_readiness_state_rcd' )
                $script:list.Add( 'tine_library_script_name' )
                $script:list.Add( 'tine_library_script_file_name' )
                $script:list.Add( 'user_id' )
                $script:list.Add( 'date_time' )

                # filter tineScriptLibraryId ( primary key )
                if ($PSBoundParameters.ContainsKey('tineScriptLibraryId')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_script_library_id eq guid'''+ $tineScriptLibraryId + ''''
                }

                # filter tineScriptReadinessStateRcd ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineScriptReadinessStateRcd')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_script_readiness_state_rcd eq '''+ $tineScriptReadinessStateRcd + ''''
                }

                # filter tineLibraryPartitionKey ( string column )
                if ($PSBoundParameters.ContainsKey('tineLibraryPartitionKey')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_library_partition_key eq '''+ $tineLibraryPartitionKey + ''''
                }

                # filter tineLibraryRowKey ( string column )
                if ($PSBoundParameters.ContainsKey('tineLibraryRowKey')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_library_row_key eq '''+ $tineLibraryRowKey + ''''
                }

                # filter tineScriptReadinessStateRcd ( string column )
                if ($PSBoundParameters.ContainsKey('tineScriptReadinessStateRcd')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_script_readiness_state_rcd eq '''+ $tineScriptReadinessStateRcd + ''''
                }

                # filter tineLibraryScriptName ( string column )
                if ($PSBoundParameters.ContainsKey('tineLibraryScriptName')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_library_script_name eq '''+ $tineLibraryScriptName + ''''
                }

                # filter tineLibraryScriptFileName ( string column )
                if ($PSBoundParameters.ContainsKey('tineLibraryScriptFileName')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_library_script_file_name eq '''+ $tineLibraryScriptFileName + ''''
                }

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptLibraryForUpdate = $script:tableTineScriptLibrary.CloudTable.ExecuteQuery($script:query)
                }

                foreach ( $item in $tineScriptLibraryForUpdate ) {
                    [string] $partitionKeyLocal = $item.PartitionKey
                    [string] $rowKeyLocal = $item.RowKey

                    # change task value
                    [Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity] $tineScriptLibrary = `
                        New-Object 'Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity' $partitionKeyLocal, $rowKeyLocal

                    $tineScriptLibrary.ETag = '*'
                    if ($PSBoundParameters.ContainsKey('tineScriptLibraryId')) { $tineScriptLibrary.Properties.Add( 'tine_script_library_id', [System.Guid]$tineScriptLibraryId) }
                    if ($PSBoundParameters.ContainsKey('tineLibraryPartitionKey')) { $tineScriptLibrary.Properties.Add( 'tine_library_partition_key', [System.String]$tineLibraryPartitionKey) }
                    if ($PSBoundParameters.ContainsKey('tineLibraryRowKey')) { $tineScriptLibrary.Properties.Add( 'tine_library_row_key', [System.String]$tineLibraryRowKey) }
                    if ($PSBoundParameters.ContainsKey('tineScriptReadinessStateRcd')) { $tineScriptLibrary.Properties.Add( 'tine_script_readiness_state_rcd', [System.String]$tineScriptReadinessStateRcd) }
                    if ($PSBoundParameters.ContainsKey('tineLibraryScriptName')) { $tineScriptLibrary.Properties.Add( 'tine_library_script_name', [System.String]$tineLibraryScriptName) }
                    if ($PSBoundParameters.ContainsKey('tineLibraryScriptFileName')) { $tineScriptLibrary.Properties.Add( 'tine_library_script_file_name', [System.String]$tineLibraryScriptFileName) }
                    if ($PSBoundParameters.ContainsKey('userId')) { $tineScriptLibrary.Properties.Add( 'user_id', [System.Guid]$userId) }
                    if ($PSBoundParameters.ContainsKey('dateTime')) { $tineScriptLibrary.Properties.Add( 'date_time', [System.DateTime]$dateTime) }

                    $script:tableTineScriptLibrary.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Merge($tineScriptLibrary)) | Out-Null
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
    if ($tineScriptLibraryForUpdate) { try { Remove-Variable -Scope:Script -Name tineScriptLibraryForUpdate } catch {}}
    if ($script:tableTineScriptLibrary) { try { Remove-Variable -Scope:Script -Name tableTineScriptLibrary } catch {}}
    if ($partitionKeyLocal) { try { Remove-Variable -Scope:Script -Name partitionKeyLocal } catch {}}
    if ($rowKeyLocal) { try { Remove-Variable -Scope:Script -Name rowKeyLocal } catch {}}
    if ($tineScriptLibrary) { try { Remove-Variable -Scope:Script -Name tineScriptLibrary } catch {}}
    if ($script:list) { try { Remove-Variable -Scope:Script -Name list } catch {}}
    if ($script:query) { try { Remove-Variable -Scope:Script -Name query } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'delete from tine_script_library'
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

            $script:tableTineScriptLibrary = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptLibrary' -ErrorAction SilentlyContinue

            if ( $script:tableTineScriptLibrary -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_library table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_script_library_id' )

                $script:query.FilterString = 'tine_script_library_id eq guid'''+ $tineScriptLibraryId + ''''
                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptLibraryForDelete = $script:tableTineScriptLibrary.CloudTable.ExecuteQuery($script:query)
                }

                # delete selected rows
                foreach ( $tineScriptLibraryItem in $tineScriptLibraryForDelete ) {
                    $script:tableTineScriptLibrary.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Delete($tineScriptLibraryItem)) | Out-Null
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
    if ($tineScriptLibraryForDelete) { try { Remove-Variable -Scope:Script -Name tineScriptLibraryForDelete } catch {}}
    if ($tineScriptLibraryItem) { try { Remove-Variable -Scope:Script -Name tineScriptLibraryItem } catch {}}
    if ($script:tableTineScriptLibrary) { try { Remove-Variable -Scope:Script -Name tableTineScriptLibrary } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'fetch value from tine_script_library'
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
                $script:tableTineScriptLibrary = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptLibrary' -ErrorAction SilentlyContinue
            }

            if ( $script:tableTineScriptLibrary -eq $null -and !$whatIf ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_library table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( $fetchValue )

                # filter tineScriptLibraryId ( primary key )
                if ($PSBoundParameters.ContainsKey('tineScriptLibraryId')) {
                    if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_script_library_id eq guid'''+ $tineScriptLibraryId + ''''
                }

                # filter tineScriptReadinessStateRcd ( foreign key )
                if ($PSBoundParameters.ContainsKey('tineScriptReadinessStateRcd')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_script_readiness_state_rcd eq '''+ $tineScriptReadinessStateRcd + ''''
                }

                # filter tineLibraryPartitionKey ( string column )
                if ($PSBoundParameters.ContainsKey('tineLibraryPartitionKey')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_library_partition_key eq '''+ $tineLibraryPartitionKey + ''''
                }

                # filter tineLibraryRowKey ( string column )
                if ($PSBoundParameters.ContainsKey('tineLibraryRowKey')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_library_row_key eq '''+ $tineLibraryRowKey + ''''
                }

                # filter tineScriptReadinessStateRcd ( string column )
                if ($PSBoundParameters.ContainsKey('tineScriptReadinessStateRcd')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_script_readiness_state_rcd eq '''+ $tineScriptReadinessStateRcd + ''''
                }

                # filter tineLibraryScriptName ( string column )
                if ($PSBoundParameters.ContainsKey('tineLibraryScriptName')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_library_script_name eq '''+ $tineLibraryScriptName + ''''
                }

                # filter tineLibraryScriptFileName ( string column )
                if ($PSBoundParameters.ContainsKey('tineLibraryScriptFileName')) {
                  if ($script:query.FilterString -ne $null) { $script:query.FilterString += ' and ' }
                    $script:query.FilterString += 'tine_library_script_file_name eq '''+ $tineLibraryScriptFileName + ''''
                }

                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + $script:query.FilterString
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptLibrary = $script:tableTineScriptLibrary.CloudTable.ExecuteQuery($script:query)
                }

                # get value
                [string] $outValue = ''
                if (($tineScriptLibrary | Measure-Object).Count -gt 0) {
                    $outValue = $tineScriptLibrary[0].Properties[$fetchValue].PropertyAsObject

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
    if ($tineScriptLibrary) { try { Remove-Variable -Scope:Script -Name tineScriptLibrary } catch {}}
    if ($script:tableTineScriptLibrary) { try { Remove-Variable -Scope:Script -Name tableTineScriptLibrary } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'delete all from tine_script_library'
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

            $script:tableTineScriptLibrary = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptLibrary' -ErrorAction SilentlyContinue

            if ( $script:tableTineScriptLibrary -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_library table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_script_library_id' )

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptLibraryForDelete = $script:tableTineScriptLibrary.CloudTable.ExecuteQuery($script:query)
                }

                # delete selected rows
                foreach ( $tineScriptLibraryItem in $tineScriptLibraryForDelete ) {
                    $script:tableTineScriptLibrary.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Delete($tineScriptLibraryItem)) | Out-Null
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
    if ($tineScriptLibraryForDelete) { try { Remove-Variable -Scope:Script -Name tineScriptLibraryForDelete } catch {}}
    if ($tineScriptLibraryItem) { try { Remove-Variable -Scope:Script -Name tineScriptLibraryItem } catch {}}
    if ($script:tableTineScriptLibrary) { try { Remove-Variable -Scope:Script -Name tableTineScriptLibrary } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'show tine_script_library'
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

            $script:tableTineScriptLibrary = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptLibrary' -ErrorAction SilentlyContinue

            if ( $script:tableTineScriptLibrary -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_library table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $script:query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $script:list = New-Object System.Collections.Generic.List[string]

                $script:list.Add( 'tine_script_library_id' )
                $script:list.Add( 'tine_library_partition_key' )
                $script:list.Add( 'tine_library_row_key' )
                $script:list.Add( 'tine_script_readiness_state_rcd' )
                $script:list.Add( 'tine_library_script_name' )
                $script:list.Add( 'tine_library_script_file_name' )
                $script:list.Add( 'user_id' )
                $script:list.Add( 'date_time' )

                $script:query.SelectColumns = $script:list
                $script:query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineScriptLibrary = $script:tableTineScriptLibrary.CloudTable.ExecuteQuery($script:query)
                }

                # echo
                [string] $script:output = ''
                $script:output = $tineScriptLibrary `
                    | Format-Table PartitionKey, RowKey, `
                    @{ Label = 'Tine Script Library Id'; Expression={$_.Properties['tine_script_library_id'].GuidValue} },`
                    @{ Label = 'Tine Library Partition Key'; Expression={$_.Properties['tine_library_partition_key'].StringValue} },`
                    @{ Label = 'Tine Library Row Key'; Expression={$_.Properties['tine_library_row_key'].StringValue} },`
                    @{ Label = 'Tine Script Readiness State'; Expression={$_.Properties['tine_script_readiness_state_rcd'].StringValue} },`
                    @{ Label = 'Tine Library Script Name'; Expression={$_.Properties['tine_library_script_name'].StringValue} },`
                    @{ Label = 'Tine Library Script File Name'; Expression={$_.Properties['tine_library_script_file_name'].StringValue} },`
                    @{ Label = 'User Id'; Expression={$_.Properties['user_id'].GuidValue} },`
                    @{ Label = 'Date Time'; Expression={$_.Properties['date_time'].StringValue} } `
                    -AutoSize `
                    | Out-String;

                # log
                if ($script:output -ne '') {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + $script:output
                } else {
                    $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'no result for ' + 'tine_script_library' #+ ': ' + $script:query.FilterString
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
    if ($tineScriptLibrary) { try { Remove-Variable -Scope:Script -Name tineScriptLibrary } catch {}}
    if ($script:tableTineScriptLibrary) { try { Remove-Variable -Scope:Script -Name tableTineScriptLibrary } catch {}}
    if ($script:storageContext) { try { Remove-Variable -Scope:Script -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$script:taskName = 'drop tine_script_library'
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

            $script:tableTineScriptLibrary = Get-AzureStorageTable -Context $script:storageContext -Name 'tineScriptLibrary' -ErrorAction SilentlyContinue

            if ( $script:tableTineScriptLibrary -eq $null ) {
                # log
                $script:taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_script_library table does not exist, please rerun with -create'
                $script:htmlLog = $script:htmlLog + $script:taskLine + '<br>'
                if ($doEcho) { Write-Host ( $script:taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                Remove-AzureStorageTable -Context $script:storageContext -Name 'tineScriptLibrary' -Force
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
    if ($script:tableTineScriptLibrary) { try { Remove-Variable -Scope:Script -Name tableTineScriptLibrary } catch {}}
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
if ($script:tineScriptLibraryData) { try { Remove-Variable -Scope:Script -Name tineScriptLibraryData } catch {} }

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
    ConvertTo-Json -InputObject $script:tineScriptLibraryDataList
}

if ($returnObject) {
    $script:tineScriptLibraryDataList
}

if ($returnGridView) {
    $script:tineScriptLibraryDataList | Out-GridView
}
