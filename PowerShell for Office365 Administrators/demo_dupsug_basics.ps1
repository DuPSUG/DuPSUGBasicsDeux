# connect to O365
$UserCredential = Get-Credential 
Connect-MsolService -Credential $UserCredential

(get-command -module MSOnline).count

get-msoldomain

get-msoluser

get-msoluser -UserPrincipalName ralph@365dude.nl | fl

get-msolsubscriptions


# connect to Exchange Online
$Session = New-PSSession -ConfigurationName Microsoft.Exchange `
-ConnectionUri https://outlook.office365.com/powershell-liveid/ `
-Credential $UserCredential -Authentication Basic -AllowRedirection

Import-PSSession $Session

get-mailbox
get-mailboxstatistics ralph@365dude.nl | fl

new-mailbox -name 'Auditorium' -Room
get-calendarprocessing auditorium | fl
remove-mailbox auditorium -confirm:$false

#connect to Azure AD
(get-command -module AzureAD).count

get-azureaduser
get-azureaduser | where {$_.UserType -eq 'guest'}


#connect to Sharepoint Online
Connect-SPOService -Url https://365dude-admin.sharepoint.com `
-credential $UserCredential

get-sposite
get-sposite https://365dude-my.sharepoint.com | fl
get-spotenant

# connect to SfB
$sfbsession = New-CsOnlineSession -Credential $UserCredential -Verbose
import-pssession $sfbsession


Get-CsOnlineUser -Identity ralph@365dude.nl
get-csonlinevoicemailpolicy





















