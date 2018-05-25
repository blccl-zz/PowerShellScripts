$machines = "VSP7D00006"
$report = @() 
$object = @() 

foreach($machine in $machines) 
{ 
$machine 
$object = Get-WmiObject Win32_LogicalDisk -ComputerName $machine -Filter "DeviceID='C:'" |
Select-Object Size,FreeSpace



$object.Size
$object.FreeSpace
$report += $object
} 
$report | Export-csv C:\machine\Space.csv -notype