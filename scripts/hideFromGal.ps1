$user = '' # TODO: Move to system evn or prompt

$LiveCred = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell/ -Credential $LiveCred -Authentication Basic -AllowRedirection
Import-PSSession $Session 
Set-Mailbox -Identity $user -HiddenFromAddressListsEnabled $true