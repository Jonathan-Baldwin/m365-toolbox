$json = [PSCustomObject]@{
    "FY22Budgets/Hello" = @{
        Permissions = "ehllo"
    }
}

$stringJSON = $json | ConvertTo-Json


Write-Host $stringJSON
