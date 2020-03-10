"Getting Windows Updates..."
"----------------------------------"
Get-WUList -MicrosoftUpdate 
"----------------------------------"

"Above you will find a list of available updates for your computer"

"Would you like to install these updates"

$ReadHost = Read-Host "(Y/N)"
Switch ($ReadHost)
{
    Y {Write-Host "Downloading Updates"; Get-WUInstall -IgnoreUserInput -Acceptall -Download -Install -Verbose}
    N {Write-Host "Okay";}
}

"Below you will find a history of installed and failed Windows Updates in 2020"
"---------------------------------"
Get-WUHistory |Where-Object {$_.Date -match 2020}| Select-Object *|ft
"---------------------------------"