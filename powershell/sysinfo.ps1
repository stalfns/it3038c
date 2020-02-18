function getIP{
(get-netipaddress).IPv4Address | Select-String "192*"
}
$IP = getIP
write-host("This machine's IP is $IP")

Send-MailMessage -To "nickstalf@gmail.com" -From "nickstalf@gmail.com" -Subject "IT3038C Windows SysInfo" -Body $BODY -SmtpServer smtp.google.com -port 587 -UseSSL -Credential (Get-Credential)