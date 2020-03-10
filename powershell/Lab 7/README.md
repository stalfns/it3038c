Lab 7 - PSWindowsUpdate 

This is a Powershell Script, that will allow for easy and detailed Windows Update information 

***To run this script navigate to your working directory and type:  &'.\Lab 7.ps1'***

In order to install this module, please see below:
```
Install-Module -Name PSWindowsUpdate 
```
To get a list of available Windows Updates type the following:
```
Get-WUList -MicrosoftUpdate 
```
This will return a list of available updates for your system. 

Once you have reviewed the list of avaialble Windows Updates, you can install them with the command below:
```
Get-WUInstall -IgnoreUserInput -Acceptall -Download -Install -Verbose
```
This command will automatically install all updates

Finally, you can review the history of Windows Updates from 2020, as seen below:
```
Get-WUHistory |Where-Object {$_.Date -match 2020}| Select-Object *|ft
```

This script is almost completely automatic, except the user has the choice to install the updates or not. 

***Please Note: This operation might require elevated privileges***
