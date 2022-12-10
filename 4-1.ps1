$output = 0
$sites = Get-Content -Path ".\4-1.txt"
foreach ($site in $sites) {
    $global:result1 = 0
    $global:result2 = 0
    $array = $site -replace "-","," -split ","
    1..4 | ForEach-Object {
        New-Variable -Name $_ -Value $array[(($_) - 1)] -Force
    }
    $range_1 = $1..$2
    $range_2 = $3..$4
    :loop1 foreach ($range_1int in $range_1) {
        if (!($range_2 | Select-String -Pattern ^$range_1int$)) {
            $global:result1 = 1
            break loop1
        }
    }
    :loop2 foreach ($range_2int in $range_2) {
        if (!($range_1 | Select-String -Pattern ^$range_2int$)) {
            $global:result2 = 1
            break loop2
        }
    }
    if ($global:result1 -eq 0 -or $global:result2 -eq 0) {
        $output += 1
    }
}
Write-Host "`n$output`n" -ForegroundColor DarkGreen
