$strategies = Get-Content -Path ".\2-1.txt"
$total = 0
foreach ($strategy in $strategies) {
    $score = 0
    $call = ($strategy).SubString(0,1)
    $response = ($strategy).SubString(2,1)
    if ($call -eq "A") {
        switch ($response) {
            "X" { $score += (1 + 3) }
            "Y" { $score += (2 + 6) }
            "Z" { $score += (3 + 0) }
            Default {}
        }
    }
    if ($call -eq "B") {
        switch ($response) {
            "X" { $score += (1 + 0) }
            "Y" { $score += (2 + 3) }
            "Z" { $score += (3 + 6) }
            Default {}
        }
    }
    if ($call -eq "C") {
        switch ($response) {
            "X" { $score += (1 + 6) }
            "Y" { $score += (2 + 0) }
            "Z" { $score += (3 + 3) }
            Default {}
        }
    }
    $total += $score
}
Write-Host $total -ForegroundColor DarkGreen