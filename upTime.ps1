$uptime = ((get-date)-([System.Management.ManagementDateTimeconverter]::ToDateTime((Get-WmiObject win32_operatingsystem).lastbootuptime))).days
if ($uptime  -lt 7 )
{write-host "You have not restarted your laptop for" $uptime "days"}

else 
{
Write-Host "You have not restarted your laptop for a week"
write-host "It is advisable to do it periodically"
}