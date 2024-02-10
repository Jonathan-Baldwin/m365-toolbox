$SiteURL = '' # TODO: move to system env or prompt

Connect-PnPOnline -Url $SiteURL

# 2 ways to connect to sharepoint
# $pnp = Get-PnPConnection
$context = Get-PnPContext

$root = $context.Web
$context.Load($root)
$context.ExecuteQuery()

# read file
Write-Host -f Blue'importing groups list'
$groupsPath = '.\reports\groups.csv'

# "Name","Users"
# <Group Name>, [comma seperated user names]
$groups = Import-Csv -Path $groupsPath

#write output
foreach ($group in $groups) {
    # if it begins with "Budget" Then add to array
    if ($group.Name.StartsWith('Budget')) {
        Write-Host $group.Name
        New-PnPGroup -Title $group.Name
    }
}




