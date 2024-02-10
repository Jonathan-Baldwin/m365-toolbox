# Set folders base path for prior year
# Set folders base path for current year
# Set folder report path
# Get all folder paths for prior year
# Write folder paths report path as CSV
# Create new Document Library
# For Each folder in CSV, Create a folder in new Library
# Set permissions for new folders
# Add Budget File to each folder

$admin= '' # TODO: move to system env or prompt
$reports= '' # TODO: move to a configuration
$lastFyBudgetFolders = Import-Csv -Path $reports
$replace = "/sites/Financial/FY24Budgets"
$replaceWith = "FY24Budgets"

$site = "" # TODO: move to system env or prompt

$userCredential = Get-Credential -UserName $admin -Message "Type the password."
Connect-PnPOnline -Url $site -Credentials $userCredential

foreach ($folder in $lastFyBudgetFolders) {
    $newFolder = $folder.Name -replace $replace, $replaceWith
    write-host $newFolder
    Resolve-PnPFolder -SiteRelativePath $newFolder
}










