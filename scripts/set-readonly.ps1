$user = '' # TODO: move to system env or prompt
$orgName =  '' # TODO: move to system env prompt
$userCredential = Get-Credential -UserName $user -Message "Type the password."

$siteUrl = '' # TODO: move to system env or prompt 


Connect-SPOService -Url https://$orgName-admin.sharepoint.com -Credential $userCredential

$sites = Get-SPOSite

# Set-SPOSite -Identity $siteUrl -LockState "ReadOnly"
# Set-SPOSite -Identity $siteUrl -LockState "Unlock"
Set-SPOSite -Identity $siteUrl -LockState "NoAccess"

foreach ($site in $sites) {
    Write-Host $site.URL
}


