# CampusForum one-click SQL Server setup for Windows (Windows Authentication).
# Uses built-in .NET SqlClient, so the sqlcmd command-line tool is not required.
$ErrorActionPreference = 'Stop'

try {
    $scriptPath = Join-Path $PSScriptRoot 'database.sql'
    if (-not (Test-Path -LiteralPath $scriptPath)) {
        throw 'database.sql not found. Keep all three files in the same folder.'
    }

    Add-Type -AssemblyName System.Data

    # LocalDB is included with some Visual Studio/SQL Server workloads.
    # The other names cover common SQL Server Express and Developer installations.
    $servers = @(
        '(localdb)\MSSQLLocalDB',
        '.\SQLEXPRESS',
        'localhost\SQLEXPRESS',
        'localhost',
        '.'
    )

    $connection = $null
    $chosenServer = $null
    foreach ($server in $servers) {
        Write-Host ("Checking {0} ..." -f $server)
        $candidate = New-Object System.Data.SqlClient.SqlConnection
        $candidate.ConnectionString = "Server=$server;Database=master;Integrated Security=True;Connect Timeout=5;Encrypt=False;Application Name=CampusForum Database Setup;"
        try {
            $candidate.Open()
            $connection = $candidate
            $chosenServer = $server
            break
        } catch {
            $candidate.Dispose()
        }
    }

    if ($null -eq $connection) {
        throw @'
No accessible local SQL Server instance was detected.
Install SQL Server Express or SQL Server LocalDB, or enable your existing SQL Server service.
Then double-click RUN_DATABASE.bat again.
Note: Visual Studio alone does not guarantee a SQL Server instance is installed.
'@
    }

    try {
        Write-Host "Connected to $chosenServer" -ForegroundColor Green
        $sql = [System.IO.File]::ReadAllText($scriptPath, [System.Text.Encoding]::UTF8)
        # SSMS executes each GO-delimited batch. SqlClient requires us to split them.
        $batches = [regex]::Split($sql, '(?im)^[ \t]*GO[ \t]*(?:--[^\r\n]*)?(?:\r?\n|$)')
        $batchNumber = 0
        foreach ($batch in $batches) {
            if ([string]::IsNullOrWhiteSpace($batch)) { continue }
            $batchNumber++
            $cmd = $connection.CreateCommand()
            try {
                $cmd.CommandText = $batch
                $cmd.CommandTimeout = 90
                [void] $cmd.ExecuteNonQuery()
            } catch {
                throw ("SQL batch {0} failed: {1}" -f $batchNumber, $_.Exception.Message)
            } finally {
                $cmd.Dispose()
            }
        }

        # Database selection is explicit here, independent of USE scope in the SQL script.
        $verify = $connection.CreateCommand()
        try {
            $verify.CommandText = @'
USE [CampusForumDB];
SELECT COUNT(*) FROM sys.tables WHERE schema_id = SCHEMA_ID(N'dbo');
'@
            $tableCount = [int]$verify.ExecuteScalar()
        } finally {
            $verify.Dispose()
        }

        if ($tableCount -lt 19) {
            throw "Verification failed. Expected at least 19 tables; found $tableCount."
        }
        Write-Host ''
        Write-Host 'SUCCESS: CampusForumDB is ready.' -ForegroundColor Green
        Write-Host ("Server: {0}" -f $chosenServer)
        Write-Host ("Tables: {0}" -f $tableCount)
        Write-Host 'You can safely run this setup again; the script preserves existing tables and example rows.'
    } finally {
        $connection.Close()
        $connection.Dispose()
    }
    exit 0
} catch {
    Write-Host ''
    Write-Host ('ERROR: ' + $_.Exception.Message) -ForegroundColor Red
    Write-Host 'Database setup could not finish. The existing database (if any) was not deleted.'
    exit 1
}
