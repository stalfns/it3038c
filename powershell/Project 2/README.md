

#This script is an expansion of my first script, you are still able to get the weather and time, but I added the ability to view system uptime as well as currently installed disks on the system. This differs from my first script as you are now able to pick between 5 options:

    Get Time
    Get Weather
    Get Uptime
    Get Disk Information
    Exit

#Running any of these commands will give the requested information as well as loop back to the beginning of the script, allowing you to choose a different option.

#You can run this script from powershell by navigating to the proper directory or by using the full path. #Simply type '.\Project 2.ps1' when in the working directory.

The outputs would be what you'd expect:

Get Time - this will display the current system time 
Get Weather - connects to wttr.in for an in terminal weather experience 
Get Uptime - Displays how long the system has been running 
Get Disk Information - Displays the current disks installed on the system 
Exit - Exits the script

If a number that is not 1-5 is given an error is thrown saying "No matching option for #"

