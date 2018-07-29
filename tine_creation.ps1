# SQL2X Generated code based on a SQL Server Schema
# SQL2X Version: 0.d
# http://sql2x.azurewebsites.net/
# Generated Date: 7/29/2018 2:50:50 PM
# Template: sql2x.PowerShellGenerator.CifudeScript
#
# .\cifude\tine_creation.ps1 -doEcho       -doSql2x -comment test -create
# .\cifude\tine_creation.ps1 -doEcho       -doSql2x -comment test -insert               -tineCreationId:([guid]'00000000-0000-0000-0000-000000000000')
# .\cifude\tine_creation.ps1 -doEcho       -doSql2x -comment test -fetch                -tineCreationId:([guid]'00000000-0000-0000-0000-000000000000')
# .\cifude\tine_creation.ps1 -returnValue  -doSql2x -comment test -fetchValue:column    -tineCreationId:([guid]'00000000-0000-0000-0000-000000000000')
# .\cifude\tine_creation.ps1 -doEcho       -doSql2x -comment test -updateByPrimaryKey   -tineCreationId:([guid]'00000000-0000-0000-0000-000000000000') -show
# .\cifude\tine_creation.ps1 -doEcho       -doSql2x -comment test -updateByForeignKeys  -show
# .\cifude\tine_creation.ps1 -doEcho       -doSql2x -comment test -deleteAll
# .\cifude\tine_creation.ps1 -doEcho       -doSql2x -comment test -delete               -tineCreationId:([guid]'00000000-0000-0000-0000-000000000000')
# .\cifude\tine_creation.ps1 -doEcho       -doSql2x -comment test -drop
# .\cifude\tine_creation.ps1 -doEcho       -doSql2x -comment test -show
# .\cifude\tine_creation.ps1 -doEcho       -doSql2x -comment test -help
#
# all
# .\cifude\tine_creation.ps1 -doEcho       -doSql2x -comment test -create -insert -fetch -fetchValue:column -update -show -delete -drop -tineCreationId:([guid]'00000000-0000-0000-0000-000000000000')
# [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSPossibleIncorrectComparisonWithNull', Scope='Function', Target='*')]  # because, history!
param (
    [string]$scriptName = 'CIFUDE ( Create Insert Fetch Update Delete Extras ) for tine_creation',
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
    [System.Guid]$tineCreationId = '00000000-0000-0000-0000-000000000000',
    [System.String]$tineCreationBuilderName = '',
    [System.String]$tineCreationDisplayName = '',
    [System.Guid]$userId = '00000000-0000-0000-0000-000000000000',
    [System.DateTime]$dateTime = '1601.01.01T00:00:00Z',
    [System.String]$tineCreationPartitionKeyFixed = $env:ComputerName,
    [System.String]$tineCreationRowKey = [System.DateTime]::UtcNow.ToString('yyyy.MM.ddTHH:mm:ss fffZ')

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

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.Guid] tineCreationId = '00000000-0000-0000-0000-000000000000'")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.String] tineCreationBuilderName = ''")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.String] tineCreationDisplayName = ''")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.Guid] userId = '00000000-0000-0000-0000-000000000000'")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.DateTime] dateTime = '1601.01.01T00:00:00Z'")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.String] tineCreationPartitionKeyFixed = $env:ComputerName")
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host $taskLine }

            $taskLine = ([System.DateTime]::UtcNow.ToString() + ' ' + "[System.String] tineCreationRowKey = [System.DateTime]::UtcNow.ToString('yyyy.MM.ddTHH:mm:ss fffZ')")
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
class TineCreationData {
    [System.Guid]$tineCreationId = '00000000-0000-0000-0000-000000000000'
    [System.String]$tineCreationBuilderName = ''
    [System.String]$tineCreationDisplayName = ''
    [System.Guid]$userId = '00000000-0000-0000-0000-000000000000'
    [System.DateTime]$dateTime = '1601.01.01T00:00:00Z'
    [System.String]$tineCreationPartitionKeyFixed = $env:ComputerName
    [System.String]$tineCreationRowKey = [System.DateTime]::UtcNow.ToString('yyyy.MM.ddTHH:mm:ss fffZ')
}
#endregion
##################################################################################################################
$taskName = 'create tine_creation'
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

            $tableTineCreation = Get-AzureStorageTable -Context $storageContext -Name 'tineCreation' -ErrorAction SilentlyContinue

            if ( $tableTineCreation -ne $null ) {
                Remove-AzureStorageTable -Context $storageContext -Name 'tineCreation' -Force
            }

            # create new table
            $tableTineCreation = $null
            while ($tableTineCreation -eq $null) {
                # wait for an escalating number of seconds 
                $trials++
                if ($trials -gt 10) {
                    throw [Exception] ('Failed to create table')
                }

                Start-Sleep $trials

                # create new table
                $tableTineCreation = `
                    New-AzureStorageTable `
                        -Context $storageContext `
                        -Name 'tineCreation'

                if ( $tableTineCreation -ne $null ) {
                    # insert row
                    $tineCreation = 
                        New-Object `
                            -TypeName Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity `
                            -ArgumentList $tineCreationPartitionKeyFixed, $tineCreationRowKey

                    $tineCreation.Properties.Add( 'tine_creation_id', [System.Guid]$tineCreationId)
                    $tineCreation.Properties.Add( 'tine_creation_builder_name', [System.String]$tineCreationBuilderName)
                    $tineCreation.Properties.Add( 'tine_creation_display_name', [System.String]$tineCreationDisplayName)
                    $tineCreation.Properties.Add( 'user_id', [System.Guid]$userId)
                    $tineCreation.Properties.Add( 'date_time', [System.DateTime]$dateTime)
                    $tineCreation.Properties.Add( 'tine_creation_partition_key_fixed', [System.String]$tineCreationPartitionKeyFixed)
                    $tineCreation.Properties.Add( 'tine_creation_row_key', [System.String]$tineCreationRowKey)

                    $tableTineCreation.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Insert($tineCreation)) | Out-Null
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
    if ($tableTineCreation) { try { Remove-Variable -Name tableTineCreation } catch {}}
    if ($storageContext) { try { Remove-Variable -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'insert to tine_creation'
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

        # validate tineCreationId ( primary key )
        if ($tineCreationId -eq '00000000-0000-0000-0000-000000000000') {
            # log
            $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'Primary Key:' + ' ' + 'tineCreationId' + ' ' + 'is missing'
            $htmlLog = $htmlLog + $taskLine + '<br>'
            if ($doEcho) { Write-Host ( $taskLine ) -ForegroundColor red }
            $answer = 'no'
        }

        if ($answer -ne 'no' -and ($doDevelopment -or $doTest -or $doSql2x)) {

            # connect and validate table
            $storageContext = New-AzureStorageContext -ConnectionString $storageConnectionString

            $tableTineCreation = Get-AzureStorageTable -Context $storageContext -Name 'tineCreation' -ErrorAction SilentlyContinue

            if ( $tableTineCreation -eq $null ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_creation table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # insert row
                $tineCreation =
                    New-Object `
                        -TypeName Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity `
                        -ArgumentList $tineCreationPartitionKeyFixed, $tineCreationRowKey

                $tineCreation.Properties.Add( 'tine_creation_id', [System.Guid]$tineCreationId)
                $tineCreation.Properties.Add( 'tine_creation_builder_name', [System.String]$tineCreationBuilderName)
                $tineCreation.Properties.Add( 'tine_creation_display_name', [System.String]$tineCreationDisplayName)
                $tineCreation.Properties.Add( 'user_id', [System.Guid]$userId)
                $tineCreation.Properties.Add( 'date_time', [System.DateTime]$dateTime)
                $tineCreation.Properties.Add( 'tine_creation_partition_key_fixed', [System.String]$tineCreationPartitionKeyFixed)
                $tineCreation.Properties.Add( 'tine_creation_row_key', [System.String]$tineCreationRowKey)

                $tableTineCreation.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Insert($tineCreation)) | Out-Null
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
    if ($tineCreation) { try { Remove-Variable -Name tineCreation } catch {}}
    if ($tableTineCreation) { try { Remove-Variable -Name tableTineCreation } catch {}}
    if ($storageContext) { try { Remove-Variable -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'fetch from tine_creation'
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
                $tableTineCreation = Get-AzureStorageTable -Context $storageContext -Name 'tineCreation' -ErrorAction SilentlyContinue
            }

            if ( $tableTineCreation -eq $null -and !$whatIf ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_creation table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $list = New-Object System.Collections.Generic.List[string]

                $list.Add( 'tine_creation_id' )
                $list.Add( 'tine_creation_builder_name' )
                $list.Add( 'tine_creation_display_name' )
                $list.Add( 'user_id' )
                $list.Add( 'date_time' )
                $list.Add( 'tine_creation_partition_key_fixed' )
                $list.Add( 'tine_creation_row_key' )

                # filter tineCreationId ( primary key )
                if ($tineCreationId -ne  [TineCreationData]::new().tineCreationId) {
                    if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_creation_id eq guid'''+ $tineCreationId + ''''
                }

                $query.SelectColumns = $list
                $query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineCreation = $tableTineCreation.CloudTable.ExecuteQuery($query)
                }

                if ($tineCreationData) { try { Remove-Variable -Name tineCreationData } catch {}}

                if (($tineCreation | Measure-Object).Count -gt 0) {
                    $tineCreationData = [TineCreationData]::new()

                    $tineCreationData.tineCreationId = $tineCreation[0].Properties['tine_creation_id'].GuidValue
                    $tineCreationData.tineCreationBuilderName = $tineCreation[0].Properties['tine_creation_builder_name'].StringValue
                    $tineCreationData.tineCreationDisplayName = $tineCreation[0].Properties['tine_creation_display_name'].StringValue
                    $tineCreationData.userId = $tineCreation[0].Properties['user_id'].GuidValue
                    $tineCreationData.dateTime = $tineCreation[0].Properties['date_time'].DateTime
                    $tineCreationData.tineCreationPartitionKeyFixed = $env:ComputerName
                    $tineCreationData.tineCreationRowKey = [System.DateTime]::UtcNow.ToString('yyyy.MM.ddTHH:mm:ss fffZ')

                    # to json
                    if ($returnJson) {
                        if ($outputJson) { try { Remove-Variable -Name outputJson } catch {}}

                        $outputJson = ConvertTo-Json -InputObject $tineCreationData
                    }

                }

                # check if any column parameter is chosen
                [boolean] $includeAll = $true
                foreach ($parameter in $PSBoundParameters.Keys) {
                    $includeAll -= ($parameter -eq 'tineCreationId')
                    $includeAll -= ($parameter -eq 'tineCreationBuilderName')
                    $includeAll -= ($parameter -eq 'tineCreationDisplayName')
                    $includeAll -= ($parameter -eq 'userId')
                    $includeAll -= ($parameter -eq 'dateTime')
                    $includeAll -= ($parameter -eq 'tineCreationPartitionKeyFixed')
                    $includeAll -= ($parameter -eq 'tineCreationRowKey')
                }

                # property echo
                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineCreationId') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineCreationId' + '; [' + $tineCreationData.tineCreationId + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineCreationBuilderName') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineCreationBuilderName' + '; [' + $tineCreationData.tineCreationBuilderName + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineCreationDisplayName') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineCreationDisplayName' + '; [' + $tineCreationData.tineCreationDisplayName + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('userId') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'userId' + '; [' + $tineCreationData.userId + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('dateTime') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'dateTime' + '; [' + $tineCreationData.dateTime + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineCreationPartitionKeyFixed') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineCreationPartitionKeyFixed' + '; [' + $tineCreationData.tineCreationPartitionKeyFixed + ']'
                    $htmlLog = $htmlLog + $taskLine + '<br>'
                    if ($doEcho) { Write-Host ( $taskLine ) }
                }

                if ( $includeAll -or $PSBoundParameters.ContainsKey('tineCreationRowKey') ) {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tineCreationRowKey' + '; [' + $tineCreationData.tineCreationRowKey + ']'
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
    if ($tineCreation) { try { Remove-Variable -Name tineCreation } catch {}}
    if ($tableTineCreation) { try { Remove-Variable -Name tableTineCreation } catch {}}
    if ($storageContext) { try { Remove-Variable -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'update tine_creation'
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
                $tableTineCreation = Get-AzureStorageTable -Context $storageContext -Name 'tineCreation' -ErrorAction SilentlyContinue
            }

            if ( $tableTineCreation -eq $null -and !$whatIf ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_creation table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $list = New-Object System.Collections.Generic.List[string]


                $query.FilterString = 'tine_creation_id eq guid'''+ $tineCreationId + ''''
                $query.SelectColumns = $list
                $query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineCreationForUpdate = $tableTineCreation.CloudTable.ExecuteQuery($query)
                }

                foreach ( $item in $tineCreationForUpdate ) {
                    [string] $partitionKeyLocal = $item.PartitionKey
                    [string] $rowKeyLocal = $item.RowKey

                    # change task value
                    [Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity] $tineCreation = `
                        New-Object 'Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity' $partitionKeyLocal, $rowKeyLocal

                    $tineCreation.ETag = '*'
                    if ($PSBoundParameters.ContainsKey('tineCreationId')) { $tineCreation.Properties.Add( 'tine_creation_id', [System.Guid]$tineCreationId) }
                    if ($PSBoundParameters.ContainsKey('tineCreationBuilderName')) { $tineCreation.Properties.Add( 'tine_creation_builder_name', [System.String]$tineCreationBuilderName) }
                    if ($PSBoundParameters.ContainsKey('tineCreationDisplayName')) { $tineCreation.Properties.Add( 'tine_creation_display_name', [System.String]$tineCreationDisplayName) }
                    if ($PSBoundParameters.ContainsKey('userId')) { $tineCreation.Properties.Add( 'user_id', [System.Guid]$userId) }
                    if ($PSBoundParameters.ContainsKey('dateTime')) { $tineCreation.Properties.Add( 'date_time', [System.DateTime]$dateTime) }
                    if ($PSBoundParameters.ContainsKey('tineCreationPartitionKeyFixed')) { $tineCreation.Properties.Add( 'tine_creation_partition_key_fixed', [System.String]$tineCreationPartitionKeyFixed) }
                    if ($PSBoundParameters.ContainsKey('tineCreationRowKey')) { $tineCreation.Properties.Add( 'tine_creation_row_key', [System.String]$tineCreationRowKey) }

                    $tableTineCreation.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Merge($tineCreation)) | Out-Null
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
    if ($tineCreationForUpdate) { try { Remove-Variable -Name tineCreationForUpdate } catch {}}
    if ($tableTineCreation) { try { Remove-Variable -Name tableTineCreation } catch {}}
    if ($partitionKeyLocal) { try { Remove-Variable -Name partitionKeyLocal } catch {}}
    if ($rowKeyLocal) { try { Remove-Variable -Name rowKeyLocal } catch {}}
    if ($tineCreation) { try { Remove-Variable -Name tineCreation } catch {}}
    if ($list) { try { Remove-Variable -Name list } catch {}}
    if ($query) { try { Remove-Variable -Name query } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'update tine_creation by foreign keys'
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
                $tableTineCreation = Get-AzureStorageTable -Context $storageContext -Name 'tineCreation' -ErrorAction SilentlyContinue
            }

            if ( $tableTineCreation -eq $null -and !$whatIf ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_creation table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $list = New-Object System.Collections.Generic.List[string]

                $list.Add( 'tine_creation_id' )
                $list.Add( 'tine_creation_builder_name' )
                $list.Add( 'tine_creation_display_name' )
                $list.Add( 'user_id' )
                $list.Add( 'date_time' )
                $list.Add( 'tine_creation_partition_key_fixed' )
                $list.Add( 'tine_creation_row_key' )

                # filter tineCreationId ( primary key )
                if ($tineCreationId -ne  [TineCreationData]::new().tineCreationId) {
                    if ($query.FilterString -ne $null) { $query.FilterString += ' and ' }
                    $query.FilterString += 'tine_creation_id eq guid'''+ $tineCreationId + ''''
                }

                $query.SelectColumns = $list
                $query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineCreationForUpdate = $tableTineCreation.CloudTable.ExecuteQuery($query)
                }

                foreach ( $item in $tineCreationForUpdate ) {
                    [string] $partitionKeyLocal = $item.PartitionKey
                    [string] $rowKeyLocal = $item.RowKey

                    # change task value
                    [Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity] $tineCreation = `
                        New-Object 'Microsoft.WindowsAzure.Storage.Table.DynamicTableEntity' $partitionKeyLocal, $rowKeyLocal

                    $tineCreation.ETag = '*'
                    if ($PSBoundParameters.ContainsKey('tineCreationId')) { $tineCreation.Properties.Add( 'tine_creation_id', [System.Guid]$tineCreationId) }
                    if ($PSBoundParameters.ContainsKey('tineCreationBuilderName')) { $tineCreation.Properties.Add( 'tine_creation_builder_name', [System.String]$tineCreationBuilderName) }
                    if ($PSBoundParameters.ContainsKey('tineCreationDisplayName')) { $tineCreation.Properties.Add( 'tine_creation_display_name', [System.String]$tineCreationDisplayName) }
                    if ($PSBoundParameters.ContainsKey('userId')) { $tineCreation.Properties.Add( 'user_id', [System.Guid]$userId) }
                    if ($PSBoundParameters.ContainsKey('dateTime')) { $tineCreation.Properties.Add( 'date_time', [System.DateTime]$dateTime) }
                    if ($PSBoundParameters.ContainsKey('tineCreationPartitionKeyFixed')) { $tineCreation.Properties.Add( 'tine_creation_partition_key_fixed', [System.String]$tineCreationPartitionKeyFixed) }
                    if ($PSBoundParameters.ContainsKey('tineCreationRowKey')) { $tineCreation.Properties.Add( 'tine_creation_row_key', [System.String]$tineCreationRowKey) }

                    $tableTineCreation.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Merge($tineCreation)) | Out-Null
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
    if ($tineCreationForUpdate) { try { Remove-Variable -Name tineCreationForUpdate } catch {}}
    if ($tableTineCreation) { try { Remove-Variable -Name tableTineCreation } catch {}}
    if ($partitionKeyLocal) { try { Remove-Variable -Name partitionKeyLocal } catch {}}
    if ($rowKeyLocal) { try { Remove-Variable -Name rowKeyLocal } catch {}}
    if ($tineCreation) { try { Remove-Variable -Name tineCreation } catch {}}
    if ($list) { try { Remove-Variable -Name list } catch {}}
    if ($query) { try { Remove-Variable -Name query } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'delete from tine_creation'
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

            $tableTineCreation = Get-AzureStorageTable -Context $storageContext -Name 'tineCreation' -ErrorAction SilentlyContinue

            if ( $tableTineCreation -eq $null ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_creation table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $list = New-Object System.Collections.Generic.List[string]

                $list.Add( 'tine_creation_id' )

                $query.FilterString = 'tine_creation_id eq guid'''+ $tineCreationId + ''''
                $query.SelectColumns = $list
                $query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineCreationForDelete = $tableTineCreation.CloudTable.ExecuteQuery($query)
                }

                # delete selected rows
                foreach ( $tineCreationItem in $tineCreationForDelete ) {
                    $tableTineCreation.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Delete($tineCreationItem)) | Out-Null
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
    if ($tineCreationForDelete) { try { Remove-Variable -Name tineCreationForDelete } catch {}}
    if ($tineCreationItem) { try { Remove-Variable -Name tineCreationItem } catch {}}
    if ($tableTineCreation) { try { Remove-Variable -Name tableTineCreation } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'fetch value from tine_creation'
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
                $tableTineCreation = Get-AzureStorageTable -Context $storageContext -Name 'tineCreation' -ErrorAction SilentlyContinue
            }

            if ( $tableTineCreation -eq $null -and !$whatIf ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_creation table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                $query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $list = New-Object System.Collections.Generic.List[string]

                $list.Add( $fetchValue )

                # filter tineCreationId ( primary key )
                if ($tineCreationId -ne  [TineCreationData]::new().tineCreationId) {
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
                    $tineCreation = $tableTineCreation.CloudTable.ExecuteQuery($query)
                }

                # get value
                [string] $outValue = ''
                if (($tineCreation | Measure-Object).Count -gt 0) {
                    $outValue = $tineCreation[0].Properties[$fetchValue].PropertyAsObject

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
    if ($tineCreation) { try { Remove-Variable -Name tineCreation } catch {}}
    if ($tableTineCreation) { try { Remove-Variable -Name tableTineCreation } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'delete all from tine_creation'
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

            $tableTineCreation = Get-AzureStorageTable -Context $storageContext -Name 'tineCreation' -ErrorAction SilentlyContinue

            if ( $tableTineCreation -eq $null ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_creation table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $list = New-Object System.Collections.Generic.List[string]

                $list.Add( 'tine_creation_id' )

                $query.SelectColumns = $list
                $query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineCreationForDelete = $tableTineCreation.CloudTable.ExecuteQuery($query)
                }

                # delete selected rows
                foreach ( $tineCreationItem in $tineCreationForDelete ) {
                    $tableTineCreation.CloudTable.Execute([Microsoft.WindowsAzure.Storage.Table.TableOperation]::Delete($tineCreationItem)) | Out-Null
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
    if ($tineCreationForDelete) { try { Remove-Variable -Name tineCreationForDelete } catch {}}
    if ($tineCreationItem) { try { Remove-Variable -Name tineCreationItem } catch {}}
    if ($tableTineCreation) { try { Remove-Variable -Name tableTineCreation } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'show tine_creation'
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

            $tableTineCreation = Get-AzureStorageTable -Context $storageContext -Name 'tineCreation' -ErrorAction SilentlyContinue

            if ( $tableTineCreation -eq $null ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_creation table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                # select all rows
                $query = New-Object Microsoft.WindowsAzure.Storage.Table.TableQuery
                $list = New-Object System.Collections.Generic.List[string]

                $list.Add( 'tine_creation_id' )
                $list.Add( 'tine_creation_builder_name' )
                $list.Add( 'tine_creation_display_name' )
                $list.Add( 'user_id' )
                $list.Add( 'date_time' )
                $list.Add( 'tine_creation_partition_key_fixed' )
                $list.Add( 'tine_creation_row_key' )

                $query.SelectColumns = $list
                $query.TakeCount = $takeCount

                # execute select
                if (!$whatIf) {
                    $tineCreation = $tableTineCreation.CloudTable.ExecuteQuery($query)
                }

                # echo
                [string] $output = ''
                $output = $tineCreation `
                    | Format-Table PartitionKey, RowKey, `
                    @{ Label = 'Tine Creation Id'; Expression={$_.Properties['tine_creation_id'].GuidValue} },`
                    @{ Label = 'Tine Creation Builder Name'; Expression={$_.Properties['tine_creation_builder_name'].StringValue} },`
                    @{ Label = 'Tine Creation Display Name'; Expression={$_.Properties['tine_creation_display_name'].StringValue} },`
                    @{ Label = 'User Id'; Expression={$_.Properties['user_id'].GuidValue} },`
                    @{ Label = 'Date Time'; Expression={$_.Properties['date_time'].StringValue} },`
                    @{ Label = 'Tine Creation Partition Key Fixed'; Expression={$_.Properties['tine_creation_partition_key_fixed'].StringValue} },`
                    @{ Label = 'Tine Creation Row Key'; Expression={$_.Properties['tine_creation_row_key'].StringValue} } `
                    -AutoSize `
                    | Out-String;

                # log
                if ($output -ne '') {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + $output
                } else {
                    $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'no result for ' + 'tine_creation' #+ ': ' + $query.FilterString
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
    if ($tineCreation) { try { Remove-Variable -Name tineCreation } catch {}}
    if ($tableTineCreation) { try { Remove-Variable -Name tableTineCreation } catch {}}
    if ($storageContext) { try { Remove-Variable -Name storageContext } catch {}}
}
#endregion
##################################################################################################################
$taskName = 'drop tine_creation'
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

            $tableTineCreation = Get-AzureStorageTable -Context $storageContext -Name 'tineCreation' -ErrorAction SilentlyContinue

            if ( $tableTineCreation -eq $null ) {
                # log
                $taskLine = [System.DateTime]::UtcNow.ToString() + ' ' + 'tine_creation table does not exist, please rerun with -create'
                $htmlLog = $htmlLog + $taskLine + '<br>'
                if ($doEcho) { Write-Host ( $taskLine ) }
                $doDevelopment = $false; $doTest = $false
            } else {
                Remove-AzureStorageTable -Context $storageContext -Name 'tineCreation' -Force
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
    if ($tableTineCreation) { try { Remove-Variable -Name tableTineCreation } catch {}}
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
    $tineCreationData
}

if ($returnGridView) {
    $tineCreationData | Out-GridView
}
