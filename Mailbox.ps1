$users = Get-Content C:\AppSupport_List.txt
$mailboxs = Get-Content C:\Mailbox_List.txt


ForEach ($mailbox in $mailboxs) {

    ForEach ($user in $users) {

        Add-MailboxPermission `
        -Identity $mailbox  `
        -User $user `
        -AccessRights FullAccess `
        -InheritanceType All
    }

    $mailbox

    Get-MailboxPermission $mailboxs
}