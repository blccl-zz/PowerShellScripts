$groups = "Grp_Front_Office_Decision_Support_Development_App_Support"
$report = @() 
$object = @() 

foreach ($group in $groups){

$group 
$object = Get-ADGroupMember -Identity $group | Select samAccountName, name

$object.samAccountName
$object.Name
$report += $object
}
 
$report | Export-csv C:\UsersinGroup\Grp_Front_Office_Decision_Support_Development_App_Support.csv -notype