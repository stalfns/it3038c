#THis sub menu allows for options for weather. THis option references wttr.in. This will allow you to get local weather or weather for other cities. 
function weatherSubMenu {
    while(($weatherSub = Read-Host -Prompt "Options: `n1. Local Weather`n2. Weather by City`n3. Exit`nInput Option Number") -ne "3") {
        write-output "`n------------------------"
        switch ($weatherSub){
            1{curl wttr.in/Cincinnati}
            2{
                $url = "wttr.in/"
                while(($city = Read-Host -Prompt "Please enter City Name") -ne $null) {
                    $url += $city
                    curl $url
                    break
                }
            }
            3{exit}

            default {throw "NO MATCHING OPTION FOR $weatherSub"}
        }
    }
}

#This function will allow you to get Winodws Updates, and will prompt you yes or no. 
function windowsUpdate {
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
}


#Below you will find various options 
while(($optionNumber = Read-Host -Prompt "Options: `n1. Get Time`n2. Get Weather`n3. Get Uptime`n4. Get Disk Information`n5. Windows Update`n6. A New Hope`n7. Exit`nInput Option Number") -ne "7") {

    write-output "`n------------------------"

    switch ($optionNumber) {
        #Gets the current date and time
        1{Get-Date}
        #References the weatherSubMenu function
        2{weatherSubMenu}
        #Get system uptime
        3{(get-date) - (gcim Win32_OperatingSystem).LastBootUpTime}
        #Here you can see your disk information
        4{get-wmiobject -class win32_logicaldisk}
        #THis will reference the windows update function
        5{windowsUpdate}
        #Make sure to enable telnet... this is a pretty cool, it is A New Hope, the film. 
        6{telnet towel.blinkenlights.nl}

        7{exit}

        default {

            throw "NO MATCHING OPTION FOR $optionNumber"

        }

    }

    write-output "`n------------------------"

}