$importlocation = Get-Content C:\Manager_List.txt
$exportlocation = 'c:\useracct.csv'
foreach($line in $importlocation)
{
    $line
    $object = Get-ADUser -Filter {mail -eq "$importlocation"} | select SamAccountName 
}
