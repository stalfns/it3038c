
function getIP{
(get-netipaddress).IPv4Address | Select-String "192*"
}
$IP = getIP
write-host("This machine's IP is $IP")
$DATE = Get-Date -DisplayHint Date
$BODY = (" This machine's IP is $IP, User is $env:USERNAME, Hostname is $env:ComputerName, PowerShell Version is 6, Today's date is $DATE ")

Send-MailMessage -To "stalfns@mail.uc.edu" -From "stalfns@mail.uc.edu" -Subject "IT3038C Windows SysInfo" -Body $BODY -SmtpServer smtp.gmail.com -port 587 -UseSSL -Credential (Get-Credential)