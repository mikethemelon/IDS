$email1 = 'mikesdesktop2@gmail.com'
$email2 = 'kiendm2@gmail.com'
$smtpServer = 'sandbox.smtp.mailtrap.io'
$smtpPort = 587
# Credentials for Mailtrap
$Username = '5c4e558449fa63'
$Password = 'e3b1a12f4c2db3'

# Add a 2-minute (120 seconds) delay
Start-Sleep -Seconds 120

# Get the current date and time
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Get the real IP address of your computer (assuming you have an internet connection)
$realIpAddress = (Invoke-RestMethod -Uri 'https://api64.ipify.org?format=json').ip

$message = New-Object System.Net.Mail.MailMessage
$message.From = 'your.placeholder.email@gmail.com' # Placeholder email address
$message.To.Add($email1)
$message.To.Add($email2)
$message.Subject = "STARTUP Notification"
$message.Body = "Hi there,

Your MSI [$realIpAddress] has been startup on $timestamp.

Check it now, please!"

$smtp = New-Object Net.Mail.SmtpClient($smtpServer, $smtpPort)
$smtp.EnableSSL = $true
$smtp.Credentials = New-Object System.Net.NetworkCredential($Username, $Password)

$smtp.Send($message)
$smtp.Dispose()
