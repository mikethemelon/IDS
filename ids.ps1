$email1 = 'your_first_email@email.com'
$email2 = 'your_smtp_mail@smtp.com'
$smtpServer = 'your_personal_smptServer'
$smtpPort = 587
# Credentials for Mailtrap
$Username = 'smptusername'
$Password = 'smptpassword'

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

Your PC [$realIpAddress] has been startup on $timestamp.

Check it now, please!"

$smtp = New-Object Net.Mail.SmtpClient($smtpServer, $smtpPort)
$smtp.EnableSSL = $true
$smtp.Credentials = New-Object System.Net.NetworkCredential($Username, $Password)

$smtp.Send($message)
$smtp.Dispose()
