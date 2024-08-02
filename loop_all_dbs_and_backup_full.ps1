# Define database credentials
$User = "root"
$Password = "drthaw@rootMySQL"
$DbHost = "localhost"  # Host where MySQL server is running

# Construct the command to list databases
$command = "mysql -u $User -p$Password -h $DbHost -e 'SHOW DATABASES;'"

# Execute the command and capture the output
$databases = Invoke-Expression $command

# Process the output to split it into an array of database names
$databases = $databases -split "`n" | Select-Object -Skip 1

# Loop through each database and print its name
foreach ($db in $databases) {
    Write-Host "Database is: '$db'."
}
