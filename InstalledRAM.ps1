$InstalledRAM = Get-WmiObject -Class Win32_ComputerSystem
$RAMamount =[Math]::Round(($InstalledRAM.TotalPhysicalMemory/ 1GB))
Write-Host "You have" $RAMamount "GB of RAM installed"


Param(
    [string]$Computername = "localhost"
)
cls
$PysicalMemory = Get-WmiObject -class "win32_physicalmemory" -namespace "root\CIMV2" -ComputerName $Computername

#Write-Host "Memory Modules:" -ForegroundColor Green
#$PysicalMemory | Format-Table Tag,@{n="Capacity(GB)";e={$_.Capacity/1GB}},Manufacturer,PartNumber,Speed -AutoSize

Write-Host "Total Memory:" "$((($PysicalMemory).Capacity | Measure-Object -Sum).Sum/1GB)GB"

$TotalSlots = ((Get-WmiObject -Class "win32_PhysicalMemoryArray" -namespace "root\CIMV2" -ComputerName $Computername).MemoryDevices | Measure-Object -Sum).Sum
Write-Host "Total Memory Slots:"  $TotalSlots

$UsedSlots = (($PysicalMemory) | Measure-Object).Count 
Write-Host "Used Memory Slots:" $UsedSlots

If($UsedSlots -eq $TotalSlots)
{
    Write-Host "You cannot add any more memory" 
}
else {Write-Host "More memory can be added"}