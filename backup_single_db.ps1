# this script work

# Define database credentials and backup directory
$User = "root"
$DbHost = "localhost"  # Host where MySQL server is running
$Password = "drthaw@rootMySQL"
$db = "b2hd"
$BackupDir = "C:\mysql-backups\full"
$Date = Get-Date -Format "yyyyMMdd_HHmmss"

$backupFile = "$BackupDir\${db}_full_$Date.sql"

# Construct the backup command
# mysqldump -u $User –p$Password --default-character-set=utf8mb4 -N --routines --skip-triggers --databases $db > $backupFile
# $backupCommand = "mysqldump -u $User -p$Password --default-character-set=utf8mb4 -N --routines --skip-triggers  --databases $db > $backupFile"
# $backupCommand = "mysqldump -u $User -p$Password -c -e --default-character-set=utf8mb4 --collation=utf8mb4_unicode_ci --databases $db > $backupFile"
$backupCommand = "mysqldump -u $User -p$Password -c -e --single-transaction --quick --default-character-set=utf8mb4 --collation=utf8mb4_unicode_ci --databases $db > $backupFile"


# Execute the command
Invoke-Expression $backupCommand
