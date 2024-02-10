# Set up variables
$SiteURL = '' # TODO: move to system env or prompt

# Connect to test SPO environment
Connect-PnPOnline -Url $SiteURL

# 2 ways to connect 
# $pnp = Get-PnPConnection
$context = Get-PnPContext

$root = $context.Web
$context.Load($root)
$context.ExecuteQuery()

$lists = Get-PnPList

foreach ($list in $lists) {
    Write-Host $list.Title
}

# $FY20Library = Get-PnPList -Identity "FY20 Budgets"
$FY20Library = Get-PnPFolderItem -FolderSiteRelativeUrl "Budgets" -Recursive

$migrations = @()

foreach ($item in $FY20Library) {
    $type = $item.GetType().FullName
    # $fileType = 'Microsoft.SharePoint.Client.File'
    $folderType = 'Microsoft.SharePoint.Client.Folder'

    if($type -eq $folderType) {
        $migration = [PSCustomObject]@{
            Source = $item.ServerRelativeUrl
        }
        $migrations += $migration
    }
}

$migrations | Export-Csv -Path "./reports/migration.csv" -NoTypeInformation

