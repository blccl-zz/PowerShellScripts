$machines = Get-Content C:\Users.txt
$report = @() 
$object = @() 

foreach($machine in $machines) 
{ 
$machine 

$object = Get-ADUser -Server "cgpwbchdc01.chubuet.com" -identity $machine -properties Name, SamAccountName, Department, EmailAddress, Title, LastLogonDate

$object.Name
$object.SamAccountName
$object.Department
$object.EmailAddress
$object.Title
$object.LastLogonDate

$report += $object
} 
$report | Export-csv C:\JERATAudit_2.csv