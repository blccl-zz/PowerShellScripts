
$machines = Get-Content C:\Temp\feedme.txt
foreach($machinename in $machines)
{
get-wmiobject win32_networkadapterconfiguration -computer $machinename -filter "IPEnabled='True'" | Select DNSHostname,MACAddress,IPAddress
}