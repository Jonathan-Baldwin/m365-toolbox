
$admin= '' # TODO: set up system env or prompt to get account
$site = '' # TODO: set up system envor prompt to get site

$folders = @(
    @{name = "FY22"
    
}
)


$userCredential = Get-Credential -UserName $admin -Message "Type the password."

Connect-PnPOnline -Url $site -Credentials $userCredential

$lists = Get-PnPList

foreach ($list in $lists) {
    Write-Host $list.Title
    
}

foreach ($folder in $folders) {
    Write-Host $folder.name
}


