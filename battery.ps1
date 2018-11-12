### Sample script to check Battery Health
### on systems with a single battery
### Compatible with Windows 7 and later
### This script is provided As Is
### Script by Joao Botto
### Version 0.3


### INSTRUCTIONS:
### Execute this script when you want information
### about the battery health
### or regularly as a scheduled task

### PARAMETERS:
### show - Shows current battery health on screen
### reg - Save information in HKLM:\SOFTWARE\BatteryHealth
### file - Save information in c:\BatteryHealth


[CmdletBinding()]
    Param([Parameter(Mandatory=$false)][String]$action)


# Compute battery health in percentage
# of original possible cycles

Function Test-BatteryHealth
{
    $fullchargecapacity = (Get-WmiObject -Class "BatteryFullChargedCapacity" -Namespace "ROOT\WMI").FullChargedCapacity
    $designcapacity = (Get-WmiObject -Class "BatteryStaticData" -Namespace "ROOT\WMI").DesignedCapacity

    if ($fullchargecapacity -eq $designcapacity) {
        Write-Host "Your system doesn't seem capable of providing accurate battery information`n" -ForegroundColor black -BackgroundColor red
        Exit 1
    }

    $batteryhealth = ($fullchargecapacity / $designcapacity) * 100
    if ($batteryhealth -gt 100) {$batteryhealth = 100}
    return [decimal]::round($batteryhealth) 
}


# Show battery health on the screen

Function Show-BatteryHealth
{
    if ($batteryhealth -gt 90 -or $batteryhealth -eq 90) { 
    Write-Host "Last full charge was $batteryhealth% of original capacity"
    Write-Host "Laptop battery is healthy"
    }
    if ($batteryhealth -lt 89 -or $batteryhealth -eq 51) { 

    Write-Host "Last full charge was $batteryhealth% of original capacity"
    Write-Host "Laptop battery capacity is somewhat degraded"
    Write-Host "But it is normal after a time of use"
    Write-Host "and do now warrant purchase of a new battery"

    }
    if ($batteryhealth -lt 51 -or $batteryhealth -eq 26) { 
    Write-Host "Last full charge was $batteryhealth% of original capacity"
    Write-Host "Laptop battery has only half of its original capacity"
    Write-Host "You might consider ordering a new battery"
    Write-Host "If you experience significant drop in usage time"
    }
    if ($batteryhealth -lt 26) { 
    Write-Host "Last full charge was $batteryhealth% of original capacity"
    Write-Host "Laptop battery is depleted and should be exchanged"
    }
}




# Main

$date = Get-Date -format d

$batteryhealth = Test-BatteryHealth

switch ($action) {
    "show" {Show-BatteryHealth}




    
    default {
        $wshell = New-Object -ComObject Wscript.Shell
        
        Show-BatteryHealth
       
    }
}


# end

Exit 0