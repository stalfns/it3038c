
while(($optionNumber = Read-Host -Prompt "Options: `n1. Get Time`n2. Get Weather`n3. Get Uptime`n4. Get Disk Information`n5. Exit`nInput Option Number") -ne "5") {
    write-output "`n------------------------"
    switch ($optionNumber) {
        1{Get-Date}
        2{(curl http://wttr.in/?Q0 -UserAgent "curl").Content}
        3{(get-date) - (gcim Win32_OperatingSystem).LastBootUpTime}
        4{get-wmiobject -class win32_logicaldisk}
        5{exit}
        default {
            throw "NO MATCHING OPTION FOR $optionNumber"
        }
    }
    write-output "`n------------------------"
}

