$disk = Get-WmiObject Win32_LogicalDisk  -Filter "DeviceID='C:'" |Select-Object Size,FreeSpace
$size=[Math]::Round($disk.Size/1GB)
$free=[Math]::Round($disk.FreeSpace/1GB)
$percentage=[Math]::Round(($free/$size)*100)

Write-Host $size "GB total," $free "GB free"

if ($percentage -lt 20)
{Write-Host $percentage"% of space is free"
 Write-Host "Consider removing unused files"
}
if ($free -lt 10)
{Write-Host "You have less than" $free"GB free"
 Write-Host "Consider removing unused files"
}

else {
Write-Host $percentage"% of space is free"
Write-Host "You have enough storage space"
}
$physicalHDDinfromation = (Get-WmiObject Win32_diskdrive)   |Select-Object Caption, Serialnumber
$physicalHDDinfromation.Caption
$physicalHDDinfromation.Serialnumber