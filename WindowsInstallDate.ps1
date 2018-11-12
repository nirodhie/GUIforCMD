$installDate = ([WMI]'').ConvertToDateTime((Get-WmiObject Win32_OperatingSystem).InstallDate)
$currentDate = (GET-DATE)
$daysSinceInstallation = (NEW-TIMESPAN –Start $installDate  –End $currentDate).Days
Write-Host "You have"(Get-WmiObject -class Win32_OperatingSystem).Caption
Write-Host "Windows was installed" $daysSinceInstallation "days ago"

if ($daysSinceInstallation -gt 360 -eq 360)
{
#write-host "Windows was installed more than a year ago"
Write-Host "Performance will likely be degraded"
Write-Host "due to the age of Windows installation"
break
}
if ($daysSinceInstallation -lt 180)
{
#Write-Host "Windows was installed less than six months ago"
write-host "There should not be significant slowdowns"
Write-Host "due to the age of Windows installation"
break
}
if ($daysSinceInstallation -gt 180 -lt 360)
{
#Write-Host "Windows was installed more than six months ago"
write-host "There might be some slowdowns"
Write-Host "due to the age of Windows installation"
break
}

