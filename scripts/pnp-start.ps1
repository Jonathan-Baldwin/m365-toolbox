$SiteUrl = '' # TODO: move to env or prompt
$reportsPath = '' # TODO: move to env or prompt

Connect-PnPOnline -Url $SiteUrl

# evaluating the 2 different ways to connect to m635.
# $pnp = Get-PnPConnection
$context = Get-PnPContext

$root = $context.Web
$context.Load($root)
$context.ExecuteQuery()


# $web = Get-PnPWeb

# $list = Get-PnPList

$groups = Get-PnPGroup

$groupsArr = @()

foreach ($group in $groups) {
    $users = $group.Users
    $context.Load($users)
    $context.ExecuteQuery()


    $usersArr = @()
    foreach ($user in $users) {
        $usersArr += $user.Title
    }

    $groupOut = [PSCustomObject]@{
        Name = $group.Title
        Users = $usersArr -join ";"
    }

    $groupsArr += $groupOut
}

$groupsArr | Export-Csv -Path $reportsPath -NoTypeInformation





