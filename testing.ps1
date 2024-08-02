# this script work

# Define database credentials
$User = "root"
$DbHost = "localhost"  # Host where MySQL server is running

# Prompt for the password
# $Password = Read-Host "Enter MySQL password"
$Password = "drthaw@rootMySQL"

# Construct the login command
$loginCommand = "mysql -u $User -p$Password -h $DbHost"

# Execute the command
Invoke-Expression $loginCommand
