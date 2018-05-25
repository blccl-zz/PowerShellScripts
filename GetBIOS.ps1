$Machines = Get-Content C:\8200_List.txt
$report = @() 
$object = @() 


ForEach ($Machine in $Machines) {
$Machine

$object = Get-WmiObject win32_BIOS -Computer $Machine | select SMBIOSBIOSVersion, Manufacturer, Name, SerialNumber, Version 
$object.SMBIOSBIOSVersion
$object.Manufacturer
$object.Name
$object.SerialNumber
$object.Version

$report += $object

}

$report | Export-csv C:\HP8200BIOSReport.csv
