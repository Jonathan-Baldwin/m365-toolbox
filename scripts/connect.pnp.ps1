function getProperty([string]$prop) {
    return (Get-Content .\pnp.config.json | ConvertFrom-Json).$prop
}

$URL = getProperty('site')
Connect-PnPOnline -Url $URL  -Interactive

$groups = Get-PnPGroup

class FinanceGroup {
    [string]$name
    [string]$users

    FinanceGroup([Microsoft.SharePoint.Client.Group]$group) {
        $this.users = $this.JoinUsers($group.Users)
        $this.name = $group.Title
    }

    [string]JoinUsers([Microsoft.SharePoint.Client.UserCollection]$users){
        return (@($users.ForEach({$_.Title})) -join ';')
    }
}

# function JoinUsers([Microsoft.SharePoint.Client.UserCollection]$users){
#     [string[]]$userArr = @($users.ForEach({$_.Title}))
#     return ($userArr -join ';')
# }

$outGroups = @($groups.ForEach({[FinanceGroup]::new($_)}))

# $outGroups | ConvertTo-Json | Write-Host

$outGroups | Export-Csv -Path "./reports/groups-out.csv" -NoTypeInformation
