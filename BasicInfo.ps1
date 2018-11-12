$producent = (Get-WmiObject Win32_BIOS).Manufacturer
$model = (Get-WmiObject win32_computersystem).Model
$serviceTag = (Get-WmiObject Win32_BIOS).Serialnumber
#$env:COMPUTERNAME
$BIOSver = (Get-WmiObject win32_bios).SMBIOSBIOSVersion
Write-Host "You have             " $producent $model
Write-Host "Laptop Service tag " $serviceTag
Write-Host "Laptop name         " $env:COMPUTERNAME
Write-Host "Your GlobalID is    " $env:UserName
Write-Host "BIOS version is     " $BIOSver