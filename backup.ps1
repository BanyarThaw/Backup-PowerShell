# Define database credentials and backup directory
$User = "root"
$Password = "drthaw@rootMySQL"
$DbHost = "localhost"  # Renamed from $Host to $DbHost
$BackupDir = "C:\mysql-backups"
$Date = Get-Date -Format "yyyyMMdd_HHmmss"

# Ensure the backup directory exists
if (-not (Test-Path -Path $BackupDir)) {
    New-Item -Path $BackupDir -ItemType Directory
}

# Get the list of all databases
$databases = & "mysql" -u $User -p$Password -h $DbHost -e "SHOW DATABASES;" | Where-Object { $_ -ne "Database" -and $_ -ne "information_schema" -and $_ -ne "performance_schema" -and $_ -ne "mysql" -and $_ -ne "sys" }

# Loop through each database and perform the backup
foreach ($db in $databases) {
    $backupFile = "$BackupDir\${db}_full_$Date.sql"
    try {
        & "mysqldump" --user=$User --password=$Password --host=$DbHost --databases $db > $backupFile
        Write-Host "Backup of database '$db' completed successfully."
    } catch {
        Write-Host "Failed to backup database '$db'. Error: $_"
    }
}
