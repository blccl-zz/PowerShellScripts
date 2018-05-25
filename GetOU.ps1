$users = Get-Content C:\getOU.txt
$report = @() 
$object = @() 


ForEach ($user in $users) {
$Machine

$object = Get-ADUser $user | select SamAccountName, DistinguishedName
$object.SamAccountName
$object.DistinguishedName


$report += $object

}

$report | Export-csv C:\OU_List.csv
