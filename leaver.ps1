# adding pre requsite items Active directory, exchange and lync addins
Import-module activedirectory, "C:\Program Files\Common Files\Microsoft Lync Server 2013\Modules\Lync"
Add-PSSnapin Microsoft.Exchange.Management.PowerShell.SnapIn;
# request user name of leaver
$user = Read-Host "Enter username"
# confirmation loop
$choice = ""
while ($choice -notmatch "[y|n]")
    {
    $choice = read-host "Do you want to process $user (Y/N)"
    }

if ($choice -eq "y")
    {
# Disables lync account
Try {
Disable-CsUser -Identity $user}
 Catch [Microsoft.Rtc.Management.AD.ManagementException]{write-host User already removed from lync}
Write-Host Lync disabled
#Pulls a list of users membership groups and then removes the user from all of them except Domain Users
$ADgroups = Get-ADPrincipalGroupMembership -Identity $user | where {$_.Name -ne "Domain Users"} 
# creates folder if not existing
New-Item -ItemType Directory -Force -Path "\\mcpwrntsrv051\common\ITG\leavers"
#copies user groups to Q:\ITG\username.csv
$ADgroups | export-csv "\\mcpwrntsrv051\common\itg\leavers\$user.csv" -NoTypeInformation
Write-Host User groups copied to Q:\ITG 
Remove-ADPrincipalGroupMembership -Identity "$user" -MemberOf $ADgroups -Confirm:$false 
Write-Host Groups removed
#Clears down AD atttributes
Set-ADuser $user -clear manager, department, description, l, ipPhone, physicalDeliveryOfficeName, postalCode, streetAddress, telephoneNumber, company, mobile, title, facsimileTelephoneNumber,homeDirectory, homeDrive, thumbnailPhoto
Write-Host User details removed
#disables mailbox
Disable-Mailbox -Identity $user -confirm:$false
Write-Host Mailbox disabled
#Disables User
Disable-ADAccount -Identity $user
Write-Host User disabled
#moves user to terminations OU
Get-ADUser $user| Move-ADObject -TargetPath 'OU=Teminations,OU=Users,OU=EDF,DC=edftrading,DC=com'
Write-Host User moved to terminations
Read-Host -Prompt “Press Enter to exit”
}
else {write-host "No action taken"}