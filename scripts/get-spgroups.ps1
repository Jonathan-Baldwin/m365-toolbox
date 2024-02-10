$user = '' # TODO: set up as system env or prompt
$orgName = ''  # TODO: set up as system env or prompt
$userCredential = Get-Credential -UserName $user -Message "Type the password."


Connect-SPOService -Url https://$orgName-admin.sharepoint.com -Credential $userCredential
$sites = Get-SPOSite


foreach ($site in $sites) {
    Write-Host $site.URL
}