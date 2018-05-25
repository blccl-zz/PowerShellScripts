Get-ADGroup -filter "Groupcategory -eq 'Security' -AND GroupScope -AND Member -like '*'" -Properties Member |
foreach { 
 Write-Host "Exporting $($_.name)" -ForegroundColor Cyan
 $name = $_.name -replace " ","-"
 $file = Join-Path -path "C:\work3" -ChildPath "$name.csv"
 $_.member | Get-ADObject -Properties SamAccountname,Title,Department |
 Select Name,SamAccountName,Title,Department,DistinguishedName,ObjectClass |
 Export-Csv -Path $file -NoTypeInformation
}